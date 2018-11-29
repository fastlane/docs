# GitLab CI Integration

Use [GitLab Runner](https://gitlab.com/gitlab-org/gitlab-runner) running on a macOS machine
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