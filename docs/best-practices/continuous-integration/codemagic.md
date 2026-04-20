# Codemagic Integration

[Codemagic](https://codemagic.io/) is a cloud-based CI/CD tool for mobile applications that you can use for continuous integration and delivery together with *fastlane*. Codemagic has *fastlane* pre-installed, so you can easily run your *fastlane* scripts as part of the Codemagic build process. You only need a Fastfile in your repository to get started. You can find the version of pre-installed *fastlane* based on build machine type from [here](https://docs.codemagic.io/specs/machine-type/).

## Getting started

For publishing iOS apps, it is recommended to create an App Store Connect API key so you don't have to use 2FA. This also offers better performance and increased reliability. More details can be found [here](https://docs.fastlane.tools/app-store-connect-api/).

## Adding environment variables

The following **environment variables** need to be added to your workflow for *fastlane* integration. 

- `MATCH_PASSWORD` - the password used to encrypt/decrypt the repository used to store your distribution certificates and provisioning profiles.
- `MATCH_KEYCHAIN` - an arbitrary name to use for the keychain on the Codemagic build server, e.g "fastlane_keychain"
- `MATCH_SSH_KEY` - an SSH private key used for cloning the Match repository that contains your distribution certificates and provisioning profiles. The public key should be added to your GitHub account. See [here](https://docs.codemagic.io/configuration/access-private-git-submodules/) for more information about accessing Git dependencies with SSH keys.
- `APP_STORE_CONNECT_PRIVATE_KEY` - the App Store Connect API key. Copy the entire contents of the .p8 file and paste into the environment variable value field.
- `APP_STORE_CONNECT_KEY_IDENTIFIER` - the key identifier of your App Store Connect API key.
- `APP_STORE_CONNECT_ISSUER_ID` - the issuer of your App Store Connect API key.

Environment variables can be added in the Codemagic web app using the 'Environment variables' tab. Save all the variables to the same variable group and make sure that the **secure** checkbox is checked to encrypt any sensitive values such as API keys or passwords.

You can then import your variable group into your `codemagic.yaml`. For example, if you named your variable group 'fastlane', the group should be imported as follows:

```yaml
workflows:
  workflow-name:
    environment:
      groups:
        - fastlane
```

## Executing *fastlane* in your workflow

It is recommended to run your *fastlane* lanes using the `codemagic.yaml` configuration file. 

You should install your dependencies with `bundle install` and then execute the *fastlane* lane with `bundle exec fastlane <lane_name>` as follows:

```yaml
scripts:
  - bundle install
  - bundle exec fastlane beta
```

If you need to use a specific version of bundler as defined in the `Gemfile.lock` file, you should install it with `gem install bundler:<version>` as follows:

```yaml
scripts:
  - gem install bundler:2.2.27
  - bundle install
  - bundle exec fastlane beta      
```

## CocoaPods

If you are using dependencies from Cocoapods, it might be necessary to include the CocoaPods gem in your Gemfile to prevent scope conflict issues. 

```
gem "fastlane"
gem "cocoapods"
```

## Starting your build

You can start your build manually from within the Codemagic web app, or configure your builds to start on events such as pushing to your repository, creating or updating a pull request, adding a new tag, or even monitoring for file system changes. See more info in [Codemagic docs](https://docs.codemagic.io/).
