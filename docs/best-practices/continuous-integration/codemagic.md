# Codemagic Integration

[Codemagic](https://codemagic.io/) is a cloud-based CI/CD tool for mobile applications that you can use for continuous integration and delivery together with *fastlane*. Codemagic has *fastlane* pre-installed, so you can easily run your *fastlane* scripts as part of the Codemagic build process. You only need a Fastfile in your repository to get started.

## Add your app to Codemagic

1. Click **Add application** on Codemagic dashboard.
2. Choose whether to add your application via a supported Git provider or add it manually using the other [available authentication methods](https://docs.codemagic.io/getting-started/adding-apps-from-custom-sources/).
3. Select the project type and confirm adding the application.

## Configure your workflow

Once you've added the application, configure the build workflow in a [codemagic.yaml](https://docs.codemagic.io/getting-started/yaml/) file and commit it to the root directory of the repository. 

Save your keys and other sensitive information as environment variables in the `environment` section of `codemagic.yaml`. Make sure to [encrypt](https://docs.codemagic.io/building/encrypting/) the values in Codemagic so as not to expose them. Note that if you encrypt a key file, it will be base64-encoded and would have to be decoded during the build.

```yaml
    environment:
      vars:
        MATCH_PASSWORD: Encrypted(...)
        MATCH_SSH_KEY: Encrypted(...)
        FASTLANE_USER: Encrypted(...)
        FASTLANE_PASSWORD: Encrypted(...)
        FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD: Encrypted(...)
        ANDROID_KEYSTORE: Encrypted(...)
        ANDROID_KEY_PROPERTIES: Encrypted(...)
        GOOGLE_PLAY_JSON: Encrypted(...)
```

In the `scripts` section, decode the encoded key files and add the commands to run the lanes.

```yaml
    scripts:
      - echo $GOOGLE_PLAY_JSON | base64 --decode > google_play.json
      - bundle install
      - bundle exec fastlane setup_keychain
      - |
        # set up release keystore & key.properties
        echo $ANDROID_KEYSTORE | base64 --decode > "$FCI_BUILD_DIR/android/app/itc-release.keystore"
        echo $ANDROID_KEY_PROPERTIES | base64 --decode > "$FCI_BUILD_DIR/android/key.properties"
      - |
        # set up local properties
        echo "flutter.sdk=$HOME/programs/flutter" > "$FCI_BUILD_DIR/android/local.properties"
      - bundle exec fastlane android deploy
      - find . -name "Podfile" -execdir pod install \;
      - bundle exec fastlane ios deploy
```

## External dependencies

Codemagic does not automatically install CocoaPods, Carthage or any other external dependencies for _fastlane_ projects. Please use the _fastlane_'s built-in [actions](https://docs.fastlane.tools/actions/), such as [`cocoapods`](https://docs.fastlane.tools/actions/cocoapods/) and [`carthage`](https://docs.fastlane.tools/actions/carthage/), to gain control of that.

## Code signing

To perform code signing on your iOS app, you can either follow the best practices laid out in [`fastlane` docs](https://docs.fastlane.tools/codesigning/getting-started/#using-match), or you could also make use of [Codemagic's standard code signing methods](https://docs.codemagic.io/code-signing-yaml/signing-ios/).

When invoking [`match`](https://docs.fastlane.tools/actions/match/) from the `Fastfile`, keep in mind that you need to **grant access to the credentials repository** and expose the **_match_ passphrase** during the build. The _match_ passphrase can be defined as a `MATCH_PASSWORD` environment file — this will be automatically detected by _fastlane_ and used to decrypt the credentials repository. You can upload the SSH key for cloning the credentials repository as an environment variable, i.e. `MATCH_SSH_KEY`. 

## Publish your build artifacts

You can use either `fastlane` to take care of artifact distribution or choose from a number of [Codemagic's own integrations](https://docs.codemagic.io/publishing-yaml/distribution/).

## Manage build versions

To make your [build version management](https://docs.codemagic.io/building/build-versioning/) easy, Codemagic exports the `BUILD_NUMBER` environment variable that you can use in your build script. For instance, you could make use of it within [`increment_version_number`](https://docs.fastlane.tools/actions/increment_version_number/) action to define a new version for each build.

## More information

Check out [Codemagic documentation](https://docs.codemagic.io/) for more.
