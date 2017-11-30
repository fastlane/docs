<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# get_provisioning_profile


Generates a provisioning profile, saving it in the current folder (via `sigh`)




> **Note**: It is recommended to use [match](https://github.com/fastlane/fastlane/tree/master/match) according to the [codesigning.guide](https://codesigning.guide) for generating and maintaining your provisioning profiles. Use _sigh_ directly only if you want full control over what's going on and know more about codesigning.


get_provisioning_profile |
-----|----
Supported platforms | ios
Author | @KrauseFx
Returns | The UUID of the profile sigh just fetched/generated



## 3 Examples

```ruby
get_provisioning_profile
```

```ruby
sigh # alias for "get_provisioning_profile"
```

```ruby
get_provisioning_profile(
  adhoc: true,
  force: true,
  filename: "myFile.mobileprovision"
)
```





## Parameters

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
fastlane action get_provisioning_profile
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_provisioning_profile.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
