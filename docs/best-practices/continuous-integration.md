# Continuous Integration

# Best Practices

## 2 factor auth

If your account is protected using 2 step verification, you can get a login token by running

```
spaceauth -u user@email.com
```

This will generate a token you can set using the `FASTLANE_SESSION` environment variable on your CI system.

## Deploy Strategy

You should **not** deploy a new App Store update after every commit, since you still have to wait 1-2 days for the review. Instead it is recommended that you use Git Tags, or custom triggers to deploy a new update.

You can set up your own ```Release``` job, which is only triggered manually.

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

## Plugins

You'll find the following Jenkins plugins to be useful:

- **[HTML Publisher Plugin](https://wiki.jenkins-ci.org/display/JENKINS/HTML+Publisher+Plugin):** Can be used to show the generated screenshots right inside Jenkins.
- **[AnsiColor Plugin](https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin):** Used to show the coloured output of the fastlane tools. Don’t forget to enable `Color ANSI Console Output` in the `Build Environment` or your project.
- **[Rebuild Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Rebuild+Plugin):** This plugin will save you a lot of time.
- **[Keychains and Provisioning Profiles Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Keychains+and+Provisioning+Profiles+Plugin):** Manages keychains across Jenkins installations.

## Build Step

Use the following as your build step:

```no-highlight
fastlane appstore
```

Replace `appstore` with the lane you want to use.

### setup_jenkins

You can use `setup_jenkins` action which integrates well with the [Keychains and Provisioning Profiles Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Keychains+and+Provisioning+Profiles+Plugin). Selected keychain will automatically unlocked and the selected code signing identity will be used. Also all build results, like IPA files, archives, dSYMs and result bundles will be stored in the `./output` folder in the job workspace. In additions `setup_jenkins` will create separate derived data folder for each job (in the `./derivedData`).

Under the hood `setup_jenkins` configures other actions like: _gym_, _scan_, `xcodebuild`, `backup_xcarchive` and `clear_derived_data`.

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

# Circle Integration

To run fastlane on Circle as your CI, first create a `Gemfile` in the root of your project with the following content

```ruby
source "https://rubygems.org"

gem "fastlane"
```

and run

```no-highlight
gem install bundler && bundle update
```

This will create a `Gemfile.lock`, that defines all Ruby dependencies. Make sure to commit both files to version control.

Next, use the following `circle.yml` file

```yml
machine:
  xcode:
    version: "7.3"
dependencies:
  override:
    - bundle check --path=vendor/bundle || bundle install --path=vendor/bundle --jobs=4 --retry=3 --without development
  cache_directories:
    - vendor/bundle
test:
  override:
    - bundle exec fastlane test
```

This will automatically cache the installed gems on Circle, making your CI builds much faster!

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

####Stages / Jobs / Tasks
This plan consists of 1 Job, 1 Stage and 2 Tasks

* Task 1: **Source Code Checkout**
* Task 2: **Script** (`carthage update`)

####Artifact definitions

Create a shared artifact with the following info:

* **Name:** CarthageFolder
* **Location:** (leave blank) 
* **Copy Pattern:** Carthage/Build/** 

*Optional*: You may want to automatically make the **fastlane plan** trigger whenever this plan is built

### _fastlane_ plan

When configuring fastlane to run in this setup you need to make sure that you are not calling either:

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
* Task 3: **Fastlane**

# Gitlab-CI Integration
Use [Gitlab-CI Runner](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner) running on an MacOS machine
to build using fastlane.

## Setting up Repository

Add a `.gitlab-ci.yml` file, to trigger _fastlane_.

```yml
stages:
  - unit_tests
  - testflight
variables:
  LC_ALL: "en_US.UTF-8"
  LANG: "en_US.UTF-8"
Testflight Build:
  dependencies: []
  stage: testflight
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
Unit Tests:
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
```

## Setting up the lanes
You should have a lane, in this example called `beta` - wich should do the usual, _match_, _gym_, _pilot_, to distribute an updated testflight version, and  one lane `tests` wich calls _scan_ to run uitests.

## Auto Incemented Build Number.
To get an auto incremented Build-Number you can use something like the following lane:
then the gitlab build-id (wich is counting up each build) will be used.
```ruby
lane :increment_build_number do
  increment_build_number(build_number: ENV['CI_BUILD_ID'])
end
```

