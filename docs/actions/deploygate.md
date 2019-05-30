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
  distribution_key: "(Optional) Target Distribution Key",
  distribution_name: "(Optional) Target Distribution Name"
)
```

```ruby
deploygate(
  api_token: "...",
  user: "target username or organization name",
  apk: "./apk_file.apk",
  message: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
  distribution_key: "(Optional) Target Distribution Key",
  distribution_name: "(Optional) Target Distribution Name"
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
  `distribution_name` | Target Distribution Name | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `deploygate` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::DEPLOYGATE_URL` | URL of the newly uploaded build
  `SharedValues::DEPLOYGATE_REVISION` | auto incremented revision number
  `SharedValues::DEPLOYGATE_APP_INFO` | Contains app revision, bundle identifier, etc.

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action deploygate
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run deploygate
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run deploygate parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/deploygate.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
