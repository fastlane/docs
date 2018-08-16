<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcodebuild.rb
-->

# xcodebuild


Use the `xcodebuild` command to build and sign your app




> **Note**: `xcodebuild` is a complex command, so it is recommended to use [_gym_](https://docs.fastlane.tools/actions/gym/) for building your ipa file and [_scan_](https://docs.fastlane.tools/actions/scan/) for testing your app instead.


xcodebuild ||
---|---
Supported platforms | ios, mac
Author | @dtrenz



## 1 Example

```ruby
xcodebuild(
  archive: true,
  archive_path: "./build-dir/MyApp.xcarchive",
  scheme: "MyApp",
  workspace: "MyApp.xcworkspace"
)
```





<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action xcodebuild
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcodebuild.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
