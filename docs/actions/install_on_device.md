<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# install_on_device


Installs an .ipa file on a connected iOS-device via usb or wifi




> Installs the ipa on the device, if no id is given, the first found iOS device will be used, works via USB or Wi-Fi. This requires `ios-deploy` to be installed please have a look at [ios-deploy](https://github.com/phonegap/ios-deploy). to quickly install it, use `npm -g i ios-deploy`


install_on_device |
-----|----
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
To show the documentation in your terminal, run
```no-highlight
fastlane action install_on_device
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/install_on_device.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
