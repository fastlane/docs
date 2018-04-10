<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/adb_devices.rb
-->

# adb_devices


Get an array of Connected android device serials




> Fetches device list via adb, e.g. run an adb command on all connected devices.


adb_devices ||
---|---
Supported platforms | android
Author | @hjanuschka
Returns | Returns an array of all currently connected android devices



## 1 Example

```ruby
adb_devices.each do |device|
  model = adb(command: "shell getprop ro.product.model",
    serial: device.serial).strip

  puts "Model #{model} is connected"
end
```





## Parameters

Key | Description | Default
----|-------------|--------
  `adb_path` | The path to your `adb` binary (can be left blank if the ANDROID_SDK_ROOT environment variable is set) | `adb`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action adb_devices
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/adb_devices.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
