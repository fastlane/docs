<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_app_online.rb
-->

# create_app_online


Creates the given application on iTC and the Dev Portal (via _produce_)




<p align="center">
  <img src="/img/actions/produce.png" width="250">
</p>

###### Create new iOS apps on App Store Connect and Dev Portal using your command line

_produce_ creates new iOS apps on both the Apple Developer Portal and App Store Connect with the minimum required information.

-------

<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#how-does-it-work">How does it work?</a>
</p>

-------

# Features

- **Create** new apps on both App Store Connect and the Apple Developer Portal
- **Modify** Application Services on the Apple Developer Portal
- **Create** App Groups on the Apple Developer Portal
- **Associate** apps with App Groups on the Apple Developer Portal
- **Create** iCloud Containers on the Apple Developer Portal
- **Associate** apps with iCloud Containers on the Apple Developer Portal
- **Create** Merchant Identifiers on the Apple Developer Portal
- **Associate** apps with Merchant Identifiers on the Apple Developer Portal
- Support for **multiple Apple accounts**, storing your credentials securely in the Keychain

# Usage

## Creating a new application

```no-highlight
fastlane produce
```

To get a list of all available parameters:

```no-highlight
fastlane produce --help
```

```no-highlight
Commands: (* default)
  associate_group      Associate with a group, which is created if needed or simply located otherwise
  associate_merchant   Associate with a merchant for use with Apple Pay. Apple Pay will be enabled for this app
  create             * Creates a new app on App Store Connect and the Apple Developer Portal
  disable_services     Disable specific Application Services for a specific app on the Apple Developer Portal
  enable_services      Enable specific Application Services for a specific app on the Apple Developer Portal
  group                Ensure that a specific App Group exists
  cloud_container      Ensure that a specific iCloud Container exists
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
  -i, --skip_itc [VALUE] Skip the creation of the app on App Store Connect (PRODUCE_SKIP_ITC)
  -d, --skip_devcenter [VALUE] Skip the creation of the app on the Apple Developer Portal (PRODUCE_SKIP_DEVCENTER)
  -s, --itc_users ARRAY Array of App Store Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles (ITC_USERS)
  -b, --team_id STRING The ID of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_ID)
  -l, --team_name STRING The name of your Developer Portal team if you're in multiple teams (PRODUCE_TEAM_NAME)
  -k, --itc_team_id [VALUE] The ID of your App Store Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_ID)
  -p, --itc_team_name STRING The name of your App Store Connect team if you're in multiple teams (PRODUCE_ITC_TEAM_NAME)
```

## Enabling / Disabling Application Services

If you want to enable Application Services for an App ID (HomeKit and HealthKit in this example):

```no-highlight
fastlane produce enable_services --homekit --healthkit
```

If you want to disable Application Services for an App ID (iCloud in this case):

```no-highlight
fastlane produce disable_services --icloud
```

If you want to create a new App Group:

```no-highlight
fastlane produce group -g group.krausefx -n "Example App Group"
```

If you want to associate an app with an App Group:

```no-highlight
fastlane produce associate_group -a com.krausefx.app group.krausefx
```

If you want to create a new iCloud Container:

```no-highlight
fastlane produce cloud_container -g iCloud.com.krausefx.app -n "Example iCloud Container"
```

If you want to associate an app with an iCloud Container:

```no-highlight
fastlane produce associate_cloud_container -a com.krausefx.app iCloud.com.krausefx.app
```

If you want to associate an app with multiple iCloud Containers:

