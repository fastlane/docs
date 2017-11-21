<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# get_version_number


Get the version number of your project




> This action will return the current version number set on your project. You first have to set up your Xcode project, if you haven't done it already: https://developer.apple.com/library/ios/qa/qa1827/_index.html


get_version_number |
-----|----
Supported platforms | ios, mac
Author | @Liquidsoul



**1 Example**

```ruby
version = get_version_number(xcodeproj: "Project.xcodeproj")
```





**Parameters**

Key | Description
----|------------
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory
  `scheme` | [DEPRECATED!] true - Specify a specific scheme if you have multiple per project, optional.
                                          This parameter is deprecated and will be removed in a future release.
                                          Please use the 'target' parameter instead. The behavior of this parameter
                                          is currently undefined if your scheme name doesn't match your target name
  `target` | Specify a specific target if you have multiple per project, optional




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action get_version_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_version_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
