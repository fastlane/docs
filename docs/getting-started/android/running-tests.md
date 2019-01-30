{!docs/includes/setup-fastlane-header.md!}

# Running Android tests using _fastlane_

To run your unit tests using fastlane, add the following to your `Fastfile`

```ruby
lane :tests do
  gradle(task: "test")
end
```

Replace `"test"` with the gradle task name for running unit tests of your app.

Additionally you can specify more options for building and testing your app, check out the [list of all available parameters](/actions/gradle/)

To use the newly created lane, just run
```no-highlight
fastlane tests
```

## Setting up _fastlane_ to run on CI

To run Android tests using _fastlane_ on a Continuous Integration service, check out [the Continuous Integration docs](/best-practices/continuous-integration/).

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

## Posting build results

If you want to post test results on Slack, Hipchat or other team chat client, check out the available [fastlane actions](/actions/#notifications).

### Build failures

#### Hipchat

To post a message when _fastlane_ encounters a test or build failure, add the following to your `Fastfile`:

```ruby
error do |ex|
  hipchat(message: "Tests have failed!",
          channel: "Room or @username",
          success: false)
end
```

#### Other services

The above example uses Hipchat, but _fastlane_ supports [many other services out there](/actions/#notifications). 
