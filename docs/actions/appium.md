<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# appium


Run UI test by Appium with RSpec







appium |
-----|----
Supported platforms | ios
Author | @yonekawa



**1 Example**

```ruby
appium(
  app_path:  "appium/apps/TargetApp.app",
  spec_path: "appium/spec",
  platform:  "iOS",
  caps: {
    versionNumber: "9.1",
    deviceName:    "iPhone 6"
  }
)
```





**Parameters**

Key | Description
----|------------
  `platform` | Appium platform name
  `spec_path` | Path to Appium spec directory
  `app_path` | Path to Appium target app file
  `invoke_appium_server` | Use local Appium server with invoke automatically
  `host` | Hostname of Appium server
  `port` | HTTP port of Appium server
  `appium_path` | Path to Appium executable
  `caps` | Hash of caps for Appium::Driver




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action appium
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appium.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
