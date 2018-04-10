<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/resign.rb
-->

# resign


Codesign an existing ipa file




> You may provide multiple provisioning profiles if the application contains
nested applications or app extensions, which need their own provisioning
profile. You can do so by passing an array of provisiong profile strings or a
hash that associates provisioning profile values to bundle identifier keys.
resign(ipa: "path", signing_identity: "identity", provisioning_profile: {
  "com.example.awesome-app" => "App.mobileprovision",
  "com.example.awesome-app.app-extension" => "Extension.mobileprovision"
})


resign ||
---|---
Supported platforms | ios
Author | @lmirosevic



## 2 Examples

```ruby
resign(
  ipa: "path/to/ipa", # can omit if using the `ipa` action
  signing_identity: "iPhone Distribution: Luka Mirosevic (0123456789)",
  provisioning_profile: "path/to/profile", # can omit if using the _sigh_ action
)
```

```ruby
resign(
  ipa: "path/to/ipa", # can omit if using the `ipa` action
  signing_identity: "iPhone Distribution: Luka Mirosevic (0123456789)",
  provisioning_profile: {
    "com.example.awesome-app" => "path/to/profile",
    "com.example.awesome-app.app-extension" => "path/to/app-extension/profile"
  }
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `ipa` | Path to the ipa file to resign. Optional if you use the _gym_ or _xcodebuild_ action | [*](#parameters-legend-dynamic)
  `signing_identity` | Code signing identity to use. e.g. "iPhone Distribution: Luka Mirosevic (0123456789)" | 
  `entitlements` | Path to the entitlement file to use, e.g. "myApp/MyApp.entitlements" | 
  `provisioning_profile` | Path to your provisioning_profile. Optional if you use _sigh_ | [*](#parameters-legend-dynamic)
  `version` | Version number to force resigned ipa to use.
Updates both CFBundleShortVersionString and CFBundleVersion values in Info.plist.
Applies for main app and all nested apps or extensions | 
  `display_name` | Display name to force resigned ipa to use | 
  `short_version` | Short version string to force resigned ipa to use (CFBundleShortVersionString) | 
  `bundle_version` | Bundle version to force resigned ipa to use (CFBundleVersion) | 
  `bundle_id` | Set new bundle ID during resign (CFBundleIdentifier) | 
  `use_app_entitlements` | Extract app bundle codesigning entitlements
and combine with entitlements from new provisionin profile | 
  `keychain_path` | Provide a path to a keychain file that should be used by /usr/bin/codesign | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action resign
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/resign.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
