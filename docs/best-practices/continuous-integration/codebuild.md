# AWS CodeBuild Integration

Use [AWS CodeBuild Reserved Capacity Fleets](https://docs.aws.amazon.com/codebuild/latest/userguide/fleets.html) running on a macOS machine to build using _fastlane_.

## Repository setup

First create a `Gemfile` in the root of your project with the following content:

```ruby
source 'https://rubygems.org'

gem 'fastlane'
```

Add a buildspec.yml file to your repository with the following content:

```yml
version: 0.2

env:
  secrets-manager:
    MATCH_PASSWORD: <secret-id>:<json-key>:<version-stage>:<version-id>
    FASTLANE_SESSION: <secret-id>:<json-key>:<version-stage>:<version-id>

phases:
  install:
    commands:
      - bundle install
  build:
    commands:
      - bundle exec fastlane beta
```

See [Buildspec syntax for AWS CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html) for more information on how this file works.

## Setting up the lanes

Here's an example of a `Fastfile` with a lane that runs _match_, builds the app, and uploads to TestFlight:

```ruby
platform :ios do
  lane :beta do
    setup_ci
    match(type: 'appstore')
    build_app
    upload_to_testflight(skip_waiting_for_build_processing: true)
  end
end
```

Note the usage of `setup_ci`: it creates a temporary keychain. Without this, the build could freeze and never finish.
