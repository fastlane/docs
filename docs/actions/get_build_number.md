<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# get_build_number


Get the build number of your project




> This action will return the current build number set on your project. You first have to set up your Xcode project, if you haven't done it already: https://developer.apple.com/library/ios/qa/qa1827/_index.html


get_build_number |
-----|----
Supported platforms | ios, mac
Author | @Liquidsoul



## 1 Example

```ruby
build_number = get_build_number(xcodeproj: "Project.xcodeproj")
```





## Parameters

Key | Description
----|------------
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory
  `hide_error_when_versioning_disabled` | Used during `fastlane init` to hide the error message




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action get_build_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_build_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
