<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_provisioning.rb
-->

# update_project_provisioning


Update projects code signing settings from your provisioning profile




> You should check out the [code signing guide](https://docs.fastlane.tools/codesigning/getting-started/) before using this action.<br>This action retrieves a provisioning profile UUID from a provisioning profile (`.mobileprovision`) to set up the Xcode projects' code signing settings in `*.xcodeproj/project.pbxproj`.<br>The `:target_filter` value can be used to only update code signing for the specified targets.<br>The `:build_configuration` value can be used to only update code signing for the specified build configurations of the targets passing through the `:target_filter`.<br>Example usage is the WatchKit Extension or WatchKit App, where you need separate provisioning profiles.<br>Example: `update_project_provisioning(xcodeproj: "..", target_filter: ".*WatchKit App.*")`.


update_project_provisioning ||
---|---
Supported platforms | ios, mac
Author | @tobiasstrebitzer, @czechboy0



## 1 Example

```ruby
update_project_provisioning(
  xcodeproj: "Project.xcodeproj",
  profile: "./watch_app_store.mobileprovision", # optional if you use sigh
  target_filter: ".*WatchKit Extension.*", # matches name or type of a target
  build_configuration: "Release",
  code_signing_identity: "iPhone Development" # optionally specify the codesigning identity
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
  `code_signing_identity` | Code sign identity for build configuration | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_project_provisioning
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_project_provisioning
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_project_provisioning parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_provisioning.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
