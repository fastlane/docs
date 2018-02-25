<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# update_project_provisioning


Update projects code signing settings from your provisioning profile




> You should check out the code signing guide before using this action: https://docs.fastlane.tools/codesigning/getting-started/
This action retrieves a provisioning profile UUID from a provisioning profile (.mobileprovision) to set
up the xcode projects' code signing settings in *.xcodeproj/project.pbxproj
The `target_filter` value can be used to only update code signing for specified targets
The `build_configuration` value can be used to only update code signing for specified build configurations of the targets passing through the `target_filter`
Example Usage is the WatchKit Extension or WatchKit App, where you need separate provisioning profiles
Example: `update_project_provisioning(xcodeproj: "..", target_filter: ".*WatchKit App.*")


update_project_provisioning |
-----|----
Supported platforms | ios, mac
Author | @tobiasstrebitzer, @czechboy0



## 1 Example

```ruby
update_project_provisioning(
  xcodeproj: "Project.xcodeproj",
  profile: "./watch_app_store.mobileprovision", # optional if you use sigh
  target_filter: ".*WatchKit Extension.*", # matches name or type of a target
  build_configuration: "Release"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcodeproj` | Path to your Xcode project | 
  `profile` | Path to provisioning profile (.mobileprovision) | [*](#parameters-legend-dynamic)
  `target_filter` | A filter for the target name. Use a standard regex | 
  `build_configuration_filter` | Legacy option, use 'target_filter' instead | 
  `build_configuration` | A filter for the build configuration name. Use a standard regex. Applied to all configurations if not specified | 
  `certificate` | Path to apple root certificate | `/tmp/AppleIncRootCertificate.cer`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_project_provisioning
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_provisioning.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
