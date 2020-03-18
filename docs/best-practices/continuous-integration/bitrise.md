# Integrating Fastlane into Bitrise

[Bitrise](https://www.bitrise.io) is a [hosted CI/CD solution ](https://devcenter.bitrise.io/) where you can run your _fastlane_ lane with the same commands you would use locally. Bitrise’s automated Steps provide extra functionality to your lane and speed up your builds.

Here is how you can benefit from integrating _fastlane_ into Bitrise.

* Bitrise has an automated [Step](https://devcenter.bitrise.io/steps-and-workflows/getting-started-steps/), called [Fastlane Match](https://www.bitrise.io/integrations/steps/fastlane-match) for the popular [fastlane match tool](https://codesigning.guide/), which takes care of code signing your project by cloning your private certificate/profile repository and registering the certificates and profiles in the keychain.
* On Bitrise you can run separate lanes for separate branches automatically. For example, you can run a lane for every code push onto the master branch to update screenshots and metadata on the App Store and to release the distribution version. You can run a separate lane for the develop branch to run your automated tests and deploy your test releases for your QA team. You can simply clone the [Workflow](https://devcenter.bitrise.io/steps-and-workflows/getting-started-workflows/) multiple times, specify the lane to run for the given Workflow in a Workflow Specific Environment Variable, and use the [Triggers](https://devcenter.bitrise.io/webhooks/trigger-map/) feature to define which Workflow should be selected for this branch, tag or pull request.

Before you start:

* Note that two-factor authentication (2FA) is mandatory for all Apple Developer Portal accounts. If, during your build, Bitrise needs to access your Apple Developer Portal account, it will have to go through 2FA. This applies even if you use _fastlane_. To make this work, [connect your Apple Developer Account to Bitrise](https://devcenter.bitrise.io/getting-started/signing-up/connecting-apple-dev-account/). This allows Bitrise to reuse your authentication sessions for 30 days, so you do not have to manually go through 2FA on every single occasion.
* If a `Gemfile` exists in your `work_dir` directory, _fastlane_ will be used by calling `bundle install` then `bundle exec`. 
* `Fastfile` is your configuration file that can be run with _fastlane_. Make sure you have it inside your `./fastlane directory`.

## Setting up Fastlane on Bitrise

Running _fastlane_ on Bitrise is as simple as adding one [Step](https://devcenter.bitrise.io/steps-and-workflows/getting-started-steps/) to your Workflow and setting some options. Let’s see how!

1. Add the **Fastlane** Step to your Workflow by clicking the **+** sign. Make sure it is inserted right after the **Git Clone** Step. Since _fastlane_ is pre-installed on all Bitrise’s virtual machines, the **Fastlane** Step ensures that you can always use the required _fastlane_ version.
2. To code sign your project, you have a couple of options to choose from. Add one of [Bitrise’s code signing Steps](https://devcenter.bitrise.io/code-signing/ios-code-signing/code-signing-index/) to your Workflow such as
   *  **Certificate and profile installer**.
   *  **iOS Auto Provision**.
   *  **Fastlane Match.**  
3. Alternatively, use _fastlane match_ inside your fastlane lane instead of a code signing Step. Make sure you either use the **Fastlane Match** Step or set up _fastlane match_ in your lane but don’t try to do both.
4. Click the **Fastlane** Step to fill out the required fields.
5. Add your lane in the **fastlane lane** input. 
6. Use **Working directory** field if the _fastlane_ directory is not in your repository's root. The working directory should be the parent directory of your `Fastfile`'s directory. For example, if the `Fastfile` path is `./here/is/my/fastlane/Fastfile`, then the `Fastfile`'s directory is `./here/is/my/fastlane`, so the Working Directory should be `./here/is/my`.
7. The **Should update fastlane gem before run?** option will be skipped if you have a Gemfile in the `work_dir` directory. If you don't have a Gemfile and this option is enabled, then the Step tries to use and run the latest _fastlane_ version.
8. Set the **Enable verbose logging?** to `yes` if you wish to get more detailed logs on your failed builds.
9. If the **Enable collecting files to be included in build cache** is set to yes, the Step adds the following cache items (if they exist):

* Pods -> `Podfile.lock`
* Carthage -> `Cartfile.resolved`
* Android dependencies

That’s it! [Start running your build ](https://devcenter.bitrise.io/builds/Starting-builds-manually/)so that Bitrise can run your lane.
