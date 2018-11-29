# Nevercode Integration

With [Nevercode](https://nevercode.io) you can set up automated builds for your Android and iOS application using _fastlane_. You only need a [`Fastfile`](https://docs.fastlane.tools/#fastlane) in your repository to get started.

## Specify app repository

1. Click **Add a new app** on Nevercode dashboard.
1. Choose whether to add your application via supported providers using OAuth or add it manually using the other available [authentication methods](https://developer.nevercode.io/docs/authenticating-repository-access).

## Define the lane to be built

After specifying app repository, Nevercode takes a first look at it by listing the `branches` in this repository. The next step for you is to select the branch you want Nevercode to scan for projects.

1. Select a `branch` from the dropdown that Nevercode should scan. **Note** that you can change the branch later if needed.
1. Click **Scan branch**.
Nevercode scans the repository from the specified branch. This includes cloning the repository, looking up the available `Fastfiles` and listing the pre-configured `lanes`. All this can be monitored real-time from your browser via the live log window.
1. Once scanning the branch has finished, choose the `lane` which will be executed as the main build step by Nevercode.
1. Finalize the setup by checking the appropriate [build options](https://developer.nevercode.io/docs/build-configuration#section-general-build-settings) and click **Save and start build**.

## External dependencies

Nevercode does not automatically install CocoaPods, Carthage or any other external dependencies for _fastlane_ projects. Please use the _fastlane_'s built-in [actions](https://docs.fastlane.tools/actions/), such as [`cocoapods`](https://docs.fastlane.tools/actions/cocoapods/) and [`carthage`](https://docs.fastlane.tools/actions/carthage/), to gain control of that.

## Code signing

To perform code signing on your iOS app, you can either follow the best practices laid out in [`fastlane` docs](https://docs.fastlane.tools/codesigning/getting-started/#using-match), or you could also make use of [Nevercode's standard code signing methods](https://developer.nevercode.io/docs/code-signing).

When invoking [`match`](https://docs.fastlane.tools/actions/match/) from the `Fastfile`, keep in mind that you need to **grant access to the credentials repository** and expose the **_match_ passphrase** during the build. Both can be securely achieved thanks to the well designed environment variable support of _fastlane_ and Nevercode's support for several SSH keys for authentication.

In your app settings on Nevercode, navigate to the **Environment** tab to manage environment variables and files:

* _match_ passphrase can be defined as a `MATCH_PASSWORD` environment file — this will be automatically detected by _fastlane_ and used to decrypt the credentials repository.
* You can upload the SSH key for cloning the credentials repository as an environment file, i.e. `MATCH_SSH_KEY`. All environment files whose variable name has the suffix `_SSH_KEY` will be automatically added to the SSH agent and will be ready for use during the whole build process.

## Run tests

### iOS

Testing in Nevercode with _fastlane_ for iOS is 100% automatic. By default, [`scan`](https://docs.fastlane.tools/actions/scan/) is used to invoke the test run, but you can easily swap it out for any other `lane` that you have configured for your test runs. Test results are automatically collected and you don't need to do anything to convert the results from one format to another or place them in a special location on the build machine.

#### Warning

In case you wish to run tests as part of the main build step, we suggest that you use [Trainer](https://github.com/KrauseFx/trainer#use-with-fastlane) to generate reliable JUnit results from the test run and put the results in a directory where we can discover them:

```no-highlight
trainer(output_directory: ENV["NEVERCODE_XUNIT_RESULTS_DIR"])
```

### Android

Nevercode detects your **_fastlane_ tests for Android** automatically. However, tests are disabled by default and have to be enabled manually.

1. In your app settings on Nevercode, navigate to the **Test** tab.
1. Click on **_fastlane_ Gradle** to expand it.
1. Select **Enabled** and type the **lane name** for tests as specified in your `Fastfile`.
1. If you would like to run the tests on Android emulator, make sure to select **Require Android emulator**.
1. Click **Save** to finish the setup. Your _fastlane_ tests will be enabled and run each time you build your app.

## Publish your build artifacts

You can use either `fastlane` to take care of artifact distribution or choose from a number of [Nevercode's own integrations](https://developer.nevercode.io/docs/what-kind-of-build-distribution-services-does-nevercode-support).

## Manage build versions

To make your build version management easy, Nevercode exports the `NEVERCODE_BUILD_NUMBER` environment variable that you can use in your build script. For instance, you could make use of it within [`increment_version_number`](https://docs.fastlane.tools/actions/increment_version_number/) action to define a new version for each build.

## More Information

Check out [Nevercode documentation](https://developer.nevercode.io/docs) for more.