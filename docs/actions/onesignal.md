<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/onesignal.rb
-->

# onesignal


Create a new [OneSignal](https://onesignal.com/) application




> You can use this action to automatically create a OneSignal application. You can also upload a `.p12` with password, a GCM key, or both.


onesignal ||
---|---
Supported platforms | ios, android
Author | @timothybarraclough, @smartshowltd



## 1 Example

```ruby
onesignal(
  auth_token: "Your OneSignal Auth Token",
  app_name: "Name for OneSignal App",
  android_token: "Your Android GCM key (optional)",
  android_gcm_sender_id: "Your Android GCM Sender ID (optional)",
  apns_p12: "Path to Apple .p12 file (optional)",
  apns_p12_password: "Password for .p12 file (optional)",
  apns_env: "production/sandbox (defaults to production)"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `auth_token` | OneSignal Authorization Key | 
  `app_name` | OneSignal App Name | 
  `android_token` | ANDROID GCM KEY | 
  `android_gcm_sender_id` | GCM SENDER ID | 
  `apns_p12` | APNS P12 File (in .p12 format) | 
  `apns_p12_password` | APNS P12 password | 
  `apns_env` | APNS environment | `production`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `onesignal` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::ONE_SIGNAL_APP_ID` | The OneSignal app ID of the newly created app
  `SharedValues::ONE_SIGNAL_APP_AUTH_KEY` | The auth token for the newly created OneSignal app

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action onesignal
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run onesignal
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run onesignal parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/onesignal.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
