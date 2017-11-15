# sigh


Generates a provisioning profile. Stores the profile in the current folder




<p align="center">
  <img src="/img/actions/sigh.png" height="110">
</p>

###### Because you would rather spend your time building stuff than fighting provisioning

_sigh_ can create, renew, download and repair provisioning profiles (with one command). It supports App Store, Ad Hoc, Development and Enterprise profiles and supports nice features, like auto-adding all test devices.

-------

<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#resign">Resign</a> &bull;
    <a href="#how-does-it-work">How does it work?</a>
</p>

-------

# Features

- **Download** the latest provisioning profile for your app
- **Renew** a provisioning profile, when it has expired
- **Repair** a provisioning profile, when it is broken
- **Create** a new provisioning profile, if it doesn't exist already
- Supports **App Store**, **Ad Hoc** and **Development** profiles
- Support for **multiple Apple accounts**, storing your credentials securely in the Keychain
- Support for **multiple Teams**
- Support for **Enterprise Profiles**

To automate iOS Push profiles you can use [pem](https://github.com/fastlane/fastlane/tree/master/pem).


### Why not let Xcode do the work?

- _sigh_ can easily be integrated into your CI-server (e.g. Jenkins)
- Xcode sometimes invalidates [all existing profiles](/img/actions/SignErrors.png)
- You have control over what happens
- You still get to have the signing files, which you can then use for your build scripts or store in git

See _sigh_ in action:

![img/actions/sighRecording.gif](/img/actions/sighRecording.gif)

# Usage

**Note**: It is recommended to use [match](https://github.com/fastlane/fastlane/tree/master/match) according to the [codesigning.guide](https://codesigning.guide) for generating and maintaining your provisioning profiles. Use _sigh_ directly only if you want full control over what's going on and know more about codesigning.

```no-highlight
fastlane sigh
```

Yes, that's the whole command!

_sigh_ will create, repair and download profiles for the App Store by default.

You can pass your bundle identifier and username like this:

    fastlane sigh -a com.krausefx.app -u username

If you want to generate an **Ad Hoc** profile instead of an App Store profile:

    fastlane sigh --adhoc

If you want to generate a **Development** profile:

    fastlane sigh --development

To generate the profile in a specific directory:

    fastlane sigh -o "~/Certificates/"

To download all your provisioning profiles use

    fastlane sigh download_all

Optionally, use `fastlane sigh download_all --download_xcode_profiles` to also include the Xcode managed provisioning profiles

For a list of available parameters and commands run

    fastlane action sigh

### Advanced

By default, _sigh_ will install the downloaded profile on your machine. If you just want to generate the profile and skip the installation, use the following flag:

    fastlane sigh --skip_install

To save the provisioning profile under a specific name, use the -q option:

    fastlane sigh -a com.krausefx.app -u username -q "myProfile.mobileprovision"

If for some reason you don't want _sigh_ to verify that the code signing identity is installed on your local machine:

    fastlane sigh --skip_certificate_verification

If you need the provisioning profile to be renewed regardless of its state use the `--force` option. This gives you a profile with the maximum lifetime. `--force` will also add all available devices to this profile.

    fastlane sigh --force

By default, _sigh_ will include all certificates on development profiles, and first certificate on other types. If you need to specify which certificate to use you can either use the environment variable `SIGH_CERTIFICATE`, or pass the name or expiry date of the certificate as argument:

    fastlane sigh -c "SunApps GmbH"

For a list of available parameters and commands run

    fastlane action sigh


### Use with [_fastlane_](https://github.com/fastlane/fastlane/tree/master/fastlane)

_sigh_ becomes really interesting when used in [_fastlane_](https://github.com/fastlane/fastlane/tree/master/fastlane) in combination with [_cert_](https://github.com/fastlane/fastlane/tree/master/cert).

Update your `Fastfile` to contain the following code:

```ruby
lane :beta do
  cert
  sigh(force: true)
end
```

`force: true` will make sure to re-generate the provisioning profile on each run.
This will result in _sigh_ always using the correct signing certificate, which is installed on the local machine.


# Repair

_sigh_ can automatically repair all your existing provisioning profiles which are expired or just invalid.

    fastlane sigh repair

# Resign

If you generated your `ipa` file but want to apply a different code signing onto the ipa file, you can use `sigh resign`:

    fastlane sigh resign

_sigh_ will find the ipa file and the provisioning profile for you if they are located in the current folder.

You can pass more information using the command line:

    fastlane sigh resign ./path/app.ipa --signing_identity "iPhone Distribution: Felix Krause" -p "my.mobileprovision"

# Manage

With `sigh manage` you can list all provisioning profiles installed locally.

    fastlane sigh manage

Delete all expired provisioning profiles

    fastlane sigh manage -e

Or delete all `iOS Team Provisioning Profile` by using a regular expression

    fastlane sigh manage -p "iOS\ ?Team Provisioning Profile:"

## Environment Variables

Run `fastlane action sigh` to get a list of all available environment variables.

If you're using [cert](https://github.com/fastlane/fastlane/tree/master/cert) in combination with [fastlane](https://github.com/fastlane/fastlane/tree/master/fastlane) the signing certificate will automatically be selected for you. (make sure to run _cert_ before _sigh_)

# How does it work?

_sigh_ will access the `iOS Dev Center` to download, renew or generate the `.mobileprovision` file. It uses [spaceship](https://spaceship.airforce) to communicate with Apple's web services.

## How is my password stored?
_sigh_ uses the [CredentialsManager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) from _fastlane_.

# Tips


## Use the 'Provisioning Quicklook plugin'
Download and install the [Provisioning Plugin](https://github.com/chockenberry/Provisioning).

It will show you the `mobileprovision` files like this:
![img/actions/QuickLookScreenshot.png](/img/actions/QuickLookScreenshot.png)

## App Identifier couldn't be found

If you also want to create a new App Identifier on the Apple Developer Portal, check out [produce](https://github.com/fastlane/fastlane/tree/master/produce), which does exactly that.

## What happens to my Xcode managed profiles?

_sigh_ will never touch or use the profiles which are created and managed by Xcode. Instead _sigh_ will manage its own set of provisioning profiles.

<hr />


sigh |
-----|----
Supported platforms | ios
Author | @KrauseFx
Returns | The UUID of the profile sigh just fetched/generated



**2 Examples**

```ruby
sigh
```

```ruby
sigh(
  adhoc: true,
  force: true,
  filename: "myFile.mobileprovision"
)
```





**Parameters**

Key | Description
----|------------
  `adhoc` | Setting this flag will generate AdHoc profiles instead of App Store Profiles
  `development` | Renew the development certificate instead of the production one
  `skip_install` | By default, the certificate will be added to your local machine. Setting this flag will skip this action
  `force` | Renew provisioning profiles regardless of its state - to automatically add all devices for ad hoc profiles
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `team_id` | The ID of your Developer Portal team if you're in multiple teams
  `team_name` | The name of your Developer Portal team if you're in multiple teams
  `provisioning_name` | The name of the profile that is used on the Apple Developer Portal
  `ignore_profiles_with_different_name` | Use in combination with :provisioning_name - when true only profiles matching this exact name will be downloaded
  `output_path` | Directory in which the profile should be stored
  `cert_id` | The ID of the code signing certificate to use (e.g. 78ADL6LVAA) 
  `cert_owner_name` | The certificate name to use for new profiles, or to renew with. (e.g. "Felix Krause")
  `filename` | Filename to use for the generated provisioning profile (must include .mobileprovision)
  `skip_fetch_profiles` | Skips the verification of existing profiles which is useful if you have thousands of profiles
  `skip_certificate_verification` | Skips the verification of the certificates for every existing profiles. This will make sure the provisioning profile can be used on the local machine
  `platform` | Set the provisioning profile's platform (i.e. ios, tvos)
  `readonly` | Only fetch existing profile, don't generate new ones
  `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates, template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action sigh
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sigh.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
