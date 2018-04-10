<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_identifier.rb
-->

# update_app_identifier


Update the project's bundle identifier




> Update an app identifier by either setting `CFBundleIdentifier` or `PRODUCT_BUNDLE_IDENTIFIER`, depending on which is already in use.


update_app_identifier ||
---|---
Supported platforms | ios
Author | @squarefrog, @tobiasstrebitzer



## 1 Example

```ruby
update_app_identifier(
  xcodeproj: "Example.xcodeproj", # Optional path to xcodeproj, will use the first .xcodeproj if not set
  plist_path: "Example/Info.plist", # Path to info plist file, relative to xcodeproj
  app_identifier: "com.test.example" # The App Identifier
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcodeproj` | Path to your Xcode project | [*](#parameters-legend-dynamic)
  `plist_path` | Path to info plist, relative to your Xcode project | 
  `app_identifier` | The app Identifier you want to set | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_app_identifier
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_identifier.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
