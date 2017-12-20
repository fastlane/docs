<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# build_ios_app


Easily build and sign your app (via _gym_)




> More information: https://fastlane.tools/gym


build_ios_app |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx
Returns | The absolute path to the generated ipa file



## 4 Examples

```ruby
build_ios_app(scheme: "MyApp", workspace: "MyApp.xcworkspace")
```

```ruby
build_ios_app(
  workspace: "MyApp.xcworkspace",
  configuration: "Debug",
  scheme: "MyApp",
  silent: true,
  clean: true,
  output_directory: "path/to/dir", # Destination directory. Defaults to current directory.
  output_name: "my-app.ipa",       # specify the name of the .ipa file to generate (including file extension)
  sdk: "iOS 11.1"        # use SDK as the name or path of the base SDK when building the project.
)
```

```ruby
gym         # alias for "build_ios_app"
```

```ruby
build_app   # alias for "build_ios_app"
```





## Parameters

Key | Description
----|------------
  `workspace` | Path to the workspace file
  `project` | Path to the project file
  `scheme` | The project's scheme. Make sure it's marked as `Shared`
  `clean` | Should the project be cleaned before building it?
  `output_directory` | The directory in which the ipa file should be stored in
  `output_name` | The name of the resulting ipa file
  `configuration` | The configuration to use when building the app. Defaults to 'Release'
  `silent` | Hide all information that's not necessary while building
  `codesigning_identity` | The name of the code signing identity to use. It has to match the name exactly. e.g. 'iPhone Distribution: SunApps GmbH'
  `skip_package_ipa` | Should we skip packaging the ipa?
  `include_symbols` | Should the ipa file include symbols?
  `include_bitcode` | Should the ipa file include bitcode?
  `export_method` | Method used to export the archive. Valid values are: app-store, ad-hoc, package, enterprise, development, developer-id
  `export_options` | Specifies path to export options plist. Use 'xcodebuild -help' to print the full set of available options
  `export_xcargs` | Pass additional arguments to xcodebuild for the package phase. Be sure to quote the setting names and values e.g. OTHER_LDFLAGS="-ObjC -lstdc++"
  `skip_build_archive` | Export ipa from previously built xarchive. Uses archive_path as source
  `skip_archive` | After building, don't archive, effectively not including -archivePath param
  `build_path` | The directory in which the archive should be stored in
  `archive_path` | The path to the created archive
  `derived_data_path` | The directory where built products and other derived data will go
  `result_bundle` | Location of the Xcode result bundle
  `buildlog_path` | The directory where to store the build log
  `sdk` | The SDK that should be used for building the application
  `toolchain` | The toolchain that should be used for building the application (e.g. com.apple.dt.toolchain.Swift_2_3, org.swift.30p620160816a)
  `destination` | Use a custom destination for building the app
  `export_team_id` | Optional: Sometimes you need to specify a team id when exporting the ipa file
  `xcargs` | Pass additional arguments to xcodebuild for the build phase. Be sure to quote the setting names and values e.g. OTHER_LDFLAGS="-ObjC -lstdc++"
  `xcconfig` | Use an extra XCCONFIG file to build your app
  `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog_path
  `disable_xcpretty` | Disable xcpretty formatting of build output
  `xcpretty_test_format` | Use the test (RSpec style) format for build output
  `xcpretty_formatter` | A custom xcpretty formatter to use
  `xcpretty_report_junit` | Have xcpretty create a JUnit-style XML report at the provided path
  `xcpretty_report_html` | Have xcpretty create a simple HTML report at the provided path
  `xcpretty_report_json` | Have xcpretty create a JSON compilation database at the provided path
  `analyze_build_time` | Analyze the project build time and store the output in 'culprits.txt' file
  `xcpretty_utf` | Have xcpretty use unicode encoding when reporting builds
  `skip_profile_detection` | Do not try to build a profile mapping from the xcodeproj. Match or a manually provided mapping should be used




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action build_ios_app
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/build_ios_app.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
