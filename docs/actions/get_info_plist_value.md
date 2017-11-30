<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# get_info_plist_value


Returns value from Info.plist of your project as native Ruby data structures




> Get a value from a plist file, which can be used to fetch the app identifier and more information about your app


get_info_plist_value |
-----|----
Supported platforms | ios, mac
Author | @kohtenko



## 1 Example

```ruby
identifier = get_info_plist_value(path: "./Info.plist", key: "CFBundleIdentifier")
```





## Parameters

Key | Description
----|------------
  `key` | Name of parameter
  `path` | Path to plist file you want to read




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action get_info_plist_value
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_info_plist_value.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
