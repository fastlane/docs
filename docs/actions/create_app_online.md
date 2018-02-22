<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# create_app_online


Creates the given application on iTC and the Dev Portal (via _produce_)




<p align="center">
  <img src="/img/actions/produce.png" width="250">
</p>

###### Create new iOS apps on iTunes Connect and Dev Portal using your command line

_produce_ creates new iOS apps on both the Apple Developer Portal and iTunes Connect with the minimum required information.

-------

<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#how-does-it-work">How does it work?</a>
</p>

-------

# Features

- **Create** new apps on both iTunes Connect and the Apple Developer Portal
- **Modify** Application Services on the Apple Developer Portal
- **Create** App Groups on the Apple Developer Portal
- **Associate** apps with App Groups on the Apple Developer Portal
- **Create** Merchant Identifiers on the Apple Developer Portal
- **Associate** apps with Merchant Identifiers on the Apple Developer Portal
- Support for **multiple Apple accounts**, storing your credentials securely in the Keychain

# Usage

## Creating a new application

    fastlane produce

To get a list of all available parameters:

    fastlane produce --help

```no-highlight
  Commands: (* default)
    associate_group      Associate with a group, which is created if needed or simply located otherwise
    associate_merchant   Associate with a merchant for use with Apple Pay. Apple Pay will be enabled for this app
    create             * Creates a new app on iTunes Connect and the Apple Developer Portal
    disable_services     Disable specific Application Services for a specific app on the Apple Developer Portal
    enable_services      Enable specific Application Services for a specific app on the Apple Developer Portal
    group                Ensure that a specific App Group exists
    help                 Display global or [command] help documentation
    merchant             Ensure that a specific Merchant exists

  Global Options:
    --verbose
    -h, --help           Display help documentation
    -v, --version        Display version information

  Options for create:
    -u, --username STRING Your Apple ID Username (PRODUCE_USERNAME)
    -a, --app_identifier STRING App Identifier (Bundle ID, e.g. com.krausefx.app) (PRODUCE_APP_IDENTIFIER)
    -e, --bundle_identifier_suffix STRING App Identifier Suffix (Ignored if App Identifier does not ends with .*) (PRODUCE_APP_IDENTIFIER_SUFFIX)
    -q, --app_name STRING App Name (PRODUCE_APP_NAME)
    -z, --app_version STRING Initial version number (e.g. '1.0') (PRODUCE_VERSION)
    -y, --sku STRING     SKU Number (e.g. '1234') (PRODUCE_SKU)
    -j, --platform STRING The platform to use (optional) (PRODUCE_PLATFORM)
    -m, --language STRING Primary Language (e.g. 'English', 'German') (PRODUCE_LANGUAGE)
    -c, --company_name STRING The name of your company. Only required if it's the first app you create (PRODUCE_COMPANY_NAME)
    -i, --skip_itc [VALUE] Skip the creation of the app on iTunes Connect (PRODUCE_SKIP_ITC)
    -d, --skip_devcenter [VALUE] Skip the creation of the app on the Apple Developer Portal (PRODUCE_SKIP_DEVCENTER)
    -s, --itc_users ARRAY Array of iTunes Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles (ITC_USERS)
    -b, --team_id STRING The ID of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_ID)
    -l, --team_name STRING The name of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_NAME)
    -k, --itc_team_id [VALUE] The ID of your iTunes Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_ID)
    -p, --itc_team_name STRING The name of your iTunes Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_NAME)
```

## Enabling / Disabling Application Services

If you want to enable Application Services for an App ID (HomeKit and HealthKit in this example):

    fastlane produce enable_services --homekit --healthkit

If you want to disable Application Services for an App ID (iCloud in this case):

    fastlane produce disable_services --icloud

If you want to create a new App Group:

    fastlane produce group -g group.krausefx -n "Example App Group"

If you want to associate an app with an App Group:

    fastlane produce associate_group -a com.krausefx.app group.krausefx

# Parameters

Get a list of all available options using

```no-highlight
fastlane produce enable_services --help
```

```no-highlight
    --app-group          Enable App Groups
    --apple-pay          Enable Apple Pay
    --associated-domains Enable Associated Domains
    --data-protection STRING Enable Data Protection, suitable values are "complete", "unlessopen" and "untilfirstauth"
    --game-center        Enable Game Center
    --healthkit          Enable HealthKit
    --homekit            Enable HomeKit
    --wireless-conf      Enable Wireless Accessory Configuration
    --icloud STRING      Enable iCloud, suitable values are "legacy" and "cloudkit"
    --in-app-purchase    Enable In-App Purchase
    --inter-app-audio    Enable Inter-App-Audio
    --passbook           Enable Passbook
    --push-notification  Enable Push notification (only enables the service, does not configure certificates)
    --sirikit            Enable SiriKit
    --vpn-conf           Enable VPN Configuration
```

```no-highlight
fastlane produce disable_services --help
```

```
    --app-group          Disable App Groups
    --apple-pay          Disable Apple Pay
    --associated-domains Disable Associated Domains
    --data-protection    Disable Data Protection
    --game-center        Disable Game Center
    --healthkit          Disable HealthKit
    --homekit            Disable HomeKit
    --wireless-conf      Disable Wireless Accessory Configuration
    --icloud             Disable iCloud
    --in-app-purchase    Disable In-App Purchase
    --inter-app-audio    Disable Inter-App-Audio
    --passbook           Disable Passbook
    --push-notification  Disable Push notifications
    --sirikit            Disable SiriKit
    --vpn-conf           Disable VPN Configuration
```

