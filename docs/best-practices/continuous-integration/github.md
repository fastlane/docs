# GitHub Actions Integration

Use [GitHub Actions runner](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners) running on a macOS machine to build using _fastlane_.

## Repository setup

First create a `Gemfile` in the root of your project with the following content:

```ruby
source 'https://rubygems.org'

gem 'fastlane'
```

Add a workflow yaml file to your repository. For example, if naming your workflow "build-ios-app", add `.github/workflows/build-ios-app.yml` with the following content:

```yml
name: build-ios-app
on:
  push:
    branches:
      - 'master'
jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - run: fastlane beta
        env:
          MATCH_PASSWORD: ${{ secrets.MATCH_PASSWORD }}
```

See [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions) for more information on how this file works.

## Setting up the lanes

Here's an example of a `Fastfile` with a lane that runs _match_, builds the app, and uploads to TestFlight:

```ruby
platform :ios do
  lane :beta do
    setup_ci if ENV['CI']
    match(type: 'appstore')
    build_app
    upload_to_testflight(skip_waiting_for_build_processing: true)
  end
end
```

Note the usage of `setup_ci`: it creates a temporary keychain. Without this, the build could freeze and never finish.
