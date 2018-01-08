<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# get_certificates


Create new iOS code signing certificates (via _cert_)




> **Important**: It is recommended to use [match](https://docs.fastlane.tools/actions/match/) according to the [codesigning.guide](https://codesigning.guide) for generating and maintaining your certificates. Use _cert_ directly only if you want full control over what's going on and know more about codesigning.
Use this action to download the latest code signing identity


get_certificates |
-----|----
Supported platforms | ios
Author | @KrauseFx



## 3 Examples

```ruby
get_certificates
```

```ruby
cert # alias for "get_certificates"
```

```ruby
get_certificates(
  development: true,
  username: "user@email.com"
)
```





## Parameters

Key | Description
----|------------
  `development` | Create a development certificate instead of a distribution one
  `force` | Create a certificate even if an existing certificate exists
  `username` | Your Apple ID Username
  `team_id` | The ID of your Developer Portal team if you're in multiple teams
  `team_name` | The name of your Developer Portal team if you're in multiple teams
  `output_path` | The path to a directory in which all certificates and private keys should be stored
  `keychain_path` | Path to a custom keychain
  `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your account password
  `platform` | Set the provisioning profile's platform (ios, macos)




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action get_certificates
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_certificates.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
