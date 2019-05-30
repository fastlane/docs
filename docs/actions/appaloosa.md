<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appaloosa.rb
-->

# appaloosa


Upload your app to [Appaloosa Store](https://www.appaloosa-store.com/)




> Appaloosa is a private mobile application store. This action offers a quick deployment on the platform.<br>You can create an account, push to your existing account, or manage your user groups.<br>We accept iOS and Android applications.


appaloosa ||
---|---
Supported platforms | ios, android, mac
Author | @Appaloosa



## 1 Example

```ruby
appaloosa(
  # Path tor your IPA or APK
  binary: '/path/to/binary.ipa',
  # You can find your store’s id at the bottom of the “Settings” page of your store
  store_id: 'your_store_id',
  # You can find your api_token at the bottom of the “Settings” page of your store
  api_token: 'your_api_key',
  # User group_ids visibility, if it's not specified we'll publish the app for all users in your store'
  group_ids: '112, 232, 387',
  # You can use fastlane/snapshot or specify your own screenshots folder.
  # If you use snapshot please specify a local and a device to upload your screenshots from.
  # When multiple values are specified in the Snapfile, we default to 'en-US'
  locale: 'en-US',
  # By default, the screenshots from the last device will be used
  device: 'iPhone6',
  # Screenshots' filenames should start with device's name like 'iphone6-s1.png' if device specified
  screenshots: '/path/to_your/screenshots'
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `binary` | Binary path. Optional for ipa if you use the `ipa` or `xcodebuild` action | [*](#parameters-legend-dynamic)
  `api_token` | Your API token | 
  `store_id` | Your Store id | 
  `group_ids` | Your app is limited to special users? Give us the group ids | `''`
  `screenshots` | Add some screenshots application to your store or hit [enter] | [*](#parameters-legend-dynamic)
  `locale` | Select the folder locale for your screenshots | `en-US`
  `device` | Select the device format for your screenshots | 
  `description` | Your app description | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action appaloosa
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appaloosa
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appaloosa parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appaloosa.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
