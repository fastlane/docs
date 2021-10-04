# Appcircle Integration

[Appcircle](https://appcircle.io) is a mobile CI/CD platform that provides a fully automated environment to build and deploy apps, which also supports _fastlane_ for build automation.

With Appcircle, you can automate your build and signing processes with the flexible workflow structure and you can also use _fastlane_ as a workflow step within the build workflows. To use _fastlane_, Appcircle expects the presence of a fastfile in your repository.

## Creating a Build Profile to Connect Your Repository with a Fastfile

In Appcircle, a [build profile](https://docs.appcircle.io/build/adding-a-build-profile) contains the build workflows and the configuration of an app per target platform. (i.e. separate for iOS and Android).

1.  To create your first build profile, go to the "**Build Module**". (The first item on the left menu) and click on the orange "**Add New**" button on the top right of the screen.
2.  In the next screen, enter a name for your build profile and select the target operating system (iOS or Android) and the target platform (Obj-C/Swift, Java/Kotlin, React Native and Flutter projects are supported). If you have two different targets in your project for iOS and Android, you need to create two separate profiles. This allows you to manage separate build workflows for different operating systems.
3.  Once created, click on the build profile to connect your repository that contains a fastfile. You can connect private and public repositories on GitHub, Bitbucket and other compatible git providers. You can authorize Appcircle to connect to your cloud repository provider account. This will allow you to use auto-build your project with hooks.
4.  The build configuration has different flows for iOS and Android and the projects are configured on a branch basis. You can have different configurations for different branches and you can build any of your commits (assuming that they are compatible with the current configuration).
5.  You can use _fastlane_ with the signing configuration defined in the lane or you can configure your build to use [Appcircle centralized code signing](https://app.gitbook.com/@smartface/s/appcircle/signing-identities/) as an alternative to _fastlane_ match.


## Adding _fastlane_ to the Appcircle Build Workflow as a Step

1.  A [workflow](https://docs.appcircle.io/workflows/why-to-use-workflows) in Appcircle is a ladder of steps taken to build your applications. Each step has a different purpose and the workflow can be customized by modifying step parameters and inputs, running custom scripts or re-ordering steps.
2.  To utilize _fastlane_ in your builds, open the [workflow editor](https://docs.appcircle.io/workflows/why-to-use-workflows) and add the "**fastlane**" step after the "**Git Clone**" step. If you want to run a specific _fastlane_ command, you can add a "**Custom Script**" step anywhere after the _fastlane_ step.
3.  Once added, click on the _fastlane_ step to configure it. Fastlane is easy to use with Appcircle just with two options.
4.  The "**Fastlane Directory**" option is used to specify the fastfile path . If you keep your fastfile in its default location, it is automatically used without the need to change this field.
5.  With the "**Fastlane Lane**" option, you can specify which lane to use.
6.  Once everything is set up, press **Save** to save your step configuration. Then you can configure and run your build just like any other app.

Appcircle also supports building and signing the app independently with the "Build" and "Sign" steps in the workflow. These steps can be used in parallel with _fastlane_.

## Running the Build Workflow

To run the build workflow that includes the _fastlane_ step, you can start a [manual build or trigger an automatic build](https://docs.appcircle.io/build/build-manually-or-with-triggers).
The full output of the _fastlane_ execution can be viewed in the build log in real-time or after the build.

## Deploying the Build Output

You can use _fastlane_ to deploy the built apps to the supported third-party services or you can use the [Appcircle Distribute module](https://docs.appcircle.io/distribute/create-or-select-a-distribution-profile) to share the app with the testers or send it to the public app stores.

## Further Documentation

For more information, screenshots, and support, please refer to the [Appcircle documentation](https://docs.appcircle.io).