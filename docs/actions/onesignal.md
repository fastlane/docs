<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/onesignal.rb
-->

# onesignal


Create a new OneSignal application




> You can use this action to automatically create a OneSignal application. You can also upload a .p12 with password, a GCM key, or both


onesignal |
-----|----
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
To show the documentation in your terminal, run
```no-highlight
fastlane action onesignal
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/onesignal.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
