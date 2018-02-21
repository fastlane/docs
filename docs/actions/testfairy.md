<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# testfairy


Upload a new build to TestFairy




> You can retrieve your API key on [your settings page](https://free.testfairy.com/settings/)


testfairy |
-----|----
Supported platforms | ios, android
Author | @taka0125, @tcurdt



## 1 Example

```ruby
testfairy(
  api_key: "...",
  ipa: "./ipa_file.ipa",
  comment: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_key` | API Key for TestFairy | -
  `ipa` | Path to your IPA file for iOS or APK for Android | -
  `symbols_file` | Symbols mapping file | -
  `testers_groups` | Array of tester groups to be notified | []
  `metrics` | Array of metrics to record (cpu,memory,network,phone_signal,gps,battery,mic,wifi) | []
  `comment` | Additional release notes for this upload. This text will be added to email notifications | No comment provided
  `auto_update` | Allows an easy upgrade of all users to the current version. The default is 'off', to enable set as 'on' | off
  `notify` | Send email to testers | off
  `options` | Array of options (shake,video_only_wifi,anonymous) | []

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action testfairy
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/testfairy.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
