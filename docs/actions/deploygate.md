<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/deploygate.rb
-->

# deploygate


Upload a new build to [DeployGate](https://deploygate.com/)




> You can retrieve your username and API token on [your settings page](https://deploygate.com/settings).<br>More information about the available options can be found in the [DeployGate Push API document](https://deploygate.com/docs/api).


deploygate ||
---|---
Supported platforms | ios, android
Author | @tnj, @tomorrowkey



## 2 Examples

```ruby
deploygate(
  api_token: "...",
  user: "target username or organization name",
  ipa: "./ipa_file.ipa",
  message: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
  distribution_key: "(Optional) Target Distribution Key"
)
```

```ruby
deploygate(
  api_token: "...",
  user: "target username or organization name",
  apk: "./apk_file.apk",
  message: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
  distribution_key: "(Optional) Target Distribution Key"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_token` | Deploygate API Token | 
  `user` | Target username or organization name | 
  `ipa` | Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action | [*](#parameters-legend-dynamic)
  `apk` | Path to your APK file | [*](#parameters-legend-dynamic)
  `message` | Release Notes | `No changelog provided`
  `distribution_key` | Target Distribution Key | 
  `release_note` | Release note for distribution page | 
  `disable_notify` | Disables Push notification emails | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action deploygate
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/deploygate.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
