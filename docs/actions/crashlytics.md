<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# crashlytics


Upload a new build to Crashlytics Beta




> Additionally you can specify `notes`, `emails`, `groups` and `notifications`.
Distributing to Groups: When using the `groups` parameter, it's important to use the group **alias** names for each group you'd like to distribute to. A group's alias can be found in the web UI. If you're viewing the Beta page, you can open the groups dialog here:


crashlytics |
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx, @pedrogimenez



## 2 Examples

```ruby
crashlytics
```

```ruby
crashlytics(
  crashlytics_path: "./Pods/Crashlytics/", # path to your Crashlytics submit binary.
  api_token: "...",
  build_secret: "...",
  ipa_path: "./app.ipa"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `ipa_path` | Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action | -
  `apk_path` | Path to your APK file | -
  `crashlytics_path` | Path to the submit binary in the Crashlytics bundle (iOS) or `crashlytics-devtools.jar` file (Android) | -
  `api_token` | Crashlytics API Key | -
  `build_secret` | Crashlytics Build Secret | -
  `notes_path` | Path to the release notes | -
  `notes` | The release notes as string - uses :notes_path under the hood | -
  `groups` | The groups used for distribution, separated by commas | -
  `emails` | Pass email addresses of testers, separated by commas | -
  `notifications` | Crashlytics notification option (true/false) | true
  `debug` | Crashlytics debug option (true/false) | false

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action crashlytics
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/crashlytics.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
