<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_version_number.rb
-->

# get_version_number


Get the version number of your project




> This action will return the current version number set on your project.


get_version_number ||
---|---
Supported platforms | ios, mac
Author | @Liquidsoul, @joshdholtz



## 1 Example

```ruby
version = get_version_number(xcodeproj: "Project.xcodeproj")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | 
  `target` | Specify a specific target if you have multiple per project, optional | 
  `configuration` | Specify a specific configuration if you have multiple per target, optional | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action get_version_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_version_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
