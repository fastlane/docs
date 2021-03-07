{!docs/includes/setup-fastlane-header.md!}

# Codesigning concepts

If you are just starting a new project, it's important to think about how you want to handle code signing. This guide will help you choose the best approach for you.

For existing projects it might make sense to switch from a manual process to the [match approach](https://codesigning.guide) to make it easier for new team-members to onboard.

If you are new to code signing, check out the [WWDC session](https://developer.apple.com/videos/play/wwdc2016/401/) that describes the fundamentals of code signing in Xcode.

- [Using match](#using-match)
- [Using cert and sigh](#using-cert-and-sigh)
- [Using Xcode's code signing feature](#using-xcodes-code-signing-feature)
- [Manually](#manually)

## Using [_match_](https://fastlane.tools/match)

The concept of [_match_](https://fastlane.tools/match) is described in the [codesigning guide](https://codesigning.guide). 

With [_match_](https://fastlane.tools/match) you store your private keys and certificates in a git repo to sync them across machines. This makes it easy to onboard new team-members and set up new Mac machines. This approach [is secure](https://docs.fastlane.tools/actions/match/#is-this-secure) and uses technology you already use.


Getting started with [_match_](https://fastlane.tools/match) requires you to revoke your existing certificates.

Make sure to follow [Setting up your Xcode Project](xcode-project.md) to set up your project properly.

## Using [_cert_](https://fastlane.tools/cert) and [_sigh_](https://fastlane.tools/sigh)

If you don't want to revoke your existing certificates, but still want an automated setup, [_cert_](https://fastlane.tools/cert) and [_sigh_](https://fastlane.tools/sigh) are for you. 

- [_cert_](https://fastlane.tools/cert) will make sure you have a valid certificate and its private key installed on the local machine
- [_sigh_](https://fastlane.tools/sigh) will make sure you have a valid provisioning profile installed locally, that matches the installed certificate

Add the following lines to your `Fastfile`

```ruby
lane :beta do
  get_certificates           # invokes cert
  get_provisioning_profile   # invokes sigh
  build_app
end
```

Make sure to follow [Setting up your Xcode Project](xcode-project.md) to set up your project properly.

## Using Xcode's code signing feature

Occasionally the `Automatic` setting as the provisioning profile doesn't work reliably as it will just select the most recently updated provisioning profile, no matter if the certificate is installed. 

That's why it is recommended to specify a specific provisioning profile somehow:

#### Xcode 8 and up

The instructions below are more advanced, and take more time to setup than other approaches.

##### Automatic & Manual Signing

To simplify development workflow you could use `Automatic` code signing for development, and `Manual` for release builds.
You have to configure your Xcode project to use automatic code signing, and on the release configuration specify the `$()` match env variable.

e.g: 
<img src="/img/codesigning/auto_signing.png" width=500 />

in your Fastfile you then use a lane like this:

```ruby
lane :release do
  sync_code_signing
  disable_automatic_code_signing(path: "my_project.xcodeproj")
  build_app
  enable_automatic_code_signing(path: "my_project.xcodeproj")
  upload_to_testflight
end
```

this way you can profit off of the automatic code signing on development machines, and also stay in control on release builds to be sure the right cert/provisioning profiles are used.

#### Xcode 7 and lower

You should avoid clicking the `Fix Issue` button (There is an [Xcode plugin](https://github.com/neonichu/FixCode#readme) that disables the button), as it sometimes revokes existing certificates, and with it the provisioning profiles.

Unfortunately you can't specify the name of the provisioning profile in Xcode 7. Instead you can specify the UUID of the profile, which changes every time the profile gets re-generated (e.g. when you add a new device).

To work around this issue, check out [Setting up your Xcode Project](xcode-project.md) on how to pass a provisioning profile to Xcode when building your app.

## Manually

You can always manually create and manage your certificates and provisioning profiles using the Apple Developer Portal. Make sure to store the private key (`.p12`) of your certificates in a safe place, as they can't be restored if you lose them. 

You can always download the certificate (`.cer`) and provisioning profile (`.mobileprovision`) from the Apple Developer Portal.

## Where to go from here

- [Setting up your Xcode Project](xcode-project.md)
- [Debugging codesigning issues](troubleshooting.md)
- [Common code signing issues](common-issues.md)
- [Upgrading to Xcode 9](xcode-project.md#xcode-9-and-up)
