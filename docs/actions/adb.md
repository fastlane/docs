<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/adb.rb
-->

# adb


Run ADB Actions




> see adb --help for more details


adb ||
---|---
Supported platforms | android
Author | @hjanuschka
Returns | The output of the adb command



## 1 Example

```ruby
adb(
  command: "shell ls"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `serial` | Android serial of the device to use for this command | `''`
  `command` | All commands you want to pass to the adb command, e.g. `kill-server` | 
  `adb_path` | The path to your `adb` binary (can be left blank if the ANDROID_SDK_ROOT environment variable is set) | `adb`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action adb
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/adb.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
