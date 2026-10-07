# Capawesome Cloud Integration

[Capawesome Cloud](https://capawesome.io/docs/cloud/) is a mobile CI/CD platform for Capacitor, Ionic, Cordova, and native iOS and Android apps. It builds and signs apps on hosted macOS machines, submits them to TestFlight, App Review and Google Play, and ships over-the-air Live Updates to the web layer of Capacitor and Cordova apps.

You can combine it with *fastlane* in both directions:

- [Run *fastlane* in a Capawesome Cloud build](#running-fastlane-in-a-capawesome-cloud-build). *fastlane* is pre-installed on every build stack, so a lane can prepare the project before Capawesome Cloud compiles it.
- [Call Capawesome Cloud from a lane](#calling-capawesome-cloud-from-a-lane). Keep *fastlane* as your release orchestrator and let Capawesome Cloud run the native build, the store upload or a Live Update.

## Running *fastlane* in a Capawesome Cloud build

Capawesome Cloud runs an npm script from your `package.json` to produce the web assets before it compiles the native project. It uses the `capawesome:build` script when present and falls back to `build` otherwise. Add your lane to that script to run it before the build. If your repository has a `Gemfile`, use `bundle exec`; Bundler is pre-installed as well. You can find the pre-installed *fastlane* version for each build stack [here](https://capawesome.io/docs/cloud/native-builds/build-stacks/).

```json
{
  "scripts": {
    "build": "vite build",
    "capawesome:build": "bundle install && bundle exec fastlane prepare && npm run build"
  }
}
```

If you prefer to keep `package.json` untouched, set `webBuildCommand` in `capawesome.config.json` instead. See [Configure Web Build Script](https://capawesome.io/docs/cloud/native-builds/web-build-script/).

A typical `prepare` lane sets the native build number from the build number Capawesome Cloud assigns to each build. Every build exposes `CI`, `CI_BUILD_NUMBER`, `CI_GIT_COMMIT_SHA` and `CI_PLATFORM`, among others (see the [environment variables reference](https://capawesome.io/docs/cloud/native-builds/environment-variables/)):

```ruby
desc "Prepare the native projects before Capawesome Cloud builds them"
lane :prepare do
  increment_build_number(
    build_number: ENV["CI_BUILD_NUMBER"],
    xcodeproj: "ios/App/App.xcodeproj"
  )
end
```

Secrets your lanes need, such as an App Store Connect API key, go into a Capawesome Cloud [environment](https://capawesome.io/docs/cloud/native-builds/environments/). Add them as **secrets** so they're encrypted and never appear in build logs, and select the environment with `--environment` when you trigger a build.

Capawesome Cloud stores your [certificates](https://capawesome.io/docs/cloud/native-builds/certificates/), keystores and provisioning profiles and signs the app with the certificate you select for the build, so *match* and *sigh* are not needed in a Capawesome Cloud build. If your `prepare` lane calls them, guard those steps with the `CI` variable.

## Calling Capawesome Cloud from a lane

The lanes below call the [Capawesome CLI](https://capawesome.io/docs/cloud/cli/). They work from your machine or from any CI that runs *fastlane*.

1. Create an [API token](https://capawesome.io/docs/cloud/accounts/tokens/) in the Capawesome Cloud Console and expose it as the `CAPAWESOME_TOKEN` environment variable. The CLI reads it automatically, so no login step is needed.
2. Find your App ID in the app settings of the Capawesome Cloud Console. The examples read it from `CAPAWESOME_CLOUD_APP_ID`.
3. Node.js must be available on the machine running *fastlane*, since the CLI runs through `npx`.

The CLI only prompts for missing values when it runs in a terminal and the `CI` environment variable is unset; otherwise it exits with a non-zero code. Pass every required value as a flag, and add `--yes` to `apps:builds:create` to skip its confirmation prompt.

Pin the CLI version for reproducible runs. The examples share a constant at the top of the `Fastfile`:

```ruby
# fastlane/Fastfile
CAPAWESOME_CLI = "@capawesome/cli@4.26.1"
```

### Triggering a cloud build

If *fastlane* already orchestrates your releases (versioning, changelogs, notifications), you can keep it and run the native build itself in Capawesome Cloud:

```ruby
desc "Build the current commit in Capawesome Cloud"
lane :cloud_build do |options|
  platform = options[:platform] || "ios"
  type = options[:type] || (platform == "ios" ? "app-store" : "release")
  certificate = options[:certificate] || UI.user_error!("Pass certificate:<name of a certificate in Capawesome Cloud>")

  sh("npx", CAPAWESOME_CLI, "apps:builds:create",
     "--app-id", ENV["CAPAWESOME_CLOUD_APP_ID"],
     "--platform", platform,
     "--type", type,
     "--certificate", certificate,
     "--git-ref", last_git_commit[:commit_hash],
     "--yes")
end
```

Run it with:

```sh
fastlane cloud_build platform:ios "certificate:App Store Distribution"
fastlane cloud_build platform:android type:release "certificate:Play Store Keystore"
```

Capawesome Cloud fetches the commit from your repository, so it needs access to it (see [Git integrations](https://capawesome.io/docs/cloud/integrations/)) and the commit must be pushed before the lane runs. To build uncommitted files instead, pass `--path .` instead of `--git-ref` (see [Build without Git](https://capawesome.io/docs/cloud/native-builds/build-without-git/)).

`--certificate` is the name of a signing certificate or keystore you uploaded to Capawesome Cloud; it is required for signed build types. Build types are `simulator`, `development`, `ad-hoc`, `app-store` and `enterprise` for iOS, and `debug` and `release` for Android. `apps:builds:create` waits for the build to finish and exits with a non-zero code if it fails, so the lane fails with it.

### Submitting to the stores

To build and submit in one step, add `--destination` with the name of a [destination](https://capawesome.io/docs/cloud/app-store-publishing/destinations/) configured in Capawesome Cloud, and optionally `--release-notes`. To keep uploading with *fastlane* instead, download the signed artifact with `--ipa`, `--apk` or `--aab` and hand it to *pilot*, *deliver* or *supply*:

```ruby
desc "Build in Capawesome Cloud, then upload with deliver"
lane :release do
  sh("npx", CAPAWESOME_CLI, "apps:builds:create",
     "--app-id", ENV["CAPAWESOME_CLOUD_APP_ID"],
     "--platform", "ios",
     "--type", "app-store",
     "--certificate", "App Store Distribution",
     "--git-ref", last_git_commit[:commit_hash],
     "--ipa", "./build/App.ipa",
     "--yes")

  deliver(ipa: "./build/App.ipa", skip_screenshots: true)
end
```

See the [CLI reference](https://capawesome.io/docs/cloud/cli/commands/#appsbuildscreate) for all options.

### Publishing a Live Update

Capawesome Cloud [Live Updates](https://capawesome.io/docs/cloud/live-updates/) let you ship changes to the web layer of a Capacitor or Cordova app (HTML, CSS, JavaScript, images) without going through the app stores. Your existing lanes keep handling native builds and store submissions; you only add one lane for over-the-air updates.

This requires the [Live Update SDK](https://capawesome.io/docs/sdks/capacitor/live-update/) in your app and a published native binary that already includes it. Live Updates can only deliver [binary-compatible changes](https://capawesome.io/docs/cloud/live-updates/binary-compatible-changes/). Changes to native code, plugins or the Capacitor version still need a regular store release.

A bundle that uses a plugin or native API missing from an older binary will break that binary. The recommended pattern is one channel per native build number, so every binary only receives bundles built for it. The app subscribes to its channel natively at build time or at runtime (see [Channels](https://capawesome.io/docs/cloud/live-updates/channels/)), and your lane publishes to the matching one:

```ruby
desc "Build the web assets and publish a Live Update for the given native build number"
lane :live_update do |options|
  build_number = options[:build_number] || get_build_number(xcodeproj: "ios/App/App.xcodeproj")
  channel = "production-#{build_number}"

  sh("npm", "run", "build")

  # Create the channel if it doesn't exist yet; --ignore-errors makes this a no-op when it does.
  sh("npx", CAPAWESOME_CLI, "apps:channels:create",
     "--app-id", ENV["CAPAWESOME_CLOUD_APP_ID"],
     "--name", channel,
     "--ignore-errors")

  sh("npx", CAPAWESOME_CLI, "apps:liveupdates:upload",
     "--app-id", ENV["CAPAWESOME_CLOUD_APP_ID"],
     "--path", "dist",
     "--channel", channel)
end
```

Run it with:

```sh
fastlane live_update
# or target a specific native build number explicitly
fastlane live_update build_number:42
```

Replace `dist` with the output directory of your web build (for example `www`). One bundle serves both iOS and Android as long as both platforms share the same build number; if they don't, run the lane once per platform with the matching `build_number`. If you prefer a single channel, use `--ios-min`, `--ios-max`, `--android-min` and `--android-max` to restrict a bundle to a range of native build numbers instead. Add `--rollout-percentage 10` to release to a subset of devices first and raise it later from the Console or the CLI. See the [CLI reference](https://capawesome.io/docs/cloud/cli/commands/#appsliveupdatesupload) for all options.

## Further documentation

For more information, please refer to the [Capawesome Cloud documentation](https://capawesome.io/docs/cloud/).
