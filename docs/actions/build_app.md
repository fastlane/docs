<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/build_app.rb
-->

# build_app


Alias for the `build_ios_app` action




<p align="center">
  <img src="/img/actions/gym.png" width="250">
</p>

-------

<p align="center">
    <a href="#whats-gym">Features</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#tips">Tips</a>
</p>

-------

<h5 align="center"><em>gym</em> is part of <a href="https://fastlane.tools">fastlane</a>: The easiest way to automate beta deployments and releases for your iOS and Android apps.</h5>

# What's gym?

_gym_ builds and packages iOS apps for you. It takes care of all the heavy lifting and makes it super easy to generate a signed `ipa` or `app` file 💪

_gym_ is a replacement for [shenzhen](https://github.com/nomad/shenzhen).

### Before _gym_

```no-highlight
xcodebuild clean archive -archivePath build/MyApp \
                         -scheme MyApp
xcodebuild -exportArchive \
           -exportFormat ipa \
           -archivePath "build/MyApp.xcarchive" \
           -exportPath "build/MyApp.ipa" \
           -exportProvisioningProfile "ProvisioningProfileName"
```

### With _gym_

```no-highlight
fastlane gym
```

### Why _gym_?

_gym_ uses the latest APIs to build and sign your application which results in much faster build times.

|          |  Gym Features  |
|----------|----------------|
🚀 | _gym_ builds 30% faster than other build tools like [shenzhen](https://github.com/nomad/shenzhen)
🏁 | Beautiful inline build output
📖 | Helps you resolve common build errors like code signing issues
🚠 | Sensible defaults: Automatically detect the project, its schemes and more
🔗 | Works perfectly with [_fastlane_](https://fastlane.tools) and other tools
📦 | Automatically generates an `ipa` and a compressed `dSYM` file
🚅 | Don't remember any complicated build commands, just _gym_
🔧 | Easy and dynamic configuration using parameters and environment variables
💾 | Store common build settings in a `Gymfile`
📤 | All archives are stored and accessible in the Xcode Organizer
💻 | Supports both iOS and Mac applications

![/img/actions/gymScreenshot.png](/img/actions/gymScreenshot.png)

-----

![/img/actions/gym.gif](/img/actions/gym.gif)

# Usage

```no-highlight
fastlane gym
```

That's all you need to build your application. If you want more control, here are some available parameters:

```no-highlight
fastlane gym --workspace "Example.xcworkspace" --scheme "AppName" --clean
```

If you need to use a different Xcode installation, use `xcode-select` or define `DEVELOPER_DIR`:

```no-highlight
DEVELOPER_DIR="/Applications/Xcode6.2.app" fastlane gym
```

For a list of all available parameters use

```no-highlight
fastlane action gym
```

If you run into any issues, use the `verbose` mode to get more information

```no-highlight
fastlane gym --verbose
```

Set the right export method if you're not uploading to App Store or TestFlight:

```no-highlight
fastlane gym --export_method ad-hoc
```

To pass boolean parameters make sure to use _gym_ like this:

```no-highlight
fastlane gym --include_bitcode true --include_symbols false
```

To access the raw `xcodebuild` output open `~/Library/Logs/gym`

# Gymfile

Since you might want to manually trigger a new build but don't want to specify all the parameters every time, you can store your defaults in a so called `Gymfile`.

Run `fastlane gym init` to create a new configuration file. Example:

```ruby-skip-tests
scheme("Example")

sdk("iphoneos9.0")

clean(true)

output_directory("./build")    # store the ipa in this folder
output_name("MyApp")           # the name of the ipa file
```

## Export options

Since Xcode 7, _gym_ is using new Xcode API which allows us to specify export options using `plist` file. By default _gym_ creates this file for you and you are able to modify some parameters by using `export_method`, `export_team_id`, `include_symbols` or `include_bitcode`. If you want to have more options, like creating manifest file for app thinning, you can provide your own `plist` file:

```ruby-skip-tests
export_options("./ExportOptions.plist")
```

or you can provide hash of values directly in the `Gymfile`:

```ruby-skip-tests
export_options({
  method: "ad-hoc",
  manifest: {
    appURL: "https://example.com/My App.ipa",
  },
  thinning: "<thin-for-all-variants>"
})
```

Optional: If _gym_ can't automatically detect the provisioning profiles to use, you can pass a mapping of bundle identifiers to provisioning profiles:

```ruby
build_ios_app(
  scheme: "Release",
  export_options: {
    method: "app-store",
    provisioningProfiles: { 
      "com.example.bundleid" => "Provisioning Profile Name",
      "com.example.bundleid2" => "Provisioning Profile Name 2"
    }
  }
)
```

**Note**: If you use [_fastlane_](https://fastlane.tools) with [_match_](https://fastlane.tools/match) you don't need to provide those values manually.

For the list of available options run `xcodebuild -help`.

## Setup code signing

- [More information on how to get started with codesigning](https://docs.fastlane.tools/codesigning/getting-started/)
- [Docs on how to set up your Xcode project](https://docs.fastlane.tools/codesigning/xcode-project/)

## Automating the whole process

_gym_ works great together with [_fastlane_](https://fastlane.tools), which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby
lane :beta do
  scan
  gym(scheme: "MyApp")
  crashlytics
end

# error block is executed when a error occurs
error do |lane, exception|
  slack(
    # message with short human friendly message
    message: exception.to_s, 
    success: false, 
    # Output containing extended log output
    payload: { "Output" => exception.error_info.to_s } 
  )
end
```

When _gym_ raises an error the `error_info` property will contain the process output
in case you want to display the error in 3rd party tools such as Slack.

You can then easily switch between the beta provider (e.g. `testflight`, `hockey`, `s3` and more).

# How does it work?

_gym_ uses the latest APIs to build and sign your application. The 2 main components are

- `xcodebuild`
- [xcpretty](https://github.com/supermarin/xcpretty)

When you run _gym_ without the `--silent` mode it will print out every command it executes.

To build the archive _gym_ uses the following command:

```no-highlight
set -o pipefail && \
xcodebuild -scheme 'Example' \
-project './Example.xcodeproj' \
-configuration 'Release' \
-destination 'generic/platform=iOS' \
-archivePath '/Users/felixkrause/Library/Developer/Xcode/Archives/2015-08-11/ExampleProductName 2015-08-11 18.15.30.xcarchive' \
archive | xcpretty
```

After building the archive it is being checked by _gym_. If it's valid, it gets packaged up and signed into an `ipa` file.

_gym_ automatically chooses a different packaging method depending on the version of Xcode you're using.

### Xcode 7 and above

```no-highlight
/usr/bin/xcrun path/to/xcbuild-safe.sh -exportArchive \
-exportOptionsPlist '/tmp/gym_config_1442852529.plist' \
-archivePath '/Users/fkrause/Library/Developer/Xcode/Archives/2015-09-21/App 2015-09-21 09.21.56.xcarchive' \
-exportPath '/tmp/1442852529'
```

_gym_ makes use of the new Xcode 7 API which allows us to specify the export options using a `plist` file. You can find more information about the available options by running `xcodebuild --help`.

Using this method there are no workarounds for WatchKit or Swift required, as it uses the same technique Xcode uses when exporting your binary.

Note: the [xcbuild-safe.sh script](https://github.com/fastlane/fastlane/blob/master/gym/lib/assets/wrap_xcodebuild/xcbuild-safe.sh) wraps around xcodebuild to workaround some incompatibilities.

## Use 'ProvisionQL' for advanced Quick Look in Finder

Install [ProvisionQL](https://github.com/ealeksandrov/ProvisionQL).

It will show you `ipa` files like this:
![img/actions/QuickLookScreenshot-App.png](/img/actions/QuickLookScreenshot-App.png)

<hr />


build_app ||
---|---
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

Key | Description | Default
----|-------------|--------
  `workspace` | Path to the workspace file | 
  `project` | Path to the project file | 
  `scheme` | The project's scheme. Make sure it's marked as `Shared` | 
  `clean` | Should the project be cleaned before building it? | `false`
  `output_directory` | The directory in which the ipa file should be stored in | `.`
  `output_name` | The name of the resulting ipa file | 
  `configuration` | The configuration to use when building the app. Defaults to 'Release' | [*](#parameters-legend-dynamic)
  `silent` | Hide all information that's not necessary while building | `false`
  `codesigning_identity` | The name of the code signing identity to use. It has to match the name exactly. e.g. 'iPhone Distribution: SunApps GmbH' | 
  `skip_package_ipa` | Should we skip packaging the ipa? | `false`
  `include_symbols` | Should the ipa file include symbols? | 
  `include_bitcode` | Should the ipa file include bitcode? | 
  `export_method` | Method used to export the archive. Valid values are: app-store, ad-hoc, package, enterprise, development, developer-id | 
  `export_options` | Path to an export options plist or a hash with export options. Use 'xcodebuild -help' to print the full set of available options | 
  `export_xcargs` | Pass additional arguments to xcodebuild for the package phase. Be sure to quote the setting names and values e.g. OTHER_LDFLAGS="-ObjC -lstdc++" | 
  `skip_build_archive` | Export ipa from previously built xcarchive. Uses archive_path as source | 
  `skip_archive` | After building, don't archive, effectively not including -archivePath param | 
  `build_path` | The directory in which the archive should be stored in | 
  `archive_path` | The path to the created archive | 
  `derived_data_path` | The directory where built products and other derived data will go | 
  `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false`
  `result_bundle_path` | Path to the result bundle directory to create. Ignored if `result_bundle` if false | 
  `buildlog_path` | The directory where to store the build log | [*](#parameters-legend-dynamic)
  `sdk` | The SDK that should be used for building the application | 
  `toolchain` | The toolchain that should be used for building the application (e.g. com.apple.dt.toolchain.Swift_2_3, org.swift.30p620160816a) | 
  `destination` | Use a custom destination for building the app | 
  `export_team_id` | Optional: Sometimes you need to specify a team id when exporting the ipa file | 
  `xcargs` | Pass additional arguments to xcodebuild for the build phase. Be sure to quote the setting names and values e.g. OTHER_LDFLAGS="-ObjC -lstdc++" | 
  `xcconfig` | Use an extra XCCONFIG file to build your app | 
  `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog_path | 
  `disable_xcpretty` | Disable xcpretty formatting of build output | 
  `xcpretty_test_format` | Use the test (RSpec style) format for build output | 
  `xcpretty_formatter` | A custom xcpretty formatter to use | 
  `xcpretty_report_junit` | Have xcpretty create a JUnit-style XML report at the provided path | 
  `xcpretty_report_html` | Have xcpretty create a simple HTML report at the provided path | 
  `xcpretty_report_json` | Have xcpretty create a JSON compilation database at the provided path | 
  `analyze_build_time` | Analyze the project build time and store the output in 'culprits.txt' file | 
  `xcpretty_utf` | Have xcpretty use unicode encoding when reporting builds | 
  `skip_profile_detection` | Do not try to build a profile mapping from the xcodeproj. Match or a manually provided mapping should be used | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `build_app` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::IPA_OUTPUT_PATH` | The path to the newly generated ipa file
  `SharedValues::DSYM_OUTPUT_PATH` | The path to the dSYM files
  `SharedValues::XCODEBUILD_ARCHIVE` | The path to the xcodebuild archive

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action build_app
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run build_app
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run build_app parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/build_app.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
