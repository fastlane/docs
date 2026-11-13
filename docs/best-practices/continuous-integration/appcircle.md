# Appcircle Integration

[Appcircle](https://appcircle.io) is a mobile CI/CD platform for building, testing, signing and distributing iOS and Android apps. It is available as Appcircle Cloud or as a self-hosted installation.

You can use _fastlane_ with Appcircle in two ways:

- **Run your lanes on Appcircle:** add the **Fastlane** step to an Appcircle build workflow.
- **Send builds to Appcircle from any CI:** use the Appcircle _fastlane_ plugins to upload binaries to Testing Distribution, the Enterprise App Store or Publish to Stores from your lanes, wherever they run.

## Running _fastlane_ on Appcircle

### Creating a Build Profile

In Appcircle, a [build profile](https://docs.appcircle.io/build/build-process-management/profile-creation) holds the repository connection, workflows, configurations and triggers of an app for one target OS. Create a separate profile for iOS and for Android.

1. Open the **Build** module and click **New profile**.
2. Enter a name, then select the target OS (**iOS** or **Android**) and the target platform (Objective-C/Swift, Java/Kotlin, React Native or Flutter).
3. Connect the repository that contains your `fastlane` folder. You can connect to GitHub, GitLab, Bitbucket and Azure DevOps, or use any Git server via SSH or a public URL. See [connection guides](https://docs.appcircle.io/build/manage-the-connections/connection-guides) for details.

### Adding the Fastlane Step to a Workflow

A [workflow](https://docs.appcircle.io/build/build-process-management/build-workflows) is an ordered list of steps that runs on the build machine. A build profile can have several workflows, for example one for pull requests and one for releases.

1. In the build profile, click **Workflows**, select a workflow (or create one with **New**) and click **Manage Workflow**.
2. Drag the **Fastlane** step from the Workflow Marketplace and drop it after the **Git Clone** step. The step needs the cloned project files to run.
3. Click the step and configure its inputs:
    - **Fastlane Directory** (`AC_FASTLANE_DIR`): the directory that contains your `fastlane` folder and `Gemfile`. Defaults to `$AC_REPOSITORY_DIR`, the root of the cloned repository, so only change it if _fastlane_ lives in a subdirectory (for example a React Native or Flutter project's `ios` folder).
    - **Fastlane lane** (`AC_FASTLANE_LANE`): the lane to run, including the platform if you use one, for example `ios beta` or `android deploy`.
4. Click **Save**.

If a `Gemfile` exists in the _fastlane_ directory, the step runs `bundle install` and then `bundle exec fastlane <lane>`, so the _fastlane_ version and [plugins](/plugins/using-plugins/) from your `Gemfile` and `Pluginfile` are used. Without a `Gemfile`, the step installs the latest _fastlane_ release. Committing a `Gemfile` and `Gemfile.lock` is recommended (see [Setting up _fastlane_](/getting-started/ios/setup/#use-a-gemfile)).

The step's source code is available on [GitHub](https://github.com/appcircleio/appcircle-fastlane-component).

### Environment Variables and Secrets

Store credentials such as `MATCH_PASSWORD`, an [App Store Connect API key](/app-store-connect-api/) or a Google Play service account JSON in an [environment variable group](https://docs.appcircle.io/environment-variables), mark sensitive values as secret, and select the group in the build profile configuration. Your lanes can read these values with `ENV["NAME"]`.

Appcircle also provides [built-in variables](https://docs.appcircle.io/environment-variables/appcircle-specific-environment-variables) such as `AC_REPOSITORY_DIR`, `AC_OUTPUT_DIR`, `AC_GIT_BRANCH`, `AC_BUILD_NUMBER` and `AC_TRIGGER_REASON` that you can use in your lanes.

### Code Signing

You can sign your app in your lanes, for example with [_match_](/actions/match/) or by providing certificates and provisioning profiles yourself.

As an alternative, you can store certificates, provisioning profiles and Android keystores in Appcircle's [Signing Identities](https://docs.appcircle.io/signing-identities) module, select them in the build profile [configuration](https://docs.appcircle.io/build/build-process-management/configurations), and let Appcircle's build and sign steps handle signing. These steps can be used alongside the Fastlane step in the same workflow.

### Exporting Build Artifacts

Appcircle only keeps the files that are in `$AC_OUTPUT_DIR` when the **Export Build Artifacts** step runs. To see your _fastlane_ output in the build artifacts, or to send it to other Appcircle modules, write it to that directory and make sure **Export Build Artifacts** comes after the Fastlane step:

```ruby
lane :beta do
  build_app(
    scheme: "MyApp",
    output_directory: ENV["AC_OUTPUT_DIR"]
  )
end
```

### Running the Build

Start a [manual build or set up triggers](https://docs.appcircle.io/build/build-process-management/build-manually-or-with-triggers). Click **Triggers** in the build profile to run a workflow and configuration automatically on every push, on pull/merge requests, on tag pushes or on a schedule.

The full _fastlane_ output is shown in the build log in real time and stays available after the build.

## Distributing Builds with the Appcircle Plugins

Appcircle provides _fastlane_ plugins that upload builds from your lanes. They work in any environment, including Appcircle itself, other CI services and local machines.

| Plugin | Action | Purpose |
| --- | --- | --- |
| [`appcircle_testing_distribution`](https://github.com/appcircleio/fastlane_plugin_appcircle_testing_distribution) | `appcircle_testing_distribution` | Share builds with testers and testing groups. |
| [`appcircle_enterprise_app_store`](https://github.com/appcircleio/fastlane-plugin-appcircle_enterprise_app_store) | `appcircle_enterprise_app_store` | Publish in-house apps to the Enterprise App Store. |
| [`appcircle_publish`](https://github.com/appcircleio/fastlane-plugin-appcircle_publish) | `appcircle_publish` | Upload to a Publish to Stores profile and trigger its publish flow to the App Store, Google Play, Huawei AppGallery or Microsoft Intune. |

Add a plugin to your project with:

```no-highlight
fastlane add_plugin appcircle_testing_distribution
```

All plugins authenticate with an Appcircle **Personal Access Key** (previously called Personal API Token). Generate one under **Organization** > **Security** > **Personal access key** in Appcircle and store it as a secret, for example in `AC_PERSONAL_API_TOKEN`.

```ruby
lane :distribute do
  build_app(scheme: "MyApp")

  appcircle_testing_distribution(
    personalAPIToken: ENV["AC_PERSONAL_API_TOKEN"],
    profileName: "MyApp Beta",
    createProfileIfNotExists: true,
    appPath: lane_context[SharedValues::IPA_OUTPUT_PATH],
    message: "New beta build"
  )
end
```

If you use a self-hosted Appcircle installation, pass your own `authEndpoint` and `apiEndpoint` to the actions. See each plugin's README for all parameters, or run `fastlane action <action_name>`.

If you build on Appcircle, you can also send signed builds to Testing Distribution, Publish to Stores or the Enterprise App Store from the **Distribution** tab of the build profile configuration, without using the plugins.

## Further Documentation

For more information, see the [Appcircle documentation](https://docs.appcircle.io), in particular the [Fastlane workflow step](https://docs.appcircle.io/workflows/common-workflow-steps/fastlane) and the [Appcircle _fastlane_ plugins](https://docs.appcircle.io/marketplace/fastlane).
