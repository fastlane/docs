<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/modify_services.rb
-->

# modify_services


Modifies the services of the app created on Developer Portal




> The options are the same as `:enable_services` in the [produce action](https://docs.fastlane.tools/actions/produce/#parameters_1)


modify_services ||
---|---
Supported platforms | ios
Author | @bhimsenpadalkar



## 1 Example

```ruby
modify_services(
  username: "test.account@gmail.com",
  app_identifier: "com.someorg.app",
  services: {
    push_notification: "on",
    associated_domains: "off",
    wallet: :on,
    apple_pay: :off,
    data_protection: true,
    multipath: false
  })
```





## Parameters

Key | Description | Default
----|-------------|--------
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `app_identifier` | App Identifier (Bundle ID, e.g. com.krausefx.app) | [*](#parameters-legend-dynamic)
  `services` | Array with Spaceship App Services (e.g. access_wifi: (on\|off)(:on\|:off)(true\|false), app_group: (on\|off)(:on\|:off)(true\|false), apple_pay: (on\|off)(:on\|:off)(true\|false), associated_domains: (on\|off)(:on\|:off)(true\|false), auto_fill_credential: (on\|off)(:on\|:off)(true\|false), data_protection: (complete\|unlessopen\|untilfirstauth)(:on\|:off)(true\|false), game_center: (on\|off)(:on\|:off)(true\|false), health_kit: (on\|off)(:on\|:off)(true\|false), home_kit: (on\|off)(:on\|:off)(true\|false), hotspot: (on\|off)(:on\|:off)(true\|false), icloud: (legacy\|cloudkit)(:on\|:off)(true\|false), in_app_purchase: (on\|off)(:on\|:off)(true\|false), inter_app_audio: (on\|off)(:on\|:off)(true\|false), multipath: (on\|off)(:on\|:off)(true\|false), network_extension: (on\|off)(:on\|:off)(true\|false), nfc_tag_reading: (on\|off)(:on\|:off)(true\|false), personal_vpn: (on\|off)(:on\|:off)(true\|false), passbook: (on\|off)(:on\|:off)(true\|false), push_notification: (on\|off)(:on\|:off)(true\|false), siri_kit: (on\|off)(:on\|:off)(true\|false), vpn_configuration: (on\|off)(:on\|:off)(true\|false), wallet: (on\|off)(:on\|:off)(true\|false), wireless_accessory: (on\|off)(:on\|:off)(true\|false)) | `{}`
  `team_id` | The ID of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action modify_services
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run modify_services
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run modify_services parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/modify_services.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
