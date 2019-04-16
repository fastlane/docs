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

Check out [the CircleCI iOS doc](https://circleci.com/docs/2.0/testing-ios/#example-configuration-for-using-fastlane-on-circleci) for more detailed examples of using fastlane on CircleCI.
