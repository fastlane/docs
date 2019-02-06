# Bitrise Integration

[Bitrise](https://www.bitrise.io) allows you to automatically build, test and deploy your iOS and Android apps.

## How to get started?

Using _fastlane_ for your Bitrise workflow is simple. Just add the [_fastlane_](https://www.bitrise.io/integrations/steps/fastlane) step to your
workflow [(guide)](https://devcenter.bitrise.io/getting-started/manage-your-bitrise-workflow),
after the [`Git Clone`](https://www.bitrise.io/integrations/steps/git-clone) step (and any other dependency step).

### _Have our Certificate and profile installer step in your workflow!_
You should also add/keep the `Certificate and profile installer` step in the workflow, to download your .p12 Certificates and Provisioning Profiles uploaded to [bitrise.io](https://www.bitrise.io) and to install them. **Even if you don't upload your files to Bitrise and instead you use a _fastlane_ tool to manage your code signing files you should still keep this step in the workflow**. Read more about [iOS Code Signing using third party tools](https://devcenter.bitrise.io/ios/code-signing/#use-a-third-party-tool-to-manage-your-code-signing-files).

With adding the _fastlane_ step we ensure that you are running on the latest _fastlane_ version, as it is pre-installed on all our VMs. Inside the step you can set the _fastlane_ action and we will run it automatically every time you push a new code change.

For more configuration options see the `fastlane` step's description in the Workflow Editor!

### _iOS code signing guide_
If you want to use [bitrise.io](https://www.bitrise.io) to store your code signing files, you should just follow the [iOS Code Signing guide here](https://devcenter.bitrise.io/ios/code-signing/).

## How to configure _fastlane match_ for Bitrise

If you want to use [_fastlane match_](https://github.com/fastlane/fastlane/tree/master/match)
in your [bitrise.io](https://www.bitrise.io/) build you only have to do three things:

1. Make sure that a single SSH key can be used to `git clone` both your main repository (the one
   you register on [bitrise.io](https://www.bitrise.io/)) and the `match` repository.
   You can find more info [in this guide](https://github.com/bitrise-io/devcenter/blob/master/faq/adding-projects-with-submodules).
2. Add an environment variable `MATCH_PASSWORD`, as
   [described in ](https://github.com/fastlane/fastlane/tree/master/match#encryption-password) [_match_](https://github.com/fastlane/fastlane/tree/master/match#encryption-password) ['s docs](https://github.com/fastlane/fastlane/tree/master/match#encryption-password),
   to specify the `Encryption password` you used for `match`.
   On [bitrise.io](https://www.bitrise.io/) you should add this as a `Secret Environment Variable`,
   in the [Workflow Editor](http://devcenter.bitrise.io/docs/add-your-first-step-to-your-apps-workflow).
   _Make sure to disable_ the `Replace variables in input?` option of the environment
   variable, to not to cause issues when the value includes the `$` (dollar) sign, which is used
   for environment variable expansion.

3. Make sure to use `match`'s `readonly` mode, or else `match` will try to connect
   to the Apple Developer Portal, which requires further authorization (providing additional
   username and password for Apple Dev Portal login)!
   * If you use `match` in your `Fastfile` or `fastlane` config: `match(app_identifier: "my.domain", type: "appstore", readonly: true)`
   * If you use it as a command line tool: `match development --readonly`
   * More info in `match`'s [official readme / docs](https://docs.fastlane.tools/actions/match/)

## What's next?

You can combine _fastlane_'s abilitity to define different lanes for your different deployment needs with Bitrise and run separate lanes for separate branches, automatically.
For example you can run a lane for every code push onto the `master` branch to update your
screenshots and metadata on the App Store and to release the distribution version,
and a separate lane for the `develop` branch to deploy your test releases
and all the others to ensure that nobody has broken anything.
You can simply clone the workflow as many times as you want to,
and use the `Trigger` feature of [bitrise.io](https://www.bitrise.io) to define
which Workflow to be selected for this branch / tag / pull request.
You can find more information about the Triggers feature in the
[Control what to build when, with the Trigger Map](https://devcenter.bitrise.io/builds/triggering-builds/trigger-map/) guide.

## More Information

Check out [Bitrise documentation](https://devcenter.bitrise.io/) for more.
