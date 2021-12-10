<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_code_signing_settings.rb
-->

# update_code_signing_settings


Configures Xcode's Codesigning options




> Configures Xcode's Codesigning options of all targets in the project


update_code_signing_settings ||
---|---
Supported platforms | ios, mac
Author | @mathiasAichinger, @hjanuschka, @p4checo, @portellaa, @aeons, @att55, @abcdev
Returns | The current status (boolean) of codesigning after modification



## 3 Examples

```ruby
 # manual code signing
update_code_signing_settings(
  use_automatic_signing: false,
  path: "demo-project/demo/demo.xcodeproj"
)
```

```ruby
 # automatic code signing
update_code_signing_settings(
  use_automatic_signing: true,
  path: "demo-project/demo/demo.xcodeproj"
)
```

```ruby
 # more advanced manual code signing
update_code_signing_settings(
  use_automatic_signing: true,
  path: "demo-project/demo/demo.xcodeproj",
  team_id: "QABC123DEV",
  bundle_identifier: "com.demoapp.QABC123DEV",
  profile_name: "Demo App Deployment Profile",
  entitlements_file_path: "Demo App/generated/New.entitlements"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to your Xcode project | [*](#parameters-legend-dynamic)
  `use_automatic_signing` | Defines if project should use automatic signing | `false`
  `team_id` | Team ID, is used when upgrading project | 
  `targets` | Specify targets you want to toggle the signing mech. (default to all targets) | 
  `build_configurations` | Specify build_configurations you want to toggle the signing mech. (default to all configurations) | 
  `code_sign_identity` | Code signing identity type (iPhone Developer, iPhone Distribution) | 
  `entitlements_file_path` | Path to your entitlements file | 
  `profile_name` | Provisioning profile name to use for code signing | 
  `profile_uuid` | Provisioning profile UUID to use for code signing | 
  `bundle_identifier` | Application Product Bundle Identifier | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_code_signing_settings
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_code_signing_settings
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_code_signing_settings parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_code_signing_settings.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