```no-highlight
fastlane produce associate_cloud_container -a com.krausefx.app iCloud.com.krausefx.app1 iCloud.com.krausefx.app2
```

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
--hotspot            Enable Hotspot
--icloud STRING      Enable iCloud, suitable values are "legacy" and "cloudkit"
--in-app-purchase    Enable In-App Purchase
--inter-app-audio    Enable Inter-App-Audio
--multipath          Enable Multipath
--network-extension  Enable Network Extensions
--nfc-tag-reading    Enable NFC Tag Reading
--personal-vpn       Enable Personal VPN
--passbook           Enable Passbook (deprecated)
--push-notification  Enable Push notification (only enables the service, does not configure certificates)
--sirikit            Enable SiriKit
--vpn-conf           Enable VPN Configuration (deprecated)
--wallet             Enable Wallet
--wireless-conf      Enable Wireless Accessory Configuration
```

```no-highlight
fastlane produce disable_services --help
```

```no-highlight
--app-group          Disable App Groups
--apple-pay          Disable Apple Pay
--associated-domains Disable Associated Domains
--data-protection    Disable Data Protection
--game-center        Disable Game Center
--healthkit          Disable HealthKit
--homekit            Disable HomeKit
--hotspot            Disable Hotspot
--icloud             Disable iCloud
--in-app-purchase    Disable In-App Purchase
--inter-app-audio    Disable Inter-App-Audio
--multipath          Disable Multipath
--network-extension  Disable Network Extensions
--nfc-tag-reading    Disable NFC Tag Reading
--personal-vpn       Disable Personal VPN
--passbook           Disable Passbook (deprecated)
--push-notification  Disable Push notifications
--sirikit            Disable SiriKit
--vpn-conf           Disable VPN Configuration (deprecated)
--wallet             Disable Wallet
--wireless-conf      Disable Wireless Accessory Configuration
```

## Creating Apple Pay merchants and associating them with an App ID

If you want to create a new Apple Pay Merchant Identifier:

```no-highlight
fastlane produce merchant -o merchant.com.example.production -r "Example Merchant Production"
```

Use `--help` for more information about all available parameters

```no-highlight
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
      access_wifi: "on",             # Valid values: "on", "off"
      app_group: "on",               # Valid values: "on", "off"
      apple_pay: "on",               # Valid values: "on", "off"
      associated_domains: "on",      # Valid values: "on", "off"
      auto_fill_credential: "on",    # Valid values: "on", "off"
      data_protection: "complete",   # Valid values: "complete", "unlessopen", "untilfirstauth",
      game_center: "on",             # Valid values: "on", "off"
      health_kit: "on",              # Valid values: "on", "off"
      home_kit: "on",                # Valid values: "on", "off"
      hotspot: "on",                 # Valid values: "on", "off"
      icloud: "cloudkit",            # Valid values: "legacy", "cloudkit"
      in_app_purchase: "on",         # Valid values: "on", "off"
      inter_app_audio: "on",         # Valid values: "on", "off"
      passbook: "on",                # Valid values: "on", "off"
      multipath: "on",               # Valid values: "on", "off"
      network_extension: "on",       # Valid values: "on", "off"
      nfc_tag_reading: "on",         # Valid values: "on", "off"
      personal_vpn: "on",            # Valid values: "on", "off"
      passbook: "on",                # Valid values: "on", "off" (deprecated)
      push_notification: "on",       # Valid values: "on", "off"
      siri_kit: "on",                # Valid values: "on", "off"
      vpn_configuration: "on",       # Valid values: "on", "off" (deprecated)
      wallet: "on",                  # Valid values: "on", "off"
      wireless_accessory: "on",      # Valid values: "on", "off"
    }
  )

  deliver
end
```

To use the newly generated app in _deliver_, you need to add this line to your `Deliverfile`:

```ruby-skip-tests
apple_id(ENV['PRODUCE_APPLE_ID'])
```

This will tell _deliver_, which `App ID` to use, since the app is not yet available in the App Store.

You'll still have to fill out the remaining information (like screenshots, app description and pricing). You can use [_deliver_](https://docs.fastlane.tools/actions/deliver/) to upload your app metadata using a CLI

## How is my password stored?

_produce_ uses the [password manager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) from _fastlane_. Take a look the [CredentialsManager README](https://github.com/fastlane/fastlane/tree/master/credentials_manager) for more information.

<hr />


create_app_online ||
---|---
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
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `app_identifier` | App Identifier (Bundle ID, e.g. com.krausefx.app) | [*](#parameters-legend-dynamic)
  `bundle_identifier_suffix` | App Identifier Suffix (Ignored if App Identifier does not end with .*) | 
  `app_name` | App Name | 
  `app_version` | Initial version number (e.g. '1.0') | 
  `sku` | SKU Number (e.g. '1234') | [*](#parameters-legend-dynamic)
  `platform` | The platform to use (optional) | `ios`
  `language` | Primary Language (e.g. 'English', 'German') | `English`
  `company_name` | The name of your company. Only required if it's the first app you create | 
  `skip_itc` | Skip the creation of the app on App Store Connect | `false`
  `itc_users` | Array of App Store Connect users. If provided, you can limit access to this newly created app for users with the App Manager, Developer, Marketer or Sales roles | 
  `enabled_features` | **DEPRECATED!** Please use `enable_services` instead - Array with Spaceship App Services | `{}`
  `enable_services` | Array with Spaceship App Services (e.g. access_wifi: (on\|off), app_group: (on\|off), apple_pay: (on\|off), associated_domains: (on\|off), auto_fill_credential: (on\|off), data_protection: (complete\|unlessopen\|untilfirstauth), game_center: (on\|off), health_kit: (on\|off), home_kit: (on\|off), hotspot: (on\|off), icloud: (legacy\|cloudkit), in_app_purchase: (on\|off), inter_app_audio: (on\|off), multipath: (on\|off), network_extension: (on\|off), nfc_tag_reading: (on\|off), personal_vpn: (on\|off), passbook: (on\|off), push_notification: (on\|off), siri_kit: (on\|off), vpn_configuration: (on\|off), wallet: (on\|off), wireless_accessory: (on\|off)) | `{}`
  `skip_devcenter` | Skip the creation of the app on the Apple Developer Portal | `false`
  `team_id` | The ID of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `itc_team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `itc_team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_app_online` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::PRODUCE_APPLE_ID` | The Apple ID of the newly created app. You probably need it for `deliver`

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action create_app_online
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_app_online
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_app_online parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_app_online.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
