{!docs/setup-fastlane-header.md!}

# Continuous Integration

# Best Practices

## Two-step or Two-factor auth

### Separate Apple ID for CI

The easiest way to get _fastlane_ running on a CI system is to create a separate Apple ID that doesn't have 2-factor auth enabled, with a long, randomly generated password. Additionally make sure the newly created Apple account has limited access to only the apps and resources it needs.

There are multiple reasons on why this approach is much easier:
- An Apple ID session is only valid for a certain region, meaning if your CI system is in a different region than your local machine, you'll run into issues
- An Apple ID session is only valid for up to a month, meaning you'll have to generate a new session every month. Usually you'd only know about it when your build starts failing

There is nothing _fastlane_ can do better in that regard, as these are technical limitations on how iTunes Connect sessions are handled.

Creating a separate Apple ID allows you to limit the permission scope, have a randomly generated password, and will make it much easier for you to set up CI using _fastlane_.

### Use of application specific passwords and `spaceauth`

Before going through this guide, make sure to read the section above.

If you want to upload builds to TestFlight/iTunes Connect from your CI machine, you need to generate an application specific password:

1. Visit [appleid.apple.com/account/manage](https://appleid.apple.com/account/manage)
1. Generate a new application specific password
1. Provide the application specific password using the environment variable `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

Because your CI machine will not be able to prompt you for your two-step or two-factor auth information, you also need to generate a login session for your CI machine in advance. You can get this by running:

```
fastlane spaceauth -u user@email.com
```

This will generate a token you can set using the `FASTLANE_SESSION` environment variable on your CI system.

## Environment variables to set

Most setups will need the following environment variables

- `FASTLANE_USER`: Your iTunes Connect / Dev Portal user, if your _fastlane_ setup accesses iTC or the DevPortal (e.g. submit a TestFlight build, create a profile, ...)
- `FASTLANE_PASSWORD`: Your iTunes Connect / Dev Portal password, usually only needed if you also set the `FASTLANE_USER` variable
- `MATCH_PASSWORD`: You need to provide the password of your _match_ encryption if you use _match_
- `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`: You need to provide an [application specific password](#two-step-or-two-factor-auth) if you have 2-factor enabled and use _pilot_ or _deliver_ to upload a binary to iTunes Connect
- `LANG` and `LC_ALL`: These set up the locale your shell and all the commands you execute run at. _fastlane_ needs these to be set to an UTF-8 locale to work correctly, for example `en_US.UTF-8`. Many CI systems come with a locale that is unset or set to ASCII by default, so make sure to double-check whether yours is set correctly.

## Deploy Strategy

You should **not** deploy a new App Store update after every commit, since you still have to wait 1-2 days for the review. Instead it is recommended that you use Git Tags, or custom triggers to deploy a new update.

You can set up your own ```Release``` job, which is only triggered manually.

# [fastlane.ci](https://github.com/fastlane/ci)

Since January 2018, the _fastlane_ team started working on [fastlane.ci](https://github.com/fastlane/ci), an open source, self hosted, mobile optimized CI powered by _fastlane_.

It's still an early work in progress, and will take some time to be ready for production.

# Jenkins Integration

Deploying from your own computer isn't cool. You know what's cool? Letting a remote server publish app updates for you.

_fastlane_ automatically generates a JUnit report for you. This allows Continuous Integration systems, like `Jenkins`, access the results of your deployment.

## Installation

The recommended way to install [Jenkins](http://jenkins-ci.org/) is through [homebrew](http://brew.sh/):

```no-highlight
brew update && brew install jenkins
```

From now on start `Jenkins` by running:

```no-highlight
jenkins
```

To store the password in the Keychain of your remote machine, it is recommended that you run _match_ or _deliver_ using ssh or remote desktop at least once.

## Ruby Environment
We recommend using [rbenv](https://github.com/rbenv/rbenv) for installing Ruby, though [rvm](https://rvm.io/) and the version of Ruby that comes bundled on macOS are fine too.

If using a Gemfile in your project, add an "Execute shell" step as your first build step and call `bundle update`.

## Plugins

You'll find the following Jenkins plugins to be useful:

(note: We do not recommend installing the Xcode plugin)

- **[HTML Publisher Plugin](https://wiki.jenkins-ci.org/display/JENKINS/HTML+Publisher+Plugin):** Can be used to show the generated screenshots right inside Jenkins.
- **[AnsiColor Plugin](https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin):** Used to show the coloured output of the fastlane tools. Don’t forget to enable `Color ANSI Console Output` in the `Build Environment` or your project.
- **[Rebuild Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Rebuild+Plugin):** This plugin will save you a lot of time.
- **[Keychains and Provisioning Profiles Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Keychains+and+Provisioning+Profiles+Plugin):** Manages keychains across Jenkins installations.

## Build Step

Add an "Execute shell" build step using your appropriate _fastlane_ command per the example below:

```no-highlight
fastlane appstore
```

Replace `appstore` with the lane you want to use.

(note: if using a Gemfile, prefix that command with `bundle exec`)

### setup_jenkins

You can use `setup_jenkins` action which integrates well with the [Keychains and Provisioning Profiles Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Keychains+and+Provisioning+Profiles+Plugin). Selected keychain will automatically unlocked and the selected code signing identity will be used. Also all build results, like IPA files, archives, dSYMs and result bundles will be stored in the `./output` folder in the job workspace. In additions `setup_jenkins` will create separate derived data folder for each job (in the `./derivedData`).

Under the hood `setup_jenkins` configures other actions like: _gym_, _scan_, `xcodebuild`, `backup_xcarchive` and `clear_derived_data`.

### commit_version_bump || git_commit

You can use `commit_version_bump` or `git_commit` action to commit changes to your repository in your fastlane setup. When you are using webhooks to trigger your build on a push this will cause an infinite loop of triggering builds.

#### Gitlab

When you are using Gitlab you will need the [GitLab Plugin](https://wiki.jenkins-ci.org/display/JENKINS/GitLab+Plugin). Inside the job you want to configure you go to `Build Triggers > Build when a change is pushed to GitLab > Enable [ci-skip]`.
When you include `[ci-skip]` in your build this commit won't trigger the build in jenkins at all.

**Example**  
```ruby
build_number = increment_build_number
commit_version_bump(message:"[ci-skip] Version Bump to #{build_number}")
git_commit(path:"./CHANGELOG.md", message:"[ci-skip] Updated CHANGELOG for Build #{build_number}")
push_to_git_remote
```

## Test Results and Screenshots

To show the **deployment result** right in `Jenkins`

- *Add post-build action*
- *Publish JUnit test result report*
- *Test report XMLs*: `fastlane/report.xml`

To show the **generated screenshots** right in `Jenkins`

- *Add post-build action*
- *Publish HTML reports*
- *HTML directory to archive*: `fastlane/screenshots`
- *Index page*: `screenshots.html`

Save and run. The result should look like this:

![/img/best-practices/JenkinsIntegration.png](/img/best-practices/JenkinsIntegration.png)

# CircleCI Integration

To run fastlane on CircleCI, first create a `Gemfile` in the root of your project with the following content:

```ruby
# Gemfile
source "https://rubygems.org"

gem "fastlane"
```

and run

```no-highlight
gem install bundler && bundle update
```

This will create a `Gemfile.lock` that defines all Ruby dependencies.  Make sure
to commit both files to version control.

Next, add the following to your `Fastfile`:

```ruby
# fastlane/Fastfile

...
platform :ios do
  before_all do
    setup_circle_ci
  end
  ...
end
```

The `setup_circle_ci` _fastlane_ action will perform the following actions:

* Create a new temporary keychain for use with
  [_match_](https://fastlane.tools/match) (see the [CircleCI code signing
  doc](https://circleci.com/docs/2.0/ios-codesigning/) for more details).
* Switch _match_ to readonly mode to make sure CI does not create new
  code signing certificates or provisioning profiles.
* Set up log and test result paths to be easily collectible.

Next, create a `.circleci` directory in your project and add a
`.circleci/config.yml` with the following content:

```yml
# .circleci/config.yml

version: 2
jobs:
  build:
    macos:
      xcode: "9.0"
    working_directory: /Users/distiller/project
    environment:
      FL_OUTPUT_DIR: output
      FASTLANE_LANE: test
    shell: /bin/bash --login -o pipefail
    steps:
      - checkout
      - restore_cache:
          key: 1-gems-{{ checksum "Gemfile.lock" }}
      - run: bundle check || bundle install --path vendor/bundle
      - save_cache:
          key: 1-gems-{{ checksum "Gemfile.lock" }}
          paths:
            - vendor/bundle
      - run:
          name: fastlane
          command: bundle exec fastlane $FASTLANE_LANE
      - store_artifacts:
          path: output
      - store_test_results:
          path: output/scan
```

This will do the following:
* Create and use a Ruby gems cache.
* Run the test lane on all pushes.
* Collect Junit test results and store log output in the Artifacts tab.

Check out [the CircleCI iOS
doc](https://circleci.com/docs/2.0/testing-ios/#example-configuration-for-using-fastlane-on-circleci)
for more detailed examples of using fastlane on CircleCI.

# Travis Integration

Update your `.travis.yml` to look like this:

```yml
language: objective-c
osx_image: xcode8.3
install:
  - bundle install
script:
  - fastlane beta
```

The above config files assume you have a `Gemfile` set up, if you don't have one yet, make sure to follow our [Gemfile guide](https://docs.fastlane.tools/getting-started/ios/setup/#use-a-gemfile) and run `bundle update` to make sure you're using the most recent _fastlane_ release.

Replace `beta` with the lane you want to run for your setup. If you want to build, sign and distribute builds from Travis, you'll need to add one more action to your `Fastfile`, as by default, the Travis keychain is locked.

At the top of your `Fastfile`, add

```ruby
setup_travis
```

which will setup the keychain to work well with _match_ and _gym_. This action will also enable the `readonly` mode for _match_, so your CI doesn't create new certificates or provisioning profiles.

# Bamboo Integration

## Repository setup

In bamboo under **Linked Repositories** (where you configure your git repo) under **Advanced Settings** is an option called **Exclude changesets**

This dialog will allow you to enter a regular expression that if a commit matches, a build will not be triggered.

For example, if your `Fastfile` is configured to make a commit message in the style of

```no-highlight
Build Version bump by fastlane to Version [0.3] Build [8]
```
Then you could use the following regex to ignore these commits

```no-highlight
^.*Build Version bump by fastlane.*$
```


## Setting repository remote
By default bamboo will do an anonymous shallow clone of the repo.  This will not preserve the  `git remote` information nor the list of tags.  If you are using bamboo to create commits you may want to use a code block similar to the following:


```ruby
# In prep for eventually committing a version/build bump - set the git params
sh('git config user.name "<COMMITTER USERNAME>"')
sh('git config user.email <COMITTER EMAIL>')

# Bamboo does an anonymous checkout so in order to update the build versions must set the git repo URL
git_remote_cmd = 'git remote set-url origin ' + ENV['bamboo_repository_git_repositoryUrl']
sh(git_remote_cmd)
```


## Speeding up build times with carthage

Carthage is a wonderful dependency manager but once you are start using a large number of frameworks, things can start to slow down, especially if your CI server has to run `carthage` EVERY time you check in a small line of code.

One way to make build times faster is to break your work up into two separate build plans (*this can get even more funky if you start having multiple branches*)

The general idea is to make a build plan: **Project - Artifacts** that builds the `Carthage` directory and stores it as a shared artifact.  Then you create a second build plan **Project - Fastlane** that pulls down the `Carthage` directory and runs _fastlane_.


### Artifact Plan

Use a simple setup to create this build plan. First off you want to make sure this plan is manually triggered only - because you only need to run it whenever the `Cartfile` changes as opposed to after ever single commit.  It could also be on a nightly build perhaps if you desire.

#### Stages / Jobs / Tasks
This plan consists of 1 Job, 1 Stage and 2 Tasks

* Task 1: **Source Code Checkout**
* Task 2: **Script** (`carthage update`)

#### Artifact definitions

Create a shared artifact with the following info:

* **Name:** CarthageFolder
* **Location:** (leave blank)
* **Copy Pattern:** Carthage/Build/**

*Optional*: You may want to automatically make the **fastlane plan** trigger whenever this plan is built

### _fastlane_ plan

When configuring _fastlane_ to run in this setup you need to make sure that you are not calling either:

```ruby
reset_git_repo(force: true)
```
or

```ruby
ensure_git_status_clean
```

as these calls will either fail the build or delete the `Carthage` directory.  Additionally you want to remove any `carthage` tasks from inside your `Fastfile` as `carthage` is now happening externally to the build.

#### Build plan setup

What this build plan does is it checks out the source code, then it downloads the entire `Carthage/Build/` directory into your local project - which is exactly what would be created from `carthage bootstrap` and then it runs _fastlane_

* Task 1: **Source Code Checkout**
* Task 2: **Artifact Download**
* Task 3: **fastlane**

# GitLab CI Integration

Use [GitLab CI Runner](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner) running on a macOS machine
to build using fastlane.

## Repository setup

First create a `Gemfile` in the root of your project with the following content:

```ruby
source "https://rubygems.org"

gem "fastlane"
```

Add a `.gitlab-ci.yml` file to trigger _fastlane_.

```yml
stages:
  - unit_tests
  - test_flight

variables:
  LC_ALL: "en_US.UTF-8"
  LANG: "en_US.UTF-8"

before_script:
  - gem install bundler
  - bundle install

unit_tests:
  dependencies: []
  stage: unit_tests
  artifacts:
    paths:
      - fastlane/screenshots
      - fastlane/logs
  script:
    - fastlane tests
  tags:
    - ios

test_flight_build:
  dependencies: []
  stage: test_flight
  artifacts:
    paths:
      - fastlane/screenshots
      - fastlane/logs
  script:
    - fastlane beta
  tags:
    - ios
  only:
     - /^release-.*$/
     - master
```

See [the `.gitlab-ci.yml` documentation](https://docs.gitlab.com/ce/ci/yaml/README.html)
for more information on how this file works.

## Setting up the lanes
You should have a lane - in this example called `beta` - which should do the usual, _match_, _gym_, _pilot_, to distribute an updated Test Flight version, and one lane `tests` which calls _scan_ to run UI Tests.

## Auto-incremented build number.
To get an auto-incremented build number you can use something like the following lane:

```ruby
lane :increment_build_number do
  increment_build_number(build_number: ENV['CI_BUILD_ID'])
end
```

Then the GitLab CI build ID (which iterates on each build) will be used.

# Visual Studio Team Services
Microsoft Visual Studio Team Services (VSTS) and Team Foundation Server (TFS) use _fastlane_ in their [Apple App Store](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.app-store) extension.

## Getting Started
Once you have created or retrieved credentials for your App Store account, then perform the following steps to automate releasing updates from a VSTS build or release definition:

1. Install the App Store extension from the VSTS Marketplace
1. Go to your VSTS or TFS project, click on the **Build** tab, and create a new build definition (the "+" icon) that is hooked up to your project's appropriate source repo
1. Click **Add build step...** and select the necessary tasks to generate your release assets (e.g. Gulp, Cordova Build)
1. Click **Add build step...** and select **App Store Release** from the **Deploy** category
1. Configure the **App Store Release** task with the desired authentication method, the generated IPA file path, and the desired release track.

Now when you build, your app will automatically be published to _iTunes Connect_!

## Configuring _fastlane_ versions
The extension can be configured to install the latest version of _fastlane_ or a specific version of _fastlane_:

1. In the Build for your project, click on the **Apple App Store** task (supported in both `Apple App Store Release` and `Apple App Store Promote`), go to the **Advanced** section of the Task, click **Install fastlane**
1. Optionally, select **Specific Version** from `fastlane version`, and enter a specific version of _fastlane_

## More Information
For more documentation, see the [Apple App Store](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.app-store) in the Visual Studio Team Server marketplace.
