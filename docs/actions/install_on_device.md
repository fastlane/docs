<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/install_on_device.rb
-->

# install_on_device


Installs an .ipa file on a connected iOS-device via usb or wifi




> Installs the ipa on the device. If no id is given, the first found iOS device will be used. Works via USB or Wi-Fi. This requires `ios-deploy` to be installed. Please have a look at [ios-deploy](https://github.com/ios-control/ios-deploy). To quickly install it, use `npm -g i ios-deploy`


install_on_device ||
---|---
Supported platforms | ios
Author | @hjanuschka



## 1 Example

```ruby
install_on_device(
  device_id: "a3be6c9ff7e5c3c6028597513243b0f933b876d4",
  ipa: "./app.ipa"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `extra` | Extra Commandline arguments passed to ios-deploy | 
  `device_id` | id of the device / if not set defaults to first found device | 
  `skip_wifi` | Do not search for devices via WiFi | 
  `ipa` | The IPA file to put on the device | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action install_on_device
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run install_on_device
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run install_on_device parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/install_on_device.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
