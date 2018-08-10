{!docs/includes/setup-fastlane-header.md!}

# Running iOS tests using _fastlane_

To run your unit tests or UI tests using fastlane, add the following to your `Fastfile`

```ruby
lane :tests do
  run_tests(scheme: "MyAppTests")
end
```

Additionally you can specify more options for building and testing your app, for example

```ruby
lane :tests do
  run_tests(workspace: "Example.xcworkspace",
            devices: ["iPhone 6s", "iPad Air"],
            scheme: "MyAppTests")
end
```

Check out the [list of all available parameters](/actions/run_tests/#parameters)

To use the newly created lane, just run
```no-highlight
fastlane tests
```

## Setting up _fastlane_ to run on CI

To run iOS tests using _fastlane_ on a Continuous Integration service, check out [the Continuous Integration docs](/best-practices/continuous-integration/).

Since _fastlane_ stores all configuration in simple configuration files, and runs via the command line, it supports every kind of CI system.

We also prepared some docs to help you get started with some of the popular CI systems.

**Self-Hosted CIs**

- [Jenkins](/best-practices/continuous-integration/#jenkins-integration)
- [Bamboo](/best-practices/continuous-integration/#bamboo-integration)
- [GitLab](/best-practices/continuous-integration/#gitlab-ci-integration)

**Hosted CIs**

- [Circle](/best-practices/continuous-integration/#circleci-integration)
- [Travis](/best-practices/continuous-integration/#travis-integration)
- [Visual Studio](/best-practices/continuous-integration/#visual-studio-team-services)

If your CI system isn't listed here, no problem, _fastlane_ runs on any CI. To trigger _fastlane_, just add the command you would usually run from your terminal:

```no-highlight
fastlane tests
```

### Setting up the environment

- [Support for Two-step or Two-factor auth](/best-practices/continuous-integration/#two-step-or-two-factor-auth)
- [Environment variables to set](/best-practices/continuous-integration/#environment-variables-to-set)

## Posting build results

If you want to post test results on Slack, Hipchat or other team chat client, check out the available [fastlane actions](/actions/#notifications).

### Build failures

#### Slack

If you're using Slack, this is already built-into the default `run_tests` action, just provide your Slack URL:

```ruby
lane :tests do
  run_tests(scheme: "MyAppTests",
            slack_url: "https://hooks.slack.com/services/T03N...",
            slack_channel: "#channel")
end
```

To get the `slack_url`, create an `Incoming WebHook` for your Slack group.

#### Other services

To post a message when _fastlane_ encounters a test or build failure, add the following to your `Fastfile`:

```ruby
error do |ex|
  hipchat(message: "Tests have failed!",
          channel: "Room or @username",
          success: false)
end
```

The above example uses Hipchat, but _fastlane_ supports [many other services out there](/actions/#notifications). 

