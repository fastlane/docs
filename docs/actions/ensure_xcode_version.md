<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_xcode_version.rb
-->

# ensure_xcode_version


Ensure the right version of Xcode is used




> If building your app requires a specific version of Xcode, you can invoke this command before using gym.<br>For example, to ensure that a beta version of Xcode is not accidentally selected to build, which would make uploading to TestFlight fail.<br>You can either manually provide a specific version using `version: ` or you make use of the `.xcode-version` file.


ensure_xcode_version ||
---|---
Supported platforms | ios, mac
Author | @JaviSoto, @KrauseFx



## 1 Example

```ruby
ensure_xcode_version(version: "7.2")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `version` | Xcode version to verify that is selected | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_xcode_version
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_xcode_version.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