## Creating Apple Pay merchants and associating them with an App ID

If you want to create a new Apple Pay Merchant Identifier:

```no-highlight
fastlane produce merchant -o merchant.com.example.production -r "Example Merchant Production"
```

Use `--help` for more information about all available parameters
```
fastlane produce merchant --help
```

If you want to associate an app with a Merchant Identifier:

```no-highlight
fastlane produce associate_merchant -a com.krausefx.app merchant.com.example.production
```

If you want to associate an app with multiple Merchant Identifiers:

```no-highlight
fastlane produce associate_merchant -a com.krausefx.app merchant.com.example.production merchant.com.example.sandbox
```

Use --help for more information about all available parameters

```no-highlight
fastlane produce associate_merchant --help
```

## Environment Variables

All available values can also be passed using environment variables, run `fastlane produce --help` to get a list of all available parameters.

## _fastlane_ Integration

Your `Fastfile` should look like this

```ruby
lane :release do
  produce(
    username: 'felix@krausefx.com',
    app_identifier: 'com.krausefx.app',
    app_name: 'MyApp',
    language: 'English',
    app_version: '1.0',
    sku: '123',
    team_name: 'SunApps GmbH', # only necessary when in multiple teams
    
    # Optional
    # App services can be enabled during app creation
    enable_services: {
      app_group: "on",               # Valid values: "on", "off"
      apple_pay: "on",               # Valid values: "on", "off"
      associated_domains: "on",      # Valid values: "on", "off"
      data_protection: "complete",   # Valid values: "complete", "unlessopen", "untilfirstauth",
      game_center: "on",             # Valid values: "on", "off"
      health_kit: "on",              # Valid values: "on", "off"
      home_kit: "on",                # Valid values: "on", "off"
      wireless_accessory: "on",      # Valid values: "on", "off"
      icloud: "cloudkit",            # Valid values: "legacy", "cloudkit"
      in_app_purchase: "on",         # Valid values: "on", "off"
      inter_app_audio: "on",         # Valid values: "on", "off"
      passbook: "on",                # Valid values: "on", "off"
      push_notification: "on",       # Valid values: "on", "off"
      siri_kit: "on",                # Valid values: "on", "off"
      vpn_configuration: "on",       # Valid values: "on", "off"
      network_extension: "on",       # Valid values: "on", "off"
      hotspot: "on",                 # Valid values: "on", "off"
      multipath: "on",               # Valid values: "on", "off"
      nfc_tag_reading: "on",         # Valid values: "on", "off"
    }
  )

  deliver
end
```

To use the newly generated app in _deliver_, you need to add this line to your `Deliverfile`:

```ruby-skip-tests
apple_id ENV['PRODUCE_APPLE_ID']
```

This will tell _deliver_, which `App ID` to use, since the app is not yet available in the App Store.

You'll still have to fill out the remaining information (like screenshots, app description and pricing). You can use [_deliver_](https://docs.fastlane.tools/actions/deliver/) to upload your app metadata using a CLI

## How is my password stored?

_produce_ uses the [password manager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) from _fastlane_. Take a look the [CredentialsManager README](https://github.com/fastlane/fastlane/tree/master/credentials_manager) for more information.

<hr />


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
produce   # alias for "create_app_online"
```





## Parameters

Key | Description | Default
----|-------------|--------
  `username` | Your Apple ID Username | [*](#dynamic)
  `app_identifier` | App Identifier (Bundle ID, e.g. com.krausefx.app) | [*](#dynamic)
  `bundle_identifier_suffix` | App Identifier Suffix (Ignored if App Identifier does not end with .*) | 
  `app_name` | App Name | 
  `app_version` | Initial version number (e.g. '1.0') | 
  `sku` | SKU Number (e.g. '1234') | [*](#dynamic)
  `platform` | The platform to use (optional) | `ios`
  `language` | Primary Language (e.g. 'English', 'German') | `English`
  `company_name` | The name of your company. Only required if it's the first app you create | 
  `skip_itc` | Skip the creation of the app on iTunes Connect | `false`
  `itc_users` | Array of iTunes Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles | 
  `enabled_features` | [DEPRECATED!] Please use `enable_services` instead - Array with Spaceship App Services | `{}`
  `enable_services` | Array with Spaceship App Services (e.g. app_group: (on|off), apple_pay: (on|off), associated_domains: (on|off), data_protection: (complete|unlessopen|untilfirstauth), game_center: (on|off), health_kit: (on|off), home_kit: (on|off), wireless_accessory: (on|off), icloud: (legacy|cloudkit), in_app_purchase: (on|off), inter_app_audio: (on|off), passbook: (on|off), push_notification: (on|off), siri_kit: (on|off), vpn_configuration: (on|off), network_extension: (on|off), hotspot: (on|off), multipath: (on|off), nfc_tag_reading: (on|off)) | `{}`
  `skip_devcenter` | Skip the creation of the app on the Apple Developer Portal | `false`
  `team_id` | The ID of your Developer Portal team if you're in multiple teams | [*](#dynamic)
  `team_name` | The name of your Developer Portal team if you're in multiple teams | [*](#dynamic)
  `itc_team_id` | The ID of your iTunes Connect team if you're in multiple teams | [*](#dynamic)
  `itc_team_name` | The name of your iTunes Connect team if you're in multiple teams | [*](#dynamic)

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action create_app_online
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_app_online.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
