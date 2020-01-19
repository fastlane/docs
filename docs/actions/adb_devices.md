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



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action adb_devices
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run adb_devices
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run adb_devices parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/adb_devices.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
