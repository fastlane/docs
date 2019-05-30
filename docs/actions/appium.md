<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appium.rb
-->

# appium


Run UI test by Appium with RSpec







appium ||
---|---
Supported platforms | ios, android
Author | @yonekawa



## 1 Example

```ruby
appium(
  app_path:  "appium/apps/TargetApp.app",
  spec_path: "appium/spec",
  platform:  "iOS",
  caps: {
    versionNumber: "9.1",
    deviceName:    "iPhone 6"
  },
  appium_lib: {
    wait: 10
  }
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `platform` | Appium platform name | 
  `spec_path` | Path to Appium spec directory | 
  `app_path` | Path to Appium target app file | 
  `invoke_appium_server` | Use local Appium server with invoke automatically | `true`
  `host` | Hostname of Appium server | `0.0.0.0`
  `port` | HTTP port of Appium server | `4723`
  `appium_path` | Path to Appium executable | 
  `caps` | Hash of caps for Appium::Driver | 
  `appium_lib` | Hash of appium_lib for Appium::Driver | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action appium
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appium
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appium parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appium.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
