<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# create_app_online


Creates the given application on iTC and the Dev Portal (via `produce`)







create_app_online |
-----|----
Supported platforms | ios
Author | @KrauseFx



## 2 Examples

```ruby
create_app_online(
  username: "felix@krausefx.com",
  app_identifier: "com.krausefx.app",
  app_name: "MyApp",
  language: "English",
  app_version: "1.0",
  sku: "123",
  team_name: "SunApps GmbH" # Only necessary when in multiple teams.
)
```

```ruby
produce(...) # alias for "create_app_online"
```





## Parameters

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | App Identifier (Bundle ID, e.g. com.krausefx.app)
  `bundle_identifier_suffix` | App Identifier Suffix (Ignored if App Identifier does not end with .*)
  `app_name` | App Name
  `app_version` | Initial version number (e.g. '1.0')
  `sku` | SKU Number (e.g. '1234')
  `platform` | The platform to use (optional)
  `language` | Primary Language (e.g. 'English', 'German')
  `company_name` | The name of your company. Only required if it's the first app you create
  `skip_itc` | Skip the creation of the app on iTunes Connect
  `itc_users` | Array of iTunes Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles
  `enabled_features` | [DEPRECATED!] Please use `enable_services` instead - Array with Spaceship App Services
  `enable_services` | Array with Spaceship App Services (e.g. app_group: (on|off), apple_pay: (on|off), associated_domains: (on|off), data_protection: (complete|unlessopen|untilfirstauth), game_center: (on|off), health_kit: (on|off), home_kit: (on|off), wireless_accessory: (on|off), icloud: (legacy|cloudkit), in_app_purchase: (on|off), inter_app_audio: (on|off), passbook: (on|off), push_notification: (on|off), siri_kit: (on|off), vpn_configuration: (on|off))
  `skip_devcenter` | Skip the creation of the app on the Apple Developer Portal
  `team_id` | The ID of your Developer Portal team if you're in multiple teams
  `team_name` | The name of your Developer Portal team if you're in multiple teams
  `itc_team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `itc_team_name` | The name of your iTunes Connect team if you're in multiple teams




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action create_app_online
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_app_online.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
