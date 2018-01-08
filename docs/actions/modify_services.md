<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# modify_services


Modifies the services of the app created on Developer Portal




> Options are same as 'enable_services' in produce action
https://docs.fastlane.tools/actions/produce/


modify_services |
-----|----
Supported platforms | ios
Author | @bhimsenpadalkar



## 1 Example

```ruby
modify_services(
  username: "test.account@gmail.com",
  app_identifier: "com.someorg.app",
  services: {
    push_notifications: "on",
    associated_domains: "off"
  }
)
```





## Parameters

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | App Identifier (Bundle ID, e.g. com.krausefx.app)
  `services` | Array with Spaceship App Services (e.g. app_group: (on|off), apple_pay: (on|off), associated_domains: (on|off), data_protection: (complete|unlessopen|untilfirstauth), game_center: (on|off), health_kit: (on|off), home_kit: (on|off), wireless_accessory: (on|off), icloud: (legacy|cloudkit), in_app_purchase: (on|off), inter_app_audio: (on|off), passbook: (on|off), push_notification: (on|off), siri_kit: (on|off), vpn_configuration: (on|off), network_extension: (on|off), hotspot: (on|off), multipath: (on|off), nfc_tag_reading: (on|off))
  `team_id` | The ID of your Developer Portal team if you're in multiple teams
  `team_name` | The name of your Developer Portal team if you're in multiple teams




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action modify_services
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/modify_services.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
