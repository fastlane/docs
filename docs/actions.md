# fastlane actions

This page contains a list of all built-in fastlane actions and their available options.

To get the most up-to-date information from the command line on your current version you can also run

```sh
fastlane actions # list all available fastlane actions
fastlane action [action_name] # more information for a specific action
```

You can import another `Fastfile` by using the `import` action. This is useful if you have shared lanes across multiple apps and you want to store a `Fastfile` in a separate folder. The path must be relative to the `Fastfile` this is called from.

```ruby
import './path/to/other/Fastfile'
```

- [Testing](#testing)
- [Building](#building)
- [Screenshots](#screenshots)
- [Project](#project)
- [Code Signing](#code-signing)
- [Documentation](#documentation)
- [Beta](#beta)
- [Releasing your app](#releasing-your-app)
- [Source Control](#source-control)
- [Notifications](#notifications)
- [Misc](#misc)
- [Plugins](#Plugins)




# Testing

### scan

Easily run tests of your iOS app using `scan`

> More information: https://github.com/fastlane/fastlane/tree/master/scan

scan | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
scan
```

```ruby
scan(
  workspace: "App.xcworkspace",
  scheme: "MyTests",
  clean: false
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `workspace` | Path the workspace file
  `project` | Path the project file
  `device` | The name of the simulator type you want to run tests on (e.g. 'iPhone 6')
  `devices` | Array of devices to run the tests on (e.g. ['iPhone 6', 'iPad Air'])
  `scheme` | The project's scheme. Make sure it's marked as `Shared`
  `clean` | Should the project be cleaned before building it?
  `code_coverage` | Should generate code coverage (Xcode 7 only)?
  `address_sanitizer` | Should turn on the address sanitizer?
  `skip_build` | Should skip debug build before test build?
  `output_directory` | The directory in which all reports will be stored
  `output_style` | Define how the output should look like (standard, basic, rspec or raw)
  `output_types` | Comma separated list of the output types (e.g. html, junit)
  `buildlog_path` | The directory were to store the raw log
  `formatter` | A custom xcpretty formatter to use
  `derived_data_path` | The directory where build products and other derived data will go
  `result_bundle` | Produce the result bundle describing what occurred will be placed
  `sdk` | The SDK that should be used for building the application
  `open_report` | Should the HTML report be opened when tests are completed
  `configuration` | The configuration to use when building the app. Defaults to 'Release'
  `destination` | Use only if you're a pro, use the other options instead
  `xcargs` | Pass additional arguments to xcodebuild. Be sure to quote the setting names and values e.g. OTHER_LDFLAGS="-ObjC -lstdc++"
  `xcconfig` | Use an extra XCCONFIG file to build your app
  `slack_url` | Create an Incoming WebHook for your Slack group to post results there
  `slack_channel` | #channel or @username
  `slack_message` | The message included with each message posted to slack
  `skip_slack` | Don't publish to slack, even when an URL is given
  `slack_only_on_failure` | Only post on Slack if the tests fail
  `use_clang_report_name` | Generate the json compilation database with clang naming convention (compile_commands.json)
  `custom_report_file_name` | Sets custom full report file name
  `fail_build` | Should this step stop the build if the tests fail? Set this to false if you're using trainer

</details>





### xctool

Run tests using xctool

> You can run any `xctool` action. This will require having [xctool](https://github.com/facebook/xctool) installed through [homebrew](http://brew.sh/). It is recommended to store the build configuration in the `.xctool-args` file. More information available on GitHub: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Actions.md#xctool

xctool | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
xctool :test
```

```ruby
# If you prefer to have the build configuration stored in the `Fastfile`:
xctool :test, [
  "--workspace", "'AwesomeApp.xcworkspace'",
  "--scheme", "'Schema Name'",
  "--configuration", "Debug",
  "--sdk", "iphonesimulator",
  "--arch", "i386"
].join(" ")
```


</details>






### slather

Use slather to generate a code coverage report

> Slather works with multiple code coverage formats including Xcode7 code coverage.
Slather is available at https://github.com/SlatherOrg/slather


slather | 
-----|----
Supported platforms | ios, mac
Author | @mattdelves



<details>
<summary>1 Example</summary>

```ruby
slather(
  build_directory: "foo",
  input_format: "bah",
  scheme: "MyScheme",
  proj: "MyProject.xcodeproj"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `build_directory` | The location of the build output
  `proj` | The project file that slather looks at
  `workspace` | The workspace that slather looks at
  `scheme` | Scheme to use when calling slather
  `input_format` | The input format that slather should look for
  `buildkite` | Tell slather that it is running on Buildkite
  `teamcity` | Tell slather that it is running on TeamCity
  `jenkins` | Tell slather that it is running on Jenkins
  `travis` | Tell slather that it is running on TravisCI
  `circleci` | Tell slather that it is running on CircleCI
  `coveralls` | Tell slather that it should post data to Coveralls
  `simple_output` | Tell slather that it should output results to the terminal
  `gutter_json` | Tell slather that it should output results as Gutter JSON format
  `cobertura_xml` | Tell slather that it should output results as Cobertura XML format
  `html` | Tell slather that it should output results as static HTML pages
  `show` | Tell slather that it should open static html pages automatically
  `source_directory` | Tell slather the location of your source files
  `output_directory` | Tell slather the location of for your output files
  `ignore` | Tell slather to ignore files matching a path or any path from an array of paths
  `verbose` | Tell slather to enable verbose mode
  `use_bundle_exec` | Use bundle exec to execute slather. Make sure it is in the Gemfile
  `binary_basename` | Basename of the binary file, this should match the name of your bundle excluding its extension (i.e. YourApp [for YourApp.app bundle])
  `binary_file` | Binary file name to be used for code coverage
  `source_files` | A Dir.glob compatible pattern used to limit the lookup to specific source files. Ignored in gcov mode
  `decimals` | The amount of decimals to use for % coverage reporting

</details>





### swiftlint

Run swift code validation using SwiftLint



swiftlint | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
swiftlint(
  mode: :lint,      # SwiftLint mode: :lint (default) or :autocorrect
  output_file: "swiftlint.result.json", # The path of the output file (optional)
  config_file: ".swiftlint-ci.yml",     # The path of the configuration file (optional)
  files: [# List of files to process (optional)
    "AppDelegate.swift",
    "path/to/project/Model.swift"
  ],
  ignore_exit_status: true    # Allow fastlane to continue even if SwiftLint returns a non-zero exit status
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `mode` | SwiftLint mode: :lint (default) or :autocorrect; default is :lint
  `output_file` | Path to output SwiftLint result
  `config_file` | Custom configuration file of SwiftLint
  `strict` | Fail on warnings? (true/false)
  `files` | List of files to process
  `ignore_exit_status` | Ignore the exit status of the SwiftLint command, so that serious violations                                                     don't fail the build (true/false)

</details>





### xcov

Nice code coverage reports without hassle

> Create nice code coverage reports and post coverage summaries on Slack *(xcov gem is required)*.
More information: https://github.com/nakiostudio/xcov

xcov | 
-----|----
Supported platforms | ios, mac
Author | @nakiostudio



<details>
<summary>1 Example</summary>

```ruby
xcov(
  workspace: "YourWorkspace.xcworkspace",
  scheme: "YourScheme",
  output_directory: "xcov_output"
)
```


</details>






### gcovr

Runs test coverage reports for your Xcode project

> Generate summarized code coverage reports using [gcovr](http://gcovr.com/)

gcovr | 
-----|----
Supported platforms | ios
Author | @dtrenz



<details>
<summary>1 Example</summary>

```ruby
gcovr(
  html: true,
  html_details: true,
  output: "./code-coverage/report.html"
)
```


</details>






### sonar

Invokes sonar-scanner to programmatically run SonarQube analysis

> See http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner for details.
It can process unit test results if formatted as junit report as shown in [xctest](#xctest) action. It can also integrate coverage reports in Cobertura format, which can be transformed into by [slather](#slather) action.

sonar | 
-----|----
Supported platforms | ios, android, mac
Author | @c_gretzki
Returns | The exit code of the sonar-scanner binary



<details>
<summary>1 Example</summary>

```ruby
sonar(
  project_key: "name.gretzki.awesomeApp",
  project_version: "1.0",
  project_name: "iOS - AwesomeApp",
  sources_path: File.expand_path("../AwesomeApp")
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `project_configuration_path` | The path to your sonar project configuration file; defaults to `sonar-project.properties`
  `project_key` | The key sonar uses to identify the project, e.g. `name.gretzki.awesomeApp`. Must either be specified here or inside the sonar project configuration file
  `project_name` | The name of the project that gets displayed on the sonar report page. Must either be specified here or inside the sonar project configuration file
  `project_version` | The project's version that gets displayed on the sonar report page. Must either be specified here or inside the sonar project configuration file
  `sources_path` | Comma-separated paths to directories containing source files. Must either be specified here or inside the sonar project configuration file
  `project_language` | Language key, e.g. objc
  `source_encoding` | Used encoding of source files, e.g., UTF-8
  `sonar_runner_args` | Pass additional arguments to sonar-scanner. Be sure to provide the arguments with a leading `-D` e.g. FL_SONAR_RUNNER_ARGS="-Dsonar.verbose=true"

</details>





### appium

Run UI test by Appium with RSpec



appium | 
-----|----
Supported platforms | ios
Author | @yonekawa



<details>
<summary>1 Example</summary>

```ruby
appium(
  app_path:  "appium/apps/TargetApp.app",
  spec_path: "appium/spec",
  platform:  "iOS",
  caps: {
    versionNumber: "9.1",
    deviceName:    "iPhone 6"
  }
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `platform` | Appium platform name
  `spec_path` | Path to Appium spec directory
  `app_path` | Path to Appium target app file
  `invoke_appium_server` | Use local Appium server with invoke automatically
  `host` | Hostname of Appium server
  `port` | HTTP port of Appium server
  `appium_path` | Path to Appium executable
  `caps` | Hash of caps for Appium::Driver

</details>





### xcode_server_get_assets

Downloads Xcode Bot assets like the `.xcarchive` and logs

> This action downloads assets from your Xcode Server Bot (works with Xcode Server
          using Xcode 6 and 7. By default this action downloads all assets, unzips them and
          deletes everything except for the `.xcarchive`. If you'd like to keep all downloaded
          assets, pass `:keep_all_assets: true`. This action returns the path to the downloaded
          assets folder and puts into shared values the paths to the asset folder and to the `.xcarchive` inside it

xcode_server_get_assets | 
-----|----
Supported platforms | ios, mac
Author | @czechboy0



<details>
<summary>1 Example</summary>

```ruby
xcode_server_get_assets(
  host: "10.99.0.59", # Specify Xcode Server's Host or IP Address
  bot_name: "release-1.3.4" # Specify the particular Bot
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `host` | IP Address/Hostname of Xcode Server
  `bot_name` | Name of the Bot to pull assets from
  `integration_number` | Optionally you can override which integration's assets should be downloaded. If not provided, the latest integration is used
  `username` | Username for your Xcode Server
  `password` | Password for your Xcode Server
  `target_folder` | Relative path to a folder into which to download assets
  `keep_all_assets` | Whether to keep all assets or let the script delete everything except for the .xcarchive
  `trust_self_signed_certs` | Whether to trust self-signed certs on your Xcode Server

</details>






# Building

### cocoapods

Runs `pod install` for the project

> If you use [CocoaPods](http://cocoapods.org) you can use the `cocoapods` integration to run `pod install` before building your app.

cocoapods | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx, @tadpol, @birmacher, @Liquidsoul



<details>
<summary>2 Examples</summary>

```ruby
cocoapods
```

```ruby
cocoapods(
  clean: true,
  podfile: "./CustomPodfile"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `clean` | Remove SCM directories
  `integrate` | Integrate the Pods libraries into the Xcode project(s)
  `repo_update` | Run `pod repo update` before install
  `silent` | Execute command without logging output
  `verbose` | Show more debugging information
  `ansi` | Show output with ANSI codes
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented
  `podfile` | Explicitly specify the path to the Cocoapods' Podfile. You can either set it to the Podfile's path or to the folder containing the Podfile file

</details>





### clear_derived_data

Deletes the Xcode Derived Data

> Deletes the Derived Data from '~/Library/Developer/Xcode/DerivedData' or a supplied path

clear_derived_data | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
clear_derived_data
```

```ruby
clear_derived_data(derived_data_path: "/custom/")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `derived_data_path` | Custom path for derivedData

</details>





### carthage

Runs `carthage` for your project



carthage | 
-----|----
Supported platforms | ios, mac
Author | @bassrock, @petester42, @jschmid, @JaviSoto, @uny, @phatblat, @bfcrampton



<details>
<summary>2 Examples</summary>

```ruby
carthage
```

```ruby
carthage(
  command: "bootstrap"        # One of: build, bootstrap, update, archive. (default: bootstrap)
  dependencies: ["Alamofire", "Notice"],# Specify which dependencies to update (only for the update command)
  use_ssh: false,   # Use SSH for downloading GitHub repositories.
  use_submodules: false,      # Add dependencies as Git submodules.
  use_binaries: true,         # Check out dependency repositories even when prebuilt frameworks exist
  no_build: false,  # When bootstrapping Carthage do not build
  no_skip_current: false,     # Don't skip building the current project (only for frameworks)
  verbose: false,   # Print xcodebuild output inline
  platform: "all",  # Define which platform to build for (one of ‘all’, ‘Mac’, ‘iOS’, ‘watchOS’, ‘tvOS‘, or comma-separated values of the formers except for ‘all’)
  configuration: "Release",   # Build configuration to use when building
  toolchain: "com.apple.dt.toolchain.Swift_2_3"   # Specify the xcodebuild toolchain
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `command` | Carthage command (one of: build, bootstrap, update, archive)
  `dependencies` | Carthage dependencies to update
  `use_ssh` | Use SSH for downloading GitHub repositories
  `use_submodules` | Add dependencies as Git submodules
  `use_binaries` | Check out dependency repositories even when prebuilt frameworks exist
  `no_build` | When bootstrapping Carthage do not build
  `no_skip_current` | Don't skip building the Carthage project (in addition to its dependencies)
  `derived_data` | Use derived data folder at path
  `verbose` | Print xcodebuild output inline
  `platform` | Define which platform to build for
  `configuration` | Define which build configuration to use when building
  `toolchain` | Define which xcodebuild toolchain to use when building
  `project_directory` | Define the directory containing the Carthage project

</details>





### xcode_select

Change the xcode-path to use. Useful for beta versions of Xcode

> Select and build with the Xcode installed at the provided path. Use the `xcversion` action if you want to select an Xcode based on a version specifier or you don't have known, stable paths as may happen in a CI environment.

xcode_select | 
-----|----
Supported platforms | ios, mac
Author | @dtrenz



<details>
<summary>1 Example</summary>

```ruby
xcode_select "/Applications/Xcode6.1.app"
```


</details>






### xcodebuild

Use the `xcodebuild` command to build and sign your app

> **Note**: `xcodebuild` is a complex command, so it is recommended to use [gym](https://github.com/fastlane/fastlane/tree/master/gym) for building your ipa file and [scan](https://github.com/fastlane/fastlane/tree/master/scan) for testing your app instead.

xcodebuild | 
-----|----
Supported platforms | ios, mac
Author | @dtrenz



<details>
<summary>1 Example</summary>

```ruby
xcodebuild(
  archive: true,
  archive_path: "./build-dir/MyApp.xcarchive",
  scheme: "MyApp",
  workspace: "MyApp.xcworkspace"
)
```


</details>






### adb

Run ADB Actions

> see adb --help for more details

adb | 
-----|----
Supported platforms | android
Author | @hjanuschka
Returns | The output of the adb command



<details>
<summary>1 Example</summary>

```ruby
adb(
  command: "shell ls"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `serial` | Android serial, which device should be used for this command
  `command` | All commands you want to pass to the adb command, e.g. `kill-server`
  `adb_path` | The path to your `adb` binary

</details>





### ensure_xcode_version

Ensure the selected Xcode version with xcode-select matches a value

> If building your app requires a specific version of Xcode, you can invoke this command before using gym.
        For example, to ensure that a beta version is not accidentally selected to build, which would make uploading to TestFlight fail.

ensure_xcode_version | 
-----|----
Supported platforms | ios, mac
Author | @JaviSoto



<details>
<summary>1 Example</summary>

```ruby
ensure_xcode_version(version: "7.2")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `version` | Xcode version to verify that is selected

</details>





### xcversion

Select an Xcode to use by version specifier

> Finds and selects a version of an installed Xcode that best matches the provided [`Gem::Version` requirement specifier](http://www.rubydoc.info/github/rubygems/rubygems/Gem/Version)

xcversion | 
-----|----
Supported platforms | ios, mac
Author | @oysta



<details>
<summary>2 Examples</summary>

```ruby
xcversion version: "7.1" # Selects Xcode 7.1.0
```

```ruby
xcversion version: "~> 7.1.0" # Selects the latest installed version from the 7.1.x set
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `version` | The version of Xcode to select specified as a Gem::Version requirement string (e.g. '~> 7.1.0')

</details>





### clean_cocoapods_cache

Remove the cache for pods



clean_cocoapods_cache | 
-----|----
Supported platforms | ios, mac
Author | @alexmx



<details>
<summary>2 Examples</summary>

```ruby
clean_cocoapods_cache
```

```ruby
clean_cocoapods_cache(name: "CACHED_POD")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `name` | Pod name to be removed from cache

</details>





### verify_pod_keys

Verifies all keys referenced from the Podfile are non-empty

> Runs a check against all keys specified in your Podfile to make sure they're more than a single character long. This is to ensure you don't deploy with stubbed keys.

verify_pod_keys | 
-----|----
Supported platforms | ios, mac
Author | @ashfurrow



<details>
<summary>1 Example</summary>

```ruby
verify_pod_keys
```


</details>







# Screenshots

### snapshot

Generate new localised screenshots on multiple devices



snapshot | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
snapshot
```

```ruby
snapshot(
  skip_open_summary: true,
  clean: true
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `workspace` | Path the workspace file
  `project` | Path the project file
  `devices` | A list of devices you want to take the screenshots from
  `languages` | A list of languages which should be used
  `launch_arguments` | A list of launch arguments which should be used
  `output_directory` | The directory where to store the screenshots
  `ios_version` | By default, the latest version should be used automatically. If you want to change it, do it here
  `skip_open_summary` | Don't open the HTML summary after running `snapshot`
  `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running snapshot
  `reinstall_app` | Enabling this option will automatically uninstall the application before running it
  `erase_simulator` | Enabling this option will automatically erase the simulator before running the application
  `localize_simulator` | Enabling this option will configure the Simulator's system language
  `app_identifier` | The bundle identifier of the app to uninstall (only needed when enabling reinstall_app)
  `add_photos` | A list of photos that should be added to the simulator before running the application
  `add_videos` | A list of videos that should be added to the simulator before running the application
  `buildlog_path` | The directory where to store the build log
  `clean` | Should the project be cleaned before building it?
  `configuration` | The configuration to use when building the app. Defaults to 'Release'
  `xcpretty_args` | Additional xcpretty arguments
  `sdk` | The SDK that should be used for building the application
  `scheme` | The scheme you want to use, this must be the scheme for the UI Tests
  `number_of_retries` | The number of times a test can fail before snapshot should stop retrying
  `stop_after_first_error` | Should snapshot stop immediately after the tests completely failed on one device?
  `derived_data_path` | The directory where build products and other derived data will go

</details>





### frameit

Adds device frames around the screenshots using frameit

> Use [frameit](https://github.com/fastlane/fastlane/tree/master/frameit) to prepare perfect screenshots for the App Store, your website, QA
or emails. You can add background and titles to the framed screenshots as well.

frameit | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
frameit
```

```ruby
frameit :silver
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `white` | Use white device frames
  `silver` | Use white device frames. Alias for :white
  `force_device_type` | Forces a given device type, useful for Mac screenshots, as their sizes vary
  `use_legacy_iphone5s` | use iPhone 5s instead of iPhone SE frames
  `path` | The path to the directory containing the screenshots

</details>





### screengrab

Automated localized screenshots of your Android app on every device



screengrab | 
-----|----
Supported platforms | android
Author | @asfalcone, @i2amsam, @mfurtak



<details>
<summary>2 Examples</summary>

```ruby
screengrab
```

```ruby
screengrab(
  locales: ["en-US", "fr-FR", "ja-JP"],
  clear_previous_screenshots: true,
  app_apk_path: "build/outputs/apk/example-debug.apk",
  tests_apk_path: "build/outputs/apk/example-debug-androidTest-unaligned.apk"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `android_home` | Path to the root of your Android SDK installation, e.g. ~/tools/android-sdk-macosx
  `build_tools_version` | The Android build tools version to use, e.g. '23.0.2'
  `locales` | A list of locales which should be used
  `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running screengrab
  `output_directory` | The directory where to store the screenshots
  `skip_open_summary` | Don't open the summary after running `screengrab`
  `app_package_name` | The package name of the app under test (e.g. com.yourcompany.yourapp)
  `tests_package_name` | The package name of the tests bundle (e.g. com.yourcompany.yourapp.test)
  `use_tests_in_packages` | Only run tests in these Java packages
  `use_tests_in_classes` | Only run tests in these Java classes
  `test_instrumentation_runner` | The fully qualified class name of your test instrumentation runner
  `ending_locale` | Return the device to this locale after running tests
  `app_apk_path` | The path to the APK for the app under test
  `tests_apk_path` | The path to the APK for the the tests bundle
  `specific_device` | Use the device or emulator with the given serial number or qualifier
  `device_type` | Type of device used for screenshots. Matches Google Play Types (phone, sevenInch, tenInch, tv, wear)

</details>






# Project

### set_info_plist_value

Sets value to Info.plist of your project as native Ruby data structures



set_info_plist_value | 
-----|----
Supported platforms | ios, mac
Author | @kohtenko



<details>
<summary>1 Example</summary>

```ruby
set_info_plist_value(path: "./Info.plist", key: "CFBundleIdentifier", value: "com.krausefx.app.beta")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `key` | Name of key in plist
  `value` | Value to setup
  `path` | Path to plist file you want to update

</details>





### get_version_number

Get the version number of your project

> This action will return the current version number set on your project. You first have to set up your Xcode project, if you haven't done it already: https://developer.apple.com/library/ios/qa/qa1827/_index.html

get_version_number | 
-----|----
Supported platforms | ios, mac
Author | @Liquidsoul



<details>
<summary>1 Example</summary>

```ruby
version = get_version_number(xcodeproj: "Project.xcodeproj")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory
  `scheme` | [DEPRECATED!] true - Specify a specific scheme if you have multiple per project, optional.
                                          This parameter is deprecated and will be removed in a future release.
                                          Please use the 'target' parameter instead. The behavior of this parameter
                                          is currently undefined if your scheme name doesn't match your target name
  `target` | Specify a specific target if you have multiple per project, optional

</details>





### update_info_plist

Update a Info.plist file with bundle identifier and display name

> This action allows you to modify your `Info.plist` file before building. This may be useful if you want a separate build for alpha, beta or nightly builds, but don't want a separate target.

update_info_plist | 
-----|----
Supported platforms | ios
Author | @tobiasstrebitzer



<details>
<summary>5 Examples</summary>

```ruby
update_info_plist( # update app identifier string
  plist_path: "path/to/Info.plist",
  app_identifier: "com.example.newappidentifier"
)
```

```ruby
update_info_plist( # Change the Display Name of your app
  plist_path: "path/to/Info.plist",
  display_name: "MyApp-Beta"
)
```

```ruby
update_info_plist( # Target a specific `xcodeproj` rather than finding the first available one
  xcodeproj: "path/to/Example.proj",
  plist_path: "path/to/Info.plist",
  display_name: "MyApp-Beta"
)
```

```ruby
update_info_plist( # Advanced processing: find URL scheme for particular key and replace value
  xcodeproj: "path/to/Example.proj",
  plist_path: "path/to/Info.plist",
  block: lambda { |plist|
    urlScheme = plist["CFBundleURLTypes"].find{|scheme| scheme["CFBundleURLName"] == "com.acme.default-url-handler"}
    urlScheme[:CFBundleURLSchemes] = ["acme-production"]
  }
)
```

```ruby
zip(
  path: "MyApp.app",
  output_path: "Latest.app.zip"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `xcodeproj` | Path to your Xcode project
  `plist_path` | Path to info plist
  `scheme` | Scheme of info plist
  `app_identifier` | The App Identifier of your app
  `display_name` | The Display Name of your app
  `block` | A block to process plist with custom logic

</details>





### get_build_number

Get the build number of your project

> This action will return the current build number set on your project. You first have to set up your Xcode project, if you haven't done it already: https://developer.apple.com/library/ios/qa/qa1827/_index.html

get_build_number | 
-----|----
Supported platforms | ios, mac
Author | @Liquidsoul



<details>
<summary>1 Example</summary>

```ruby
build_number = get_build_number(xcodeproj: "Project.xcodeproj")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory

</details>





### get_info_plist_value

Returns value from Info.plist of your project as native Ruby data structures

> Get a value from a plist file, which can be used to fetch the app identifier and more information about your app

get_info_plist_value | 
-----|----
Supported platforms | ios, mac
Author | @kohtenko



<details>
<summary>1 Example</summary>

```ruby
identifier = get_info_plist_value(path: "./Info.plist", key: "CFBundleIdentifier")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `key` | Name of parameter
  `path` | Path to plist file you want to read

</details>





### update_app_identifier

Update the project's bundle identifier

> Update an app identifier by either setting `CFBundleIdentifier` or `PRODUCT_BUNDLE_IDENTIFIER`, depending on which is already in use.

update_app_identifier | 
-----|----
Supported platforms | ios
Author | @squarefrog, @tobiasstrebitzer



<details>
<summary>1 Example</summary>

```ruby
update_app_identifier(
  xcodeproj: "Example.xcodeproj", # Optional path to xcodeproj, will use the first .xcodeproj if not set
  plist_path: "Example/Info.plist", # Path to info plist file, relative to xcodeproj
  app_identifier: "com.test.example" # The App Identifier
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `xcodeproj` | Path to your Xcode project
  `plist_path` | Path to info plist, relative to your Xcode project
  `app_identifier` | The app Identifier you want to set

</details>





### update_project_team

Update Xcode Development Team ID

> This action update the Developer Team ID of your Xcode Project.

update_project_team | 
-----|----
Supported platforms | ios, mac
Author | @lgaches



<details>
<summary>1 Example</summary>

```ruby
update_project_team(
  path: "Example.xcodeproj",
  teamid: "A3ZZVJ7CNY"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `path` | Path to your Xcode project
  `teamid` | The Team ID  you want to use

</details>





### update_app_group_identifiers

This action changes the app group identifiers in the entitlements file

> Updates the App Group Identifiers in the given Entitlements file, so you can have app groups for the app store build and app groups for an enterprise build.

update_app_group_identifiers | 
-----|----
Supported platforms | ios
Author | @mathiasAichinger



<details>
<summary>1 Example</summary>

```ruby
update_app_group_identifiers(
  entitlements_file: "/path/to/entitlements_file.entitlements",
  app_group_identifiers: ["group.your.app.group.identifier"]
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `entitlements_file` | The path to the entitlement file which contains the app group identifiers
  `app_group_identifiers` | An Array of unique identifiers for the app groups. Eg. ['group.com.test.testapp']

</details>





### get_ipa_info_plist_value

Returns a value from Info.plist inside a .ipa file

> This is useful for introspecting Info.plist files for .ipa files that have already been built.

get_ipa_info_plist_value | 
-----|----
Supported platforms | ios, mac
Author | @johnboiles
Returns | Returns the value in the .ipa's Info.plist corresponding to the passed in Key



<details>
<summary>1 Example</summary>

```ruby
get_ipa_info_plist_value(ipa: "path.ipa", key: "KEY_YOU_READ")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `key` | Name of parameter
  `ipa` | Path to IPA

</details>





### set_build_number_repository

Set the build number from the current repository

> This action will set the **build number** according to what the SCM HEAD reports.
Currently supported SCMs are svn (uses root revision), git-svn (uses svn revision) and git (uses short hash) and mercurial (uses short hash or revision number).
There is an option, `:use_hg_revision_number`, which allows to use mercurial revision number instead of hash

set_build_number_repository | 
-----|----
Supported platforms | ios, mac
Author | @pbrooks, @armadsen



<details>
<summary>1 Example</summary>

```ruby
set_build_number_repository
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `use_hg_revision_number` | Use hg revision number instead of hash (ignored for non-hg repos)

</details>





### update_url_schemes

Updates the URL schemes in the given Info.plist

> This action allows you to update the URL schemes of the app before building it.
For example, you can use this to set a different url scheme for the alpha
or beta version of the app.

update_url_schemes | 
-----|----
Supported platforms | ios, mac
Author | @kmikael



<details>
<summary>1 Example</summary>

```ruby
update_url_schemes(
  path: "path/to/Info.plist",
  url_schemes: ["com.myapp"]
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `path` | The Plist file's path
  `url_schemes` | The new URL schemes

</details>





### set_pod_key

Sets a value for a key with cocoapods-keys

> Adds a key to [cocoapods-keys](https://github.com/orta/cocoapods-keys)

set_pod_key | 
-----|----
Supported platforms | ios, mac
Author | @marcelofabri



<details>
<summary>1 Example</summary>

```ruby
set_pod_key(
  key: "APIToken",
  value: "1234",
  project: "MyProject"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented
  `key` | The key to be saved with cocoapods-keys
  `value` | The value to be saved with cocoapods-keys
  `project` | The project name

</details>






# Code Signing

### sigh

Generates a provisioning profile. Stores the profile in the current folder

> **Note**: It is recommended to use [match](https://github.com/fastlane/fastlane/tree/master/match) according to the [codesigning.guide](https://codesigning.guide) for generating and maintaining your provisioning profiles. Use `sigh` directly only if you want full control over what's going on and know more about codesigning.

sigh | 
-----|----
Supported platforms | ios
Author | @KrauseFx
Returns | The UDID of the profile sigh just fetched/generated



<details>
<summary>2 Examples</summary>

```ruby
sigh
```

```ruby
sigh(
  adhoc: true,
  force: true,
  filename: "myFile.mobileprovision"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `adhoc` | Setting this flag will generate AdHoc profiles instead of App Store Profiles
  `development` | Renew the development certificate instead of the production one
  `skip_install` | By default, the certificate will be added on your local machine. Setting this flag will skip this action
  `force` | Renew provisioning profiles regardless of its state - to automatically add all devices for ad hoc profiles
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `team_id` | The ID of your team if you're in multiple teams
  `team_name` | The name of your team if you're in multiple teams
  `provisioning_name` | The name of the profile that is used on the Apple Developer Portal
  `ignore_profiles_with_different_name` | Use in combination with :provisioning_name - when true only profiles matching this exact name will be downloaded
  `output_path` | Directory in which the profile should be stored
  `cert_id` | The ID of the code signing certificate to use (e.g. 78ADL6LVAA) 
  `cert_owner_name` | The certificate name to use for new profiles, or to renew with. (e.g. "Felix Krause")
  `filename` | Filename to use for the generated provisioning profile (must include .mobileprovision)
  `skip_fetch_profiles` | Skips the verification of existing profiles which is useful if you have thousands of profiles
  `skip_certificate_verification` | Skips the verification of the certificates for every existing profiles. This will make sure the provisioning profile can be used on the local machine

</details>





### cert

Fetch or generate the latest available code signing identity

> **Important**: It is recommended to use [match](https://github.com/fastlane/fastlane/tree/master/match) according to the [codesigning.guide](https://codesigning.guide) for generating and maintaining your certificates. Use `cert` directly only if you want full control over what's going on and know more about codesigning.
Use this action to download the latest code signing identity

cert | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
cert
```

```ruby
cert(
  development: true,
  username: "user@email.com"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `development` | Create a development certificate instead of a distribution one
  `force` | Create a certificate even if an existing certificate exists
  `username` | Your Apple ID Username
  `team_id` | The ID of your team if you're in multiple teams
  `team_name` | The name of your team if you're in multiple teams
  `output_path` | The path to a directory in which all certificates and private keys should be stored
  `keychain_path` | Path to a custom keychain

</details>





### update_project_provisioning

Update projects code signing settings from your provisioning profile

> You should check out the code signing gide before using this action: https://github.com/fastlane/fastlane/tree/master/fastlane/docs/Codesigning
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



<details>
<summary>1 Example</summary>

```ruby
update_project_provisioning(
  xcodeproj: "Project.xcodeproj",
  profile: "./watch_app_store.mobileprovision", # optional if you use sigh
  target_filter: ".*WatchKit Extension.*", # matches name or type of a target
  build_configuration: "Release"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `xcodeproj` | Path to your Xcode project
  `profile` | Path to provisioning profile (.mobileprovision)
  `target_filter` | A filter for the target name. Use a standard regex
  `build_configuration_filter` | Legacy option, use 'target_filter' instead
  `build_configuration` | A filter for the build configuration name. Use a standard regex. Applied to all configurations if not specified
  `certificate` | Path to apple root certificate

</details>





### resign

Codesign an existing ipa file

> You may provide multiple provisioning profiles if the application contains
nested applications or app extensions, which need their own provisioning
profile. You can do so by passing an array of provisiong profile strings or a
hash that associates provisioning profile values to bundle identifier keys.
resign(ipa: "path", signing_identity: "identity", provisioning_profile: {
  "com.example.awesome-app" => "App.mobileprovision",
  "com.example.awesome-app.app-extension" => "Extension.mobileprovision"
})

resign | 
-----|----
Supported platforms | ios
Author | @lmirosevic



<details>
<summary>2 Examples</summary>

```ruby
resign(
  ipa: "path/to/ipa", # can omit if using the `ipa` action
  signing_identity: "iPhone Distribution: Luka Mirosevic (0123456789)",
  provisioning_profile: "path/to/profile", # can omit if using the `sigh` action
)
```

```ruby
resign(
  ipa: "path/to/ipa", # can omit if using the `ipa` action
  signing_identity: "iPhone Distribution: Luka Mirosevic (0123456789)",
  provisioning_profile: {
    "com.example.awesome-app" => "path/to/profile",
    "com.example.awesome-app.app-extension" => "path/to/app-extension/profile"
  }
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `ipa` | Path to the ipa file to resign. Optional if you use the `gym` or `xcodebuild` action
  `signing_identity` | Code signing identity to use. e.g. "iPhone Distribution: Luka Mirosevic (0123456789)"
  `entitlements` | Path to the entitlement file to use, e.g. "myApp/MyApp.entitlements"
  `provisioning_profile` | Path to your provisioning_profile. Optional if you use `sigh`
  `version` | Version number to force resigned ipa to use.
Updates both CFBundleShortVersionString and CFBundleVersion values in Info.plist.
Applies for main app and all nested apps or extensions
  `display_name` | Display name to force resigned ipa to use
  `short_version` | Short version string to force resigned ipa to use (CFBundleShortVersionString)
  `bundle_version` | Bundle version to force resigned ipa to use (CFBundleVersion)
  `bundle_id` | Set new bundle ID during resign (CFBundleIdentifier)
  `use_app_entitlements` | Extract app bundle codesigning entitlements
and combine with entitlements from new provisionin profile
  `keychain_path` | Provide a path to a keychain file that should be used by /usr/bin/codesign

</details>





### register_devices

Registers new devices to the Apple Dev Portal

> This will register iOS devices with the Developer Portal so that you can include them in your provisioning profiles.
This is an optimistic action, in that it will only ever add new devices to the member center, and never remove devices. If a device which has already been registered within the member center is not passed to this action, it will be left alone in the member center and continue to work.
The action will connect to the Apple Developer Portal using the username you specified in your `Appfile` with `apple_id`, but you can override it using the `username` option, or by setting the env variable `ENV['DELIVER_USER']`.

register_devices | 
-----|----
Supported platforms | ios
Author | @lmirosevic



<details>
<summary>3 Examples</summary>

```ruby
register_devices(
  devices: {
    "Luka iPhone 6" => "1234567890123456789012345678901234567890",
    "Felix iPad Air 2" => "abcdefghijklmnopqrstvuwxyzabcdefghijklmn"
  }
) # Simply provide a list of devices as a Hash
```

```ruby
register_devices(
  devices_file: "./devices.txt"
) # Alternatively provide a standard UDID export .txt file, see the Apple Sample (https://devimages.apple.com.edgekey.net/downloads/devices/Multiple-Upload-Samples.zip)
```

```ruby
register_devices(
  devices_file: "./devices.txt", # You must pass in either `devices_file` or `devices`.
  team_id: "XXXXXXXXXX",         # Optional, if you"re a member of multiple teams, then you need to pass the team ID here.
  username: "luka@goonbee.com"   # Optional, lets you override the Apple Member Center username.
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `devices` | A hash of devices, with the name as key and the UDID as value
  `devices_file` | Provide a path to the devices to register
  `team_id` | optional: Your team ID
  `username` | Optional: Your Apple ID

</details>






# Documentation

### appledoc

Generate Apple-like source code documentation from specially formatted source code comments

> Runs `appledoc [OPTIONS] <paths to source dirs or files>` for the project

appledoc | 
-----|----
Supported platforms | ios, mac
Author | @alexmx



<details>
<summary>1 Example</summary>

```ruby
appledoc(
  project_name: "MyProjectName",
  project_company: "Company Name",
  input: "MyProjectSources",
  ignore: [
    "ignore/path/1",
    "ingore/path/2"
  ],
  options: "--keep-intermediate-files --search-undocumented-doc",
  warnings: "--warn-missing-output-path --warn-missing-company-id"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `input` | Path to source files
  `output` | Output path
  `templates` | Template files path
  `docset_install_path` | DocSet installation path
  `include` | Include static doc(s) at path
  `ignore` | Ignore given path
  `exclude_output` | Exclude given path from output
  `index_desc` | File including main index description
  `project_name` | Project name
  `project_version` | Project version
  `project_company` | Project company
  `company_id` | Company UTI (i.e. reverse DNS name)
  `create_html` | Create HTML
  `create_docset` | Create documentation set
  `install_docset` | Install documentation set to Xcode
  `publish_docset` | Prepare DocSet for publishing
  `html_anchors` | The html anchor format to use in DocSet HTML
  `clean_output` | Remove contents of output path before starting
  `docset_bundle_id` | DocSet bundle identifier
  `docset_bundle_name` | DocSet bundle name
  `docset_desc` | DocSet description
  `docset_copyright` | DocSet copyright message
  `docset_feed_name` | DocSet feed name
  `docset_feed_url` | DocSet feed URL
  `docset_feed_formats` | DocSet feed formats. Separated by a comma [atom,xml]
  `docset_package_url` | DocSet package (.xar) URL
  `docset_fallback_url` | DocSet fallback URL
  `docset_publisher_id` | DocSet publisher identifier
  `docset_publisher_name` | DocSet publisher name
  `docset_min_xcode_version` | DocSet min. Xcode version
  `docset_platform_family` | DocSet platform familiy
  `docset_cert_issuer` | DocSet certificate issuer
  `docset_cert_signer` | DocSet certificate signer
  `docset_bundle_filename` | DocSet bundle filename
  `docset_atom_filename` | DocSet atom feed filename
  `docset_xml_filename` | DocSet xml feed filename
  `docset_package_filename` | DocSet package (.xar,.tgz) filename
  `options` | Documentation generation options
  `crossref_format` | Cross reference template regex
  `exit_threshold` | Exit code threshold below which 0 is returned
  `docs_section_title` | Title of the documentation section (defaults to "Programming Guides"
  `warnings` | Documentation generation warnings
  `logformat` | Log format [0-3]
  `verbose` | Log verbosity level [0-6,xcode]

</details>






# Beta

### pilot

Upload a new binary to iTunes Connect for TestFlight beta testing

> More details can be found on https://github.com/fastlane/fastlane/tree/master/pilot
This integration will only do the TestFlight upload

pilot | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>4 Examples</summary>

```ruby
testflight
```

```ruby
pilot # alias for "testflight"
```

```ruby
testflight(skip_submission: true) # to only upload the build
```

```ruby
testflight(
  username: "felix@krausefx.com",
  app_identifier: "com.krausefx.app",
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | The bundle identifier of the app to upload or manage testers (optional)
  `ipa` | Path to the ipa file to upload
  `changelog` | Provide the what's new text when uploading a new build
  `skip_submission` | Skip the distributing action of pilot and only upload the ipa file
  `skip_waiting_for_build_processing` | Don't wait for the build to process. If set to true, the changelog won't be set
  `apple_id` | The unique App ID provided by iTunes Connect
  `distribute_external` | Should the build be distributed to external testers?
  `first_name` | The tester's first name
  `last_name` | The tester's last name
  `email` | The tester's email
  `testers_file_path` | Path to a CSV file of testers
  `wait_processing_interval` | Interval in seconds to wait for iTunes Connect processing
  `team_id` | The ID of your team if you're in multiple teams
  `team_name` | The name of your team if you're in multiple teams
  `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID!
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team

</details>





### crashlytics

Upload a new build to Crashlytics Beta

> Additionally you can specify `notes`, `emails`, `groups` and `notifications`.
#### Distributing to Groups
When using the `groups` parameter, it's important to use the group **alias** names for each group you'd like to distribute to. A group's alias can be found in the web UI. If you're viewing the Beta page, you can open the groups dialog here:

crashlytics | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx, @pedrogimenez



<details>
<summary>2 Examples</summary>

```ruby
crashlytics
```

```ruby
crashlytics(
  crashlytics_path: "./Pods/Crashlytics/", # path to your Crashlytics submit binary.
  api_token: "...",
  build_secret: "...",
  ipa_path: "./app.ipa"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `ipa_path` | Path to your IPA file. Optional if you use the `gym` or `xcodebuild` action
  `apk_path` | Path to your APK file
  `crashlytics_path` | Path to the submit binary in the Crashlytics bundle (iOS) or `crashlytics-devtools.jar` file (Android)
  `api_token` | Crashlytics Beta API Token
  `build_secret` | Crashlytics Build Secret
  `notes_path` | Path to the release notes
  `notes` | The release notes as string - uses :notes_path under the hood
  `groups` | The groups used for distribution, separated by commas
  `emails` | Pass email addresses of testers, separated by commas
  `notifications` | Crashlytics notification option (true/false)
  `debug` | Crashlytics debug option (true/false)

</details>





### s3

Generates a plist file and uploads all to AWS S3

> Upload a new build to Amazon S3 to distribute the build to beta testers.  Works for both Ad Hoc and Enterprise signed applications. This step will generate the necessary HTML, plist, and version files for you. It is recommended to **not** store the AWS access keys in the `Fastfile`. The uploaded `version.json` file provides an easy way for apps to poll if a new update is available.

s3 | 
-----|----
Supported platforms | ios
Author | @joshdholtz



<details>
<summary>2 Examples</summary>

```ruby
s3
```

```ruby
s3(
  # All of these are used to make Shenzhen's `ipa distribute:s3` command
  access_key: ENV["S3_ACCESS_KEY"],     # Required from user.
  secret_access_key: ENV["S3_SECRET_ACCESS_KEY"], # Required from user.
  bucket: ENV["S3_BUCKET"],   # Required from user.
  ipa: "AppName.ipa",         # Optional is you use `ipa` to build
  dsym: "AppName.app.dSYM.zip",         # Optional is you use `ipa` to build
  path: "v{CFBundleShortVersionString}_b{CFBundleVersion}/", # This is actually the default.
  upload_metadata: true,      # Upload version.json, plist and HTML. Set to false to skip uploading of these files.
  version_file_name: "app_version.json",# Name of the file to upload to S3. Defaults to "version.json"
  version_template_path: "path/to/erb"  # Path to an ERB to configure the structure of the version JSON file
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `ipa` | .ipa file for the build 
  `dsym` | zipped .dsym package for the build 
  `upload_metadata` | Upload relevant metadata for this build
  `plist_template_path` | plist template path
  `plist_file_name` | uploaded plist filename
  `html_template_path` | html erb template path
  `html_file_name` | uploaded html filename
  `version_template_path` | version erb template path
  `version_file_name` | uploaded version filename
  `access_key` | AWS Access Key ID 
  `secret_access_key` | AWS Secret Access Key 
  `bucket` | AWS bucket name
  `region` | AWS region (for bucket creation) 
  `path` | S3 'path'. Values from Info.plist will be substituded for keys wrapped in {}  
  `source` | Optional source directory e.g. ./build 
  `acl` | Uploaded object permissions e.g public_read (default), private, public_read_write, authenticated_read 

</details>





### deploygate

Upload a new build to [DeployGate](https://deploygate.com/)

> You can retrieve your username and API token on [your settings page](https://deploygate.com/settings)
More information about the available options can be found in the [DeployGate Push API document](https://deploygate.com/docs/api).

deploygate | 
-----|----
Supported platforms | ios
Author | @tnj



<details>
<summary>1 Example</summary>

```ruby
deploygate(
  api_token: "...",
  user: "target username or organization name",
  ipa: "./ipa_file.ipa",
  message: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
  distribution_key: "(Optional) Target Distribution Key"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `api_token` | Deploygate API Token
  `user` | Target username or organization name
  `ipa` | Path to your IPA file. Optional if you use the `gym` or `xcodebuild` action
  `message` | Release Notes
  `distribution_key` | Target Distribution Key
  `release_note` | Release note for distribution page

</details>





### testflight

Alias for the pilot action



testflight | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>4 Examples</summary>

```ruby
testflight
```

```ruby
pilot # alias for "testflight"
```

```ruby
testflight(skip_submission: true) # to only upload the build
```

```ruby
testflight(
  username: "felix@krausefx.com",
  app_identifier: "com.krausefx.app",
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | The bundle identifier of the app to upload or manage testers (optional)
  `ipa` | Path to the ipa file to upload
  `changelog` | Provide the what's new text when uploading a new build
  `skip_submission` | Skip the distributing action of pilot and only upload the ipa file
  `skip_waiting_for_build_processing` | Don't wait for the build to process. If set to true, the changelog won't be set
  `apple_id` | The unique App ID provided by iTunes Connect
  `distribute_external` | Should the build be distributed to external testers?
  `first_name` | The tester's first name
  `last_name` | The tester's last name
  `email` | The tester's email
  `testers_file_path` | Path to a CSV file of testers
  `wait_processing_interval` | Interval in seconds to wait for iTunes Connect processing
  `team_id` | The ID of your team if you're in multiple teams
  `team_name` | The name of your team if you're in multiple teams
  `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID!
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team

</details>





### testfairy

Upload a new build to TestFairy

> You can retrieve your API key on [your settings page](https://free.testfairy.com/settings/)

testfairy | 
-----|----
Supported platforms | ios
Author | @taka0125, @tcurdt



<details>
<summary>1 Example</summary>

```ruby
testfairy(
  api_key: "...",
  ipa: "./ipa_file.ipa",
  comment: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `api_key` | API Key for TestFairy
  `ipa` | Path to your IPA file. Optional if you use the `gym` or `xcodebuild` action
  `symbols_file` | Symbols mapping file
  `testers_groups` | Array of tester groups to be notified
  `metrics` | Array of metrics to record (cpu,memory,network,phone_signal,gps,battery,mic,wifi)
  `icon_watermark` | Add a small watermark to app icon
  `comment` | Additional release notes for this upload. This text will be added to email notifications
  `auto_update` | Allows easy upgrade of all users to current version
  `notify` | Send email to testers
  `options` | Array of options (shake,video_only_wifi,anonymous)

</details>





### appetize

Upload your app to Appetize.io to stream it in the browser

> If you provide a `public_key`, this will overwrite an existing application. If you want to have this build as a new app version, you shouldn't provide this value.
To integrate appetize into your GitHub workflow check out the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md)

appetize | 
-----|----
Supported platforms | ios, android
Author | @klundberg, @giginet



<details>
<summary>1 Example</summary>

```ruby
appetize(
  path: "./MyApp.zip",
  api_token: "yourapitoken", # get it from https://appetize.io/docs#request-api-token
  public_key: "your_public_key" # get it from https://appetize.io/dashboard
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `api_token` | Appetize.io API Token
  `url` | URL from which the ipa file can be fetched. Alternative to :path
  `platform` | Platform. Either `ios` or `android`. Default is `ios`
  `path` | Path to zipped build on the local filesystem. Either this or `url` must be specified
  `public_key` | If not provided, a new app will be created. If provided, the existing build will be overwritten
  `note` | Notes you wish to add to the uploaded app

</details>





### splunkmint

Upload dSYM file to Splunk MINT



splunkmint | 
-----|----
Supported platforms | ios
Author | @xfreebird



<details>
<summary>1 Example</summary>

```ruby
splunkmint(
  dsym: "My.app.dSYM.zip",
  api_key: "43564d3a",
  api_token: "e05456234c4869fb7e0b61"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `dsym` | dSYM.zip file to upload to Splunk MINT
  `api_key` | Splunk MINT App API key e.g. f57a57ca
  `api_token` | Splunk MINT API token e.g. e05ba40754c4869fb7e0b61
  `verbose` | Make detailed output
  `upload_progress` | Show upload progress
  `proxy_username` | Proxy username
  `proxy_password` | Proxy password
  `proxy_address` | Proxy address
  `proxy_port` | Proxy port

</details>





### set_changelog

Set the changelog for all languages on iTunes Connect

> This is useful if you have only one changelog for all languages.
You can store the changelog in `./fastlane/changelog.txt` and it will automatically get loaded from there. This integration is useful if you support e.g. 10 languages and want to use the same "What's new"-text for all languages.

set_changelog | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
set_changelog(app_identifier: "com.krausefx.app", version: "1.0", changelog: "All Languages")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `version` | The version number to create/update
  `changelog` | Changelog text that should be uploaded to iTunes Connect

</details>





### appaloosa

Upload your app to Appaloosa Store

> Appaloosa is a private mobile application store. This action 
offers a quick deployment on the platform. You can create an 
account, push to your existing account, or manage your user 
groups. We accept iOS and Android applications.

appaloosa | 
-----|----
Supported platforms | ios, android, mac
Author | @Appaloosa



<details>
<summary>1 Example</summary>

```ruby
appaloosa(
  # Path tor your IPA or APK
  binary: '/path/to/binary.ipa',
  # You can find your store’s id at the bottom of the “Settings” page of your store
  store_id: 'your_store_id',
  # You can find your api_token at the bottom of the “Settings” page of your store
  api_token: 'your_api_key',
  # User group_ids visibility, if it's not specified we'll publish the app for all users in your store'
  group_ids: '112, 232, 387',
  # You can use fastlane/snapshot or specify your own screenshots folder.
  # If you use snapshot please specify a local and a device to upload your screenshots from.
  # When multiple values are specified in the Snapfile, we default to 'en-US'
  locale: 'en-US',
  # By default, the screenshots from the last device will be used
  device: 'iPhone6',
  # Screenshots' filenames should start with device's name like 'iphone6-s1.png' if device specified
  screenshots: '/path/to_your/screenshots'
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `binary` | Binary path. Optional for ipa if you use the `ipa` or `xcodebuild` action
  `api_token` | Your API token
  `store_id` | Your Store id
  `group_ids` | Your app is limited to special users? Give us the group ids
  `screenshots` | Add some screenshots application to your store or hit [enter]
  `locale` | Select the folder locale for yours screenshots
  `device` | Select the device format for yours screenshots
  `description` | Your app description

</details>





### apteligent

Upload dSYM file to Apteligent (Crittercism)



apteligent | 
-----|----
Supported platforms | ios
Author | @Mo7amedFouad



<details>
<summary>1 Example</summary>

```ruby
apteligent(
  app_id: "...",
  api_key: "..."
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `dsym` | dSYM.zip file to upload to Apteligent
  `app_id` | Apteligent App ID key e.g. 569f5c87cb99e10e00c7xxxx
  `api_key` | Apteligent App API key e.g. IXPQIi8yCbHaLliqzRoo065tH0lxxxxx

</details>






# Releasing your app

### deliver

Uses deliver to upload new app metadata and builds to iTunes Connect

> Using _deliver_ after _gym_ and _snapshot_ will automatically upload the
latest ipa and screenshots with no other configuration
If you don't want a PDF report for App Store builds, use the `:force` option.
This is useful when running _fastlane_ on your Continuous Integration server: `deliver(force: true)`
If your account is on multiple teams and you need to tell the `iTMSTransporter`
which 'provider' to use, you can set the `itc_provider` option to pass this info.

deliver | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
deliver(
  force: true, # Set to true to skip PDF verification
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option

)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | The bundle identifier of your app
  `app` | The app ID of the app you want to use/modify
  `ipa` | Path to your ipa file
  `pkg` | Path to your pkg file
  `metadata_path` | Path to the folder containing the metadata files
  `screenshots_path` | Path to the folder containing the screenshots
  `skip_binary_upload` | Skip uploading an ipa or pkg to iTunes Connect
  `skip_screenshots` | Don't upload the screenshots
  `app_version` | The version that should be edited or created
  `skip_metadata` | Don't upload the metadata (e.g. title, description), this will still upload screenshots
  `force` | Skip the HTML report file verification
  `submit_for_review` | Submit the new version for Review after uploading everything
  `automatic_release` | Should the app be automatically released once it's approved?
  `price_tier` | The price tier of this application
  `build_number` | If set the given build number (already uploaded to iTC) will be used instead of the current built one
  `app_rating_config_path` | Path to the app rating's config
  `submission_information` | Extra information for the submission (e.g. third party content)
  `team_id` | The ID of your team if you're in multiple teams
  `team_name` | The name of your team if you're in multiple teams
  `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID!
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team
  `app_icon` | Metadata: The path to the app icon
  `apple_watch_app_icon` | Metadata: The path to the Apple Watch app icon
  `copyright` | Metadata: The copyright notice
  `primary_category` | Metadata: The english name of the primary category(e.g. `Business`, `Books`)
  `secondary_category` | Metadata: The english name of the secondary category(e.g. `Business`, `Books`)
  `primary_first_sub_category` | Metadata: The english name of the primary first sub category(e.g. `Educational`, `Puzzle`)
  `primary_second_sub_category` | Metadata: The english name of the primary second sub category(e.g. `Educational`, `Puzzle`)
  `secondary_first_sub_category` | Metadata: The english name of the secondary first sub category(e.g. `Educational`, `Puzzle`)
  `secondary_second_sub_category` | Metadata: The english name of the secondary second sub category(e.g. `Educational`, `Puzzle`)
  `app_review_information` | Metadata: A hash containing the review information
  `description` | Metadata: The localised app description
  `name` | Metadata: The localised app name
  `keywords` | Metadata: An array of localised keywords
  `release_notes` | Metadata: Localised release notes for this version
  `privacy_url` | Metadata: Localised privacy url
  `support_url` | Metadata: Localised support url
  `marketing_url` | Metadata: Localised marketing url

</details>





### supply

Upload metadata, screenshots and binaries to Google Play

> More information: https://github.com/fastlane/fastlane/tree/master/supply

supply | 
-----|----
Supported platforms | android
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
supply
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `package_name` | The package name of the Application to modify
  `track` | The Track to upload the Application to: production, beta, alpha, rollout
  `rollout` | The percentage of the rollout
  `metadata_path` | Path to the directory containing the metadata files
  `key` | [DEPRECATED!] Use --json_key instead - The p12 File used to authenticate with Google
  `issuer` | [DEPRECATED!] Use --json_key instead - The issuer of the p12 file (email address of the service account)
  `json_key` | The service account json file used to authenticate with Google
  `apk` | Path to the APK file to upload
  `apk_paths` | An array of paths to APK files to upload
  `skip_upload_apk` | Whether to skip uploading APK
  `skip_upload_metadata` | Whether to skip uploading metadata
  `skip_upload_images` | Whether to skip uploading images, screenshots not included
  `skip_upload_screenshots` | Whether to skip uploading SCREENSHOTS
  `track_promote_to` | The Track to promote to: production, beta, alpha, rollout

</details>





### appstore

Alias for the deliver action



appstore | 
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
deliver(
  force: true, # Set to true to skip PDF verification
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option

)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | The bundle identifier of your app
  `app` | The app ID of the app you want to use/modify
  `ipa` | Path to your ipa file
  `pkg` | Path to your pkg file
  `metadata_path` | Path to the folder containing the metadata files
  `screenshots_path` | Path to the folder containing the screenshots
  `skip_binary_upload` | Skip uploading an ipa or pkg to iTunes Connect
  `skip_screenshots` | Don't upload the screenshots
  `app_version` | The version that should be edited or created
  `skip_metadata` | Don't upload the metadata (e.g. title, description), this will still upload screenshots
  `force` | Skip the HTML report file verification
  `submit_for_review` | Submit the new version for Review after uploading everything
  `automatic_release` | Should the app be automatically released once it's approved?
  `price_tier` | The price tier of this application
  `build_number` | If set the given build number (already uploaded to iTC) will be used instead of the current built one
  `app_rating_config_path` | Path to the app rating's config
  `submission_information` | Extra information for the submission (e.g. third party content)
  `team_id` | The ID of your team if you're in multiple teams
  `team_name` | The name of your team if you're in multiple teams
  `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID!
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team
  `app_icon` | Metadata: The path to the app icon
  `apple_watch_app_icon` | Metadata: The path to the Apple Watch app icon
  `copyright` | Metadata: The copyright notice
  `primary_category` | Metadata: The english name of the primary category(e.g. `Business`, `Books`)
  `secondary_category` | Metadata: The english name of the secondary category(e.g. `Business`, `Books`)
  `primary_first_sub_category` | Metadata: The english name of the primary first sub category(e.g. `Educational`, `Puzzle`)
  `primary_second_sub_category` | Metadata: The english name of the primary second sub category(e.g. `Educational`, `Puzzle`)
  `secondary_first_sub_category` | Metadata: The english name of the secondary first sub category(e.g. `Educational`, `Puzzle`)
  `secondary_second_sub_category` | Metadata: The english name of the secondary second sub category(e.g. `Educational`, `Puzzle`)
  `app_review_information` | Metadata: A hash containing the review information
  `description` | Metadata: The localised app description
  `name` | Metadata: The localised app name
  `keywords` | Metadata: An array of localised keywords
  `release_notes` | Metadata: Localised release notes for this version
  `privacy_url` | Metadata: Localised privacy url
  `support_url` | Metadata: Localised support url
  `marketing_url` | Metadata: Localised marketing url

</details>






# Source Control

### ensure_git_status_clean

Raises an exception if there are uncommited git changes

> A sanity check to make sure you are working in a repo that is clean. Especially
useful to put at the beginning of your Fastfile in the `before_all` block, if
some of your other actions will touch your filesystem, do things to your git repo,
or just as a general reminder to save your work. Also needed as a prerequisite for
some other actions like `reset_git_repo`.

ensure_git_status_clean | 
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic



<details>
<summary>1 Example</summary>

```ruby
ensure_git_status_clean
```


</details>






### reset_git_repo

Resets git repo to a clean state by discarding uncommited changes

> This action will reset your git repo to a clean state, discarding any uncommitted and untracked changes. Useful in case you need to revert the repo back to a clean state, e.g. after the fastlane run. Untracked files like `.env` will also be deleted, unless `:skip_clean` is true. It's a pretty drastic action so it comes with a sort of safety latch. It will only proceed with the reset if either of these conditions are met: You have called the ensure_git_status_clean action prior to calling this action. This ensures that your repo started off in a clean state, so the only things that will get destroyed by this action are files that are created as a byproduct of the fastlane run.

reset_git_repo | 
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic



<details>
<summary>4 Examples</summary>

```ruby
reset_git_repo
```

```ruby
reset_git_repo(force: true) # If you don't care about warnings and are absolutely sure that you want to discard all changes. This will reset the repo even if you have valuable uncommitted changes, so use with care!
```

```ruby
reset_git_repo(skip_clean: true) # If you want "git clean" to be skipped, thus NOT deleting untracked files like ".env". Optional, defaults to false.
```

```ruby
reset_git_repo(
  force: true,
  files: [
    "./file.txt"
  ]
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `files` | Array of files the changes should be discarded. If not given, all files will be discarded
  `force` | Skip verifying of previously clean state of repo. Only recommended in combination with `files` option
  `skip_clean` | Skip 'git clean' to avoid removing untracked files like `.env`. Defaults to false
  `disregard_gitignore` | Setting this to true will clean the whole repository, ignoring anything in your local .gitignore. Set this to true if you want the equivalent of a fresh clone, and for all untracked and ignore files to also be removed
  `exclude` | You can pass a string, or array of, file pattern(s) here which you want to have survive the cleaning process, and remain on disk. E.g. to leave the `artifacts` directory you would specify `exclude: 'artifacts'`. Make sure this pattern is also in your gitignore! See the gitignore documentation for info on patterns

</details>





### commit_version_bump

Creates a 'Version Bump' commit. Run after `increment_build_number`

> This action will create a 'Version Bump' commit in your repo. Useful in conjunction with `increment_build_number`.
It checks the repo to make sure that only the relevant files have changed, these are the files that `increment_build_number` (`agvtool`) touches:
- All .plist files
- The `.xcodeproj/project.pbxproj` file
Then commits those files to the repo.
Customise the message with the `:message` option, defaults to 'Version Bump'
If you have other uncommitted changes in your repo, this action will fail. If you started off in a clean repo, and used the `ipa` and or `sigh` actions, then you can use the `clean_build_artifacts` action to clean those temporary files up before running this action.

commit_version_bump | 
-----|----
Supported platforms | ios, mac
Author | @lmirosevic



<details>
<summary>2 Examples</summary>

```ruby
commit_version_bump
```

```ruby
commit_version_bump(
  message: "Version Bump",# create a commit with a custom message
  xcodeproj: "./path/to/MyProject.xcodeproj", # optional, if you have multiple Xcode project files, you must specify your main project here
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `message` | The commit message when committing the version bump
  `xcodeproj` | The path to your project file (Not the workspace). If you have only one, this is optional
  `force` | Forces the commit, even if other files than the ones containing the version number have been modified
  `settings` | Include Settings.bundle/Root.plist with version bump
  `ignore` | A regular expression used to filter matched plist files to be modified

</details>





### add_git_tag

This will add an annotated git tag to the current branch

> This will automatically tag your build with the following format: `<grouping>/<lane>/<prefix><build_number>`, where:
- `grouping` is just to keep your tags organised under one 'folder', defaults to 'builds'
- `lane` is the name of the current fastlane lane
- `prefix` is anything you want to stick in front of the version number, e.g. 'v'
- `build_number` is the build number, which defaults to the value emitted by the `increment_build_number` action
For example for build 1234 in the 'appstore' lane it will tag the commit with `builds/appstore/1234`

add_git_tag | 
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic, @maschall



<details>
<summary>3 Examples</summary>

```ruby
add_git_tag # simple tag with default values
```

```ruby
add_git_tag(
  grouping: "fastlane-builds",
  prefix: "v",
  build_number: 123
)
```

```ruby
# Alternatively, you can specify your own tag. Note that if you do specify a tag, all other arguments are ignored.
add_git_tag(
  tag: "my_custom_tag"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `tag` | Define your own tag text. This will replace all other parameters
  `grouping` | Is used to keep your tags organised under one 'folder'. Defaults to 'builds'
  `prefix` | Anything you want to put in front of the version number (e.g. 'v')
  `build_number` | The build number. Defaults to the result of increment_build_number if you're using it
  `message` | The tag message. Defaults to the tag's name
  `commit` | The commit or object where the tag will be set. Defaults to the current HEAD
  `force` | Force adding the tag

</details>





### ensure_git_branch

Raises an exception if not on a specific git branch

> This action will check if your git repo is checked out to a specific branch.
You may only want to make releases from a specific branch, so `ensure_git_branch`
will stop a lane if it was accidentally executed on an incorrect branch.

ensure_git_branch | 
-----|----
Supported platforms | ios, android, mac
Author | @dbachrach, @Liquidsoul



<details>
<summary>2 Examples</summary>

```ruby
ensure_git_branch # defaults to `master` branch
```

```ruby
ensure_git_branch(
  branch: 'develop'
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `branch` | The branch that should be checked for. String that can be either the full name of the branch or a regex to match

</details>





### changelog_from_git_commits

Collect git commit messages into a changelog

> By default, messages will be collected back to the last tag, but the range can be controlled

changelog_from_git_commits | 
-----|----
Supported platforms | ios, android, mac
Author | @mfurtak, @asfalcone, @SiarheiFedartsou
Returns | Returns a String containing your formatted git commits



<details>
<summary>2 Examples</summary>

```ruby
changelog_from_git_commits
```

```ruby
changelog_from_git_commits(
  between: ["7b092b3", "HEAD"], # Optional, lets you specify a revision/tag range between which to collect commit info
  pretty: "- (%ae) %s", # Optional, lets you provide a custom format to apply to each commit when generating the changelog text
  tag_match_pattern: nil, # Optional, lets you search for a tag name that matches a glob(7) pattern
  match_lightweight_tag: false, # Optional, lets you ignore lightweight (non-annotated) tags when searching for the last tag
  include_merges: true # Optional, lets you filter out merge commits
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `between` | Array containing two Git revision values between which to collect messages, you mustn't use it with :commits_count key at the same time
  `commits_count` | Number of commits to include in changelog, you mustn't use it with :between key at the same time
  `pretty` | The format applied to each commit while generating the collected value
  `tag_match_pattern` | A glob(7) pattern to match against when finding the last git tag
  `match_lightweight_tag` | Whether or not to match a lightweight tag when searching for the last one
  `include_merges` | Whether or not to include any commits that are merges
[31m(DEPRECATED - use :merge_commit_filtering)[0m
  `merge_commit_filtering` | Controls inclusion of merge commits when collecting the changelog.
Valid values: 'include_merges', 'exclude_merges', 'only_include_merges'

</details>





### get_build_number_repository

Get the build number from the current repository

> This action will get the **build number** according to what the SCM HEAD reports.
Currently supported SCMs are svn (uses root revision), git-svn (uses svn revision) and git (uses short hash) and mercurial (uses short hash or revision number).
There is an option, `:use_hg_revision_number`, which allows to use mercurial revision number instead of hash.

get_build_number_repository | 
-----|----
Supported platforms | ios, mac
Author | @bartoszj, @pbrooks, @armadsen
Returns | The build number from the current repository



<details>
<summary>1 Example</summary>

```ruby
get_build_number_repository
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `use_hg_revision_number` | Use hg revision number instead of hash (ignored for non-hg repos)

</details>





### get_github_release

This will verify if a given release version is available on GitHub

> This will return all information about a release. For example:
              {"url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713",
                 "assets_url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713/assets",
                 "upload_url"=>"https://uploads.github.com/repos/KrauseFx/fastlane/releases/1537713/assets{?name}",
                 "html_url"=>"https://github.com/fastlane/fastlane/releases/tag/1.8.0",
                 "id"=>1537713,
                 "tag_name"=>"1.8.0",
                 "target_commitish"=>"master",
                 "name"=>"1.8.0 Switch Lanes & Pass Parameters",
                 "draft"=>false,
                 "author"=>
                  {"login"=>"KrauseFx",
                   "id"=>869950,
                   "avatar_url"=>"https://avatars.githubusercontent.com/u/869950?v=3",
                   "gravatar_id"=>"",
                   "url"=>"https://api.github.com/users/KrauseFx",
                   "html_url"=>"https://github.com/fastlane",
                   "followers_url"=>"https://api.github.com/users/KrauseFx/followers",
                   "following_url"=>"https://api.github.com/users/KrauseFx/following{/other_user}",
                   "gists_url"=>"https://api.github.com/users/KrauseFx/gists{/gist_id}",
                   "starred_url"=>"https://api.github.com/users/KrauseFx/starred{/owner}{/repo}",
                   "subscriptions_url"=>"https://api.github.com/users/KrauseFx/subscriptions",
                   "organizations_url"=>"https://api.github.com/users/KrauseFx/orgs",
                   "repos_url"=>"https://api.github.com/users/KrauseFx/repos",
                   "events_url"=>"https://api.github.com/users/KrauseFx/events{/privacy}",
                   "received_events_url"=>"https://api.github.com/users/KrauseFx/received_events",
                   "type"=>"User",
                   "site_admin"=>false},
                 "prerelease"=>false,
                 "created_at"=>"2015-07-14T23:33:01Z",
                 "published_at"=>"2015-07-14T23:44:10Z",
                 "assets"=>[],
                 "tarball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/tarball/1.8.0",
                 "zipball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/zipball/1.8.0",
                 "body"=> ...Markdown...
                "This is one of the biggest updates of `fastlane` yet"
              }

get_github_release | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx, @czechboy0, @jaleksynas



<details>
<summary>1 Example</summary>

```ruby
release = get_github_release(url: "fastlane/fastlane", version: "1.0.0")
puts release["name"]
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `url` | The path to your repo, e.g. 'KrauseFx/fastlane'
  `server_url` | The server url. e.g. 'https://your.github.server/api/v3' (Default: 'https://api.github.com')
  `version` | The version tag of the release to check
  `api_token` | GitHub Personal Token (required for private repositories)

</details>





### create_pull_request

This will create a new pull request on GitHub



create_pull_request | 
-----|----
Supported platforms | ios, android, mac
Author | @seei



<details>
<summary>1 Example</summary>

```ruby
create_pull_request(
  api_token: ENV["GITHUB_TOKEN"],
  repo: "fastlane/fastlane",
  title: "Amazing new feature",
  head: "my-feature",       # optional, defaults to current branch name
  base: "master", # optional, defaults to "master"
  body: "Please pull this in!",       # optional
  api_url: "http://yourdomain/api/v3" # optional, for Github Enterprise, defaults to "https://api.github.com"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens
  `repo` | The name of the repository you want to submit the pull request to
  `title` | The title of the pull request
  `body` | The contents of the pull request
  `head` | The name of the branch where your changes are implemented (defaults to the current branch name)
  `base` | The name of the branch you want your changes pulled into (defaults to `master`)
  `api_url` | The URL of Github API - used when the Enterprise (default to `https://api.github.com`)

</details>






# Notifications

### slack

Send a success/error message to your Slack group

> Create an Incoming WebHook and export this as `SLACK_URL`. Can send a message to **#channel** (by default), a direct message to **@username** or a message to a private group **group** with success (green) or failure (red) status.

slack | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
slack(message: "App successfully released!")
```

```ruby
slack(
  message: "App successfully released!",
  channel: "#channel",  # Optional, by default will post to the default channel configured for the POST URL.
  success: true,        # Optional, defaults to true.
  payload: {  # Optional, lets you specify any number of your own Slack attachments.
    "Build Date" => Time.new.to_s,
    "Built by" => "Jenkins",
  },
  default_payloads: [:git_branch, :git_author], # Optional, lets you specify a whitelist of default payloads to include. Pass an empty array to suppress all the default payloads.
        # Don't add this key, or pass nil, if you want all the default payloads. The available default payloads are: `lane`, `test_result`, `git_branch`, `git_author`, `last_git_commit_message`.
  attachment_properties: { # Optional, lets you specify any other properties available for attachments in the slack API (see https://api.slack.com/docs/attachments).
       # This hash is deep merged with the existing properties set using the other properties above. This allows your own fields properties to be appended to the existing fields that were created using the `payload` property for instance.
    thumb_url: "http://example.com/path/to/thumb.png",
    fields: [{
      title: "My Field",
      value: "My Value",
      short: true
    }]
  }
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `message` | The message that should be displayed on Slack. This supports the standard Slack markup language
  `channel` | #channel or @username
  `use_webhook_configured_username_and_icon` | Use webook's default username and icon settings? (true/false)
  `slack_url` | Create an Incoming WebHook for your Slack group
  `username` | Overrides the webook's username property if use_webhook_configured_username_and_icon is false
  `icon_url` | Overrides the webook's image property if use_webhook_configured_username_and_icon is false
  `payload` | Add additional information to this post. payload must be a hash containg any key with any value
  `default_payloads` | Remove some of the default payloads. More information about the available payloads on GitHub
  `attachment_properties` | Merge additional properties in the slack attachment, see https://api.slack.com/docs/attachments
  `success` | Was this build successful? (true/false)

</details>





### chatwork

Send a success/error message to ChatWork

> Information on how to obtain an API token: http://developer.chatwork.com/ja/authenticate.html

chatwork | 
-----|----
Supported platforms | ios, android, mac
Author | @astronaughts



<details>
<summary>1 Example</summary>

```ruby
chatwork(
  message: "App successfully released!",
  roomid: 12345,
  success: true,
  api_token: "Your Token"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `api_token` | ChatWork API Token
  `message` | The message to post on ChatWork
  `roomid` | The room ID
  `success` | Was this build successful? (true/false)

</details>





### flock

Send a message to a Flock group

> To obtain the token, create a new [incoming message webhook](https://dev.flock.co/wiki/display/FlockAPI/Incoming+Webhooks)
in your Flock admin panel.

flock | 
-----|----
Supported platforms | ios, android, mac
Author | @Manav



<details>
<summary>1 Example</summary>

```ruby
flock(
  message: "Hello",
  token: "xxx"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `message` | Message text
  `token` | Token for the Flock incoming webhook
  `base_url` | Base URL of the Flock incoming message webhook

</details>





### twitter

Post a tweet on Twitter.com

> Post a tweet on twitter. Requires you to setup an app on twitter.com and obtain consumer and access_token.

twitter | 
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



<details>
<summary>1 Example</summary>

```ruby
twitter(
  access_token: "XXXX",
  access_token_secret: "xxx",
  consumer_key: "xxx",
  consumer_secret: "xxx",
  message: "You rock!"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `consumer_key` | Consumer Key
  `consumer_secret` | Consumer Secret
  `access_token` | Access Token
  `access_token_secret` | Access Token Secret
  `message` | The tweet

</details>





### typetalk

Post a message to Typetalk



typetalk | 
-----|----
Supported platforms | ios, android, mac
Author | @Nulab Inc.



<details>
<summary>1 Example</summary>

```ruby
typetalk(
  message: "App successfully released!",
  note_path: "ChangeLog.md",
  topicId: 1,
  success: true,
  typetalk_token: "Your Typetalk Token"
)
```


</details>







# Misc

### fastlane_version

Verifies the minimum fastlane version required

> Add this to your `Fastfile` to require a certain version of _fastlane_.
Use it if you use an action that just recently came out and you need it

fastlane_version | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
fastlane_version "1.50.0"
```


</details>






### default_platform

Defines a default platform to not have to specify the platform



default_platform | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
default_platform :android
```


</details>






### clean_build_artifacts

Deletes files created as result of running ipa, cert, sigh or download_dsyms

> This action deletes the files that get created in your repo as a result of running the `ipa` and `sigh` commands. It doesn't delete the `fastlane/report.xml` though, this is probably more suited for the .gitignore.
Useful if you quickly want to send out a test build by dropping down to the command line and typing something like `fastlane beta`, without leaving your repo in a messy state afterwards.

clean_build_artifacts | 
-----|----
Supported platforms | ios, mac
Author | @lmirosevic



<details>
<summary>1 Example</summary>

```ruby
clean_build_artifacts
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `exclude_pattern` | Exclude all files from clearing that match the given Regex pattern: e.g. '.*.mobileprovision'

</details>





### unlock_keychain

Unlock a keychain

> Unlocks the give keychain file and adds it to the keychain search list
Keychains can be replaced with `add_to_search_list: :replace`

unlock_keychain | 
-----|----
Supported platforms | ios, android, mac
Author | @xfreebird



<details>
<summary>4 Examples</summary>

```ruby
unlock_keychain( # Unlock an existing keychain and add it to the keychain search list
  path: "/path/to/KeychainName.keychain",
  password: "mysecret"
)
```

```ruby
unlock_keychain( # By default the keychain is added to the existing. To replace them with the selected keychain you may use `:replace`
  path: "/path/to/KeychainName.keychain",
  password: "mysecret",
  add_to_search_list: :replace # To only add a keychain use `true` or `:add`.
)
```

```ruby
unlock_keychain( # In addition, the keychain can be selected as a default keychain
  path: "/path/to/KeychainName.keychain",
  password: "mysecret",
  set_default: true
)
```

```ruby
unlock_keychain( # If the keychain file is located in the standard location `~/Library/Keychains`, then it is sufficient to provide the keychain file name, or file name with its suffix.
  path: "KeychainName",
  password: "mysecret"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `path` | Path to the Keychain file
  `password` | Keychain password
  `add_to_search_list` | Add to keychain search list
  `set_default` | Set as default keychain

</details>





### update_fastlane

Makes sure fastlane-tools are up-to-date when running fastlane

> This action will look at all installed fastlane tools and update them to the next available minor version - major version updates will not be performed automatically, as they might include breaking changes. If an update was performed, fastlane will be restarted before the run continues.
If you are using rbenv or rvm, everything should be good to go. However, if you are using the system's default ruby, some additional setup is needed for this action to work correctly. In short, fastlane needs to be able to access your gem library without running in `sudo` mode.
The simplest possible fix for this is putting the following lines into your `~/.bashrc` or `~/.zshrc` file:
```bash
export GEM_HOME=~/.gems
export PATH=$PATH:~/.gems/bin
```
After the above changes, restart your terminal, then run `mkdir $GEM_HOME` to create the new gem directory. After this, you're good to go!
Recommended usage of the `update_fastlane` action is at the top of the `before_all` block, before running any other action

update_fastlane | 
-----|----
Supported platforms | ios, android, mac
Author | @milch



<details>
<summary>1 Example</summary>

```ruby
before_all do
  update_fastlane
  ...
end
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `tools` | Comma separated list of fastlane tools to update (e.g. fastlane,deliver,sigh). If not specified, all currently installed fastlane-tools will be updated
  `no_update` | Don't update during this run. Defaults to false

</details>





### say

This action speaks out loud the given text



say | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
say "I can speak"
```


</details>






### bundle_install

This action runs `bundle install` (if available)



bundle_install | 
-----|----
Supported platforms | ios, android, mac
Author | @birmacher, @koglinjg


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `binstubs` | Generate bin stubs for bundled gems to ./bin
  `clean` | Run bundle clean automatically after install
  `full_index` | Use the rubygems modern index instead of the API endpoint
  `gemfile` | Use the specified gemfile instead of Gemfile
  `jobs` | Install gems using parallel workers
  `local` | Do not attempt to fetch gems remotely and use the gem cache instead
  `deployment` | Install using defaults tuned for deployment and CI environments
  `no_cache` | Don't update the existing gem cache
  `no_prune` | Don't remove stale gems from the cache
  `path` | Specify a different path than the system default ($BUNDLE_PATH or $GEM_HOME). Bundler will remember this value for future installs on this machine
  `system` | Install to the system location ($BUNDLE_PATH or $GEM_HOME) even if the bundle was previously installed somewhere else for this application
  `quiet` | Only output warnings and errors
  `retry` | Retry network and git requests that have failed
  `shebang` | Specify a different shebang executable name than the default (usually 'ruby')
  `standalone` | Make a bundle that can work without the Bundler runtime
  `trust_policy` | Sets level of security when dealing with signed gems. Accepts `LowSecurity`, `MediumSecurity` and `HighSecurity` as values
  `without` | Exclude gems that are part of the specified named group
  `with` | Include gems that are part of the specified named group

</details>





### setup_jenkins

Setup xcodebuild, gym and scan for easier Jenkins integration

> - Adds and unlocks keychains from Jenkins 'Keychains and Provisioning Profiles Plugin'
- Sets code signing identity from Jenkins 'Keychains and Provisioning Profiles Plugin'
- Sets output directory to './output' (gym, scan and backup_xcarchive).
- Sets derived data path to './derivedData' (xcodebuild, gym, scan and clear_derived_data, carthage).
- Produce result bundle (gym and scan).
This action helps with Jenkins integration. Creates own derived data for each job. All build results like IPA files and archives will be stored in the `./output` directory.
The action also works with [Keychains and Provisioning Profiles Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Keychains+and+Provisioning+Profiles+Plugin), selected keychain
will be automatically unlocked and the selected code signing identity will be used. By default this action will only work when fastlane is executed on a CI system.

setup_jenkins | 
-----|----
Supported platforms | ios, mac
Author | @bartoszj



<details>
<summary>1 Example</summary>

```ruby
setup_jenkins
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `force` | Force setup, even if not executed by Jenkins
  `unlock_keychain` | Unlocks keychain
  `add_keychain_to_search_list` | Add to keychain search list
  `set_default_keychain` | Set keychain as default
  `keychain_path` | Path to keychain
  `keychain_password` | Keychain password
  `set_code_signing_identity` | Set code signing identity from CODE_SIGNING_IDENTITY environment
  `code_signing_identity` | Code signing identity
  `output_directory` | The directory in which the ipa file should be stored in
  `derived_data_path` | The directory where build products and other derived data will go
  `result_bundle` | Produce the result bundle describing what occurred will be placed

</details>





### skip_docs

Skip the creation of the fastlane/README.md file when running fastlane

> Tell `fastlane` to not automatically create a `fastlane/README.md` when running `fastlane`. You can always trigger the creation of this file manually by running `fastlane docs`

skip_docs | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
skip_docs
```


</details>






### badge

Automatically add a badge to your app icon

> This action will add a light/dark badge onto your app icon.
You can also provide your custom badge/overlay or add an shield for more customization more info:
https://github.com/HazAT/badge
**Note** If you want to reset the badge back to default you can use `sh 'git checkout -- <path>/Assets.xcassets/'`

badge | 
-----|----
Supported platforms | ios, android, mac
Author | @DanielGri



<details>
<summary>4 Examples</summary>

```ruby
badge(dark: true)
```

```ruby
badge(alpha: true)
```

```ruby
badge(custom: "/Users/xxx/Desktop/badge.png")
```

```ruby
badge(shield: "Version-0.0.3-blue", no_badge: true)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `dark` | Adds a dark flavored badge ontop of your icon
  `custom` | Add your custom overlay/badge image
  `no_badge` | Hides the beta badge
  `shield` | Add a shield to your app icon from shield.io
  `alpha` | Adds and alpha badge instead of the default beta one
  `path` | Sets the root path to look for AppIcons
  `shield_io_timeout` | Set custom duration for the timeout of the shield.io request in seconds
  `glob` | Glob pattern for finding image files
  `alpha_channel` | Keeps/adds an alpha channel to the icon (useful for android icons)
  `shield_gravity` | Position of shield on icon. Default: North - Choices include: NorthWest, North, NorthEast, West, Center, East, SouthWest, South, SouthEast
  `shield_no_resize` | Shield image will no longer be resized to aspect fill the full icon. Instead it will only be shrinked to not exceed the icon graphic

</details>





### download

Download a file from a remote server (e.g. JSON file)

> Specify the URL to download and get the content as a return value
For more advanced networking code, use the Ruby functions instead:
http://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html

download | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
data = download(url: "https://host.com/api.json")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `url` | The URL that should be downloaded

</details>





### create_keychain

Create a new Keychain



create_keychain | 
-----|----
Supported platforms | ios, android, mac
Author | @gin0606



<details>
<summary>1 Example</summary>

```ruby
create_keychain(
  name: "KeychainName",
  default_keychain: true,
  unlock: true,
  timeout: 3600,
  lock_when_sleeps: true
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `name` | Keychain name
  `password` | Password for the keychain
  `default_keychain` | Set the default keychain
  `unlock` | Unlock keychain after create
  `timeout` | timeout interval in seconds. Set `false` if you want to specify "no time-out"
  `lock_when_sleeps` | Lock keychain when the system sleeps
  `lock_after_timeout` | Lock keychain after timeout interval
  `add_to_search_list` | Add keychain to search list

</details>





### delete_keychain

Delete keychains and remove them from the search list

> Keychains can be deleted after being creating with `create_keychain`

delete_keychain | 
-----|----
Supported platforms | ios, android, mac
Author | @gin0606



<details>
<summary>1 Example</summary>

```ruby
delete_keychain(name: "KeychainName")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `name` | Keychain name

</details>





### copy_artifacts

Small action to save your build artifacts. Useful when you use reset_git_repo

> This action copies artifacs to a target directory. It's useful if you have a CI that will pick up these artifacts and attach them to the build. Useful e.g. for storing your `.ipa`s, `.dSYM.zip`s, `.mobileprovision`s, `.cert`s
Make sure your target_path is gitignored, and if you use `reset_git_repo`, make sure the artifacts are added to the exclude list

copy_artifacts | 
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic



<details>
<summary>1 Example</summary>

```ruby
copy_artifacts(
  target_path: "artifacts",
  artifacts: ["*.cer", "*.mobileprovision", "*.ipa", "*.dSYM.zip"]
)

# Reset the git repo to a clean state, but leave our artifacts in place
reset_git_repo(
  exclude: "artifacts"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `keep_original` | Set this to true if you want copy, rather than move, semantics
  `target_path` | The directory in which you want your artifacts placed
  `artifacts` | An array of file patterns of the files/folders you want to preserve
  `fail_on_missing` | Fail when a source file isn't found

</details>





### upload_symbols_to_crashlytics

Upload dSYM symbolication files to Crashlytics

> This action allows you to upload symbolication files to Crashlytics. It's extra useful if you use it to download the latest dSYM files from Apple when you use Bitcode. This action will not fail the build if one of the uploads failed. The reason for that is that sometimes some of dSYM files are invalid, and we don't want them to fail the complete build.

upload_symbols_to_crashlytics | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
upload_symbols_to_crashlytics(dsym_path: "./App.dSYM.zip")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `dsym_path` | Path to the DSYM file or zip to upload
  `api_token` | Crashlytics Beta API Token
  `binary_path` | The path to the upload-symbols file of the Fabric app
  `platform` | The platform of the app (ios, tvos, mac)

</details>





### backup_xcarchive

Save your [zipped] xcarchive elsewhere from default path



backup_xcarchive | 
-----|----
Supported platforms | ios, mac
Author | @dral3x



<details>
<summary>1 Example</summary>

```ruby
backup_xcarchive(
  xcarchive: "/path/to/file.xcarchive", # Optional if you use the `xcodebuild` action
  destination: "/somewhere/else/file.xcarchive", # Where the backup should be created
  zip: false, # Enable compression of the archive. Defaults to `true`.
  versioned: true # Create a versioned (date and app version) subfolder where to put the archive. Default value `true`
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `xcarchive` | Path to your xcarchive file. Optional if you use the `xcodebuild` action
  `destination` | Where your archive will be placed
  `zip` | Enable compression of the archive. Default value `true`
  `versioned` | Create a versioned (date and app version) subfolder where to put the archive. Default value `true`

</details>





### team_id

Specify the Team ID you want to use for the Apple Developer Portal



team_id | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
team_id "Q2CBPK58CA"
```


</details>






### backup_file

This action backs up your file to "[path].back"



backup_file | 
-----|----
Supported platforms | ios, android, mac
Author | @gin0606



<details>
<summary>1 Example</summary>

```ruby
backup_file(path: "/path/to/file")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `path` | Path to the file you want to backup

</details>





### team_name

Set a team to use by its name



team_name | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
team_name "Felix Krause"
```


</details>






### dsym_zip

Creates a zipped dSYM in the project root from the .xcarchive

> You can manually specify the path to the xcarchive (not needed if you use `xcodebuild`/`xcarchive` to build your archive)

dsym_zip | 
-----|----
Supported platforms | ios, mac
Author | @lmirosevic



<details>
<summary>2 Examples</summary>

```ruby
dsym_zip
```

```ruby
dsym_zip(
  archive_path: "MyApp.xcarchive"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `archive_path` | Path to your xcarchive file. Optional if you use the `xcodebuild` action
  `dsym_path` | Path for generated dsym. Optional, default is your apps root directory
  `all` | Whether or not all dSYM files are to be included. Optional, default is false in which only your app dSYM is included

</details>





### debug

Print out an overview of the lane context values



debug | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
debug
```


</details>






### ensure_no_debug_code

Ensures the given text is nowhere in the code base

> You don't want any debug code to slip into production. This can be used
to check if there is any debug code still in your code base or if you have
things like // TO DO or similar

ensure_no_debug_code | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>5 Examples</summary>

```ruby
ensure_no_debug_code(text: "// TODO")
```

```ruby
ensure_no_debug_code(text: "Log.v",
      extension: "java")
```

```ruby
ensure_no_debug_code(text: "NSLog",
 path: "./lib",
      extension: "m")
```

```ruby
ensure_no_debug_code(text: "(^#define DEBUG|NSLog)",
 path: "./lib",
      extension: "m")
```

```ruby
ensure_no_debug_code(text: "<<<<<<",
     extensions: ["m", "swift", "java"])
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `text` | The text that must not be in the code base
  `path` | The directory containing all the source files
  `extension` | The extension that should be searched for
  `extensions` | An array of file extensions that should be searched for

</details>





### set_github_release

This will create a new release on GitHub and upload assets for it

> Creates a new release on GitHub. You must provide your GitHub Personal token
        (get one from https://github.com/settings/tokens/new), the repository name
        and tag name. By default that's 'master'. If the tag doesn't exist, one will be created on the commit or branch passed-in as
        commitish. Out parameters provide the release's id, which can be used for later editing and the
        release html link to GitHub. You can also specify a list of assets to be uploaded to the release with the upload_assets parameter.

set_github_release | 
-----|----
Supported platforms | ios, android, mac
Author | @czechboy0
Returns | A hash containing all relevant information of this release
Access things like 'html_url', 'tag_name', 'name', 'body'



<details>
<summary>1 Example</summary>

```ruby
github_release = set_github_release(
  repository_name: "fastlane/fastlane",
  api_token: ENV["GITHUB_TOKEN"],
  name: "Super New actions",
  tag_name: "v1.22.0",
  description: File.read("changelog"),
  commitish: "master",
  upload_assets: ["example_integration.ipa", "./pkg/built.gem"]
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `repository_name` | The path to your repo, e.g. 'fastlane/fastlane'
  `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com')
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens
  `tag_name` | Pass in the tag name
  `name` | Name of this release
  `commitish` | Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually master)
  `description` | Description of this release
  `is_draft` | Whether the release should be marked as draft
  `is_prerelease` | Whether the release should be marked as prerelease
  `upload_assets` | Path to assets to be uploaded with the release

</details>





### version_bump_podspec

Increment or set the version in a podspec file

> You can use this action to manipulate any 'version' variable contained in a ruby file.
For example, you can use it to bump the version of a cocoapods' podspec file.

version_bump_podspec | 
-----|----
Supported platforms | ios, mac
Author | @Liquidsoul, @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
version = version_bump_podspec(path: "TSMessages.podspec", bump_type: "patch")
```

```ruby
version = version_bump_podspec(path: "TSMessages.podspec", version_number: "1.4")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `path` | You must specify the path to the podspec file to update
  `bump_type` | The type of this version bump. Available: patch, minor, major
  `version_number` | Change to a specific version. This will replace the bump type value

</details>





### danger

Runs `danger` for the project

> Formalize your Pull Request etiquette.
More information: https://github.com/danger/danger

danger | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
danger(github_api_token: GITHUB_API_TOKEN)
```

```ruby
danger(
  danger_id: "unit-tests",
  dangerfile: "tests/MyOtherDangerFile",
  github_api_token: GITHUB_API_TOKEN,
  verbose: true
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented
  `verbose` | Show more debugging information
  `danger_id` | The identifier of this Danger instance
  `dangerfile` | The location of your Dangerfile
  `github_api_token` | GitHub API token for danger

</details>





### zip

Compress a file or folder to a zip



zip | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx
Returns | The path to the output zip file



<details>
<summary>2 Examples</summary>

```ruby
zip
```

```ruby
zip(
  path: "MyApp.app",
  output_path: "Latest.app.zip"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `path` | Path to the directory or file to be zipped
  `output_path` | The name of the resulting zip file

</details>





### verify_build

Able to verify various settings in ipa file

> Verifies that the built app was built using the expected build resources. This is relevant for people who build on machines that are used to build apps with different profiles, certificates and/or bundle identifiers to guard against configuration mistakes.

verify_build | 
-----|----
Supported platforms | ios
Author | @CodeReaper



<details>
<summary>1 Example</summary>

```ruby
verify_build(
  provisioning_type: "distribution",
  bundle_identifier: "com.example.myapp"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `provisioning_type` | Required type of provisioning
  `provisioning_uuid` | Required UUID of provisioning profile
  `team_identifier` | Required team identifier
  `team_name` | Required team name
  `app_name` | Required app name
  `bundle_identifier` | Required bundle identifier
  `ipa_path` | Explicitly set the ipa path

</details>





### scp

Transfer files via SCP



scp | 
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



<details>
<summary>2 Examples</summary>

```ruby
scp(
  host: "dev.januschka.com",
  username: "root",
  upload: {
    src: "/root/dir1",
    dst: "/tmp/new_dir"
  }
)
```

```ruby
scp(
  host: "dev.januschka.com",
  username: "root",
  download: {
    src: "/root/dir1",
    dst: "/tmp/new_dir"
  }
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `username` | Username
  `password` | Password
  `host` | Hostname
  `port` | Port
  `upload` | Upload
  `download` | Download

</details>





### rocket

Outputs ascii-art for a rocket 🚀

> Print an ascii Rocket :rocket:. Useful after using `crashlytics` or `pilot` to indicate that your new build has been shipped to outer-space.

rocket | 
-----|----
Supported platforms | ios, android, mac
Author | @JaviSoto, @radex



<details>
<summary>1 Example</summary>

```ruby
rocket
```


</details>






### cloc

Generates a Code Count that can be read by Jenkins (xml format)

> This action will run cloc to generate a SLOC report that the Jenkins SLOCCount plugin can read.
See https://wiki.jenkins-ci.org/display/JENKINS/SLOCCount+Plugin and https://github.com/AlDanial/cloc for more information.

cloc | 
-----|----
Supported platforms | ios, mac
Author | @intere



<details>
<summary>1 Example</summary>

```ruby
cloc(
   exclude_dir: "ThirdParty,Resources",
   output_directory: "reports",
   source_directory: "MyCoolApp"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `binary_path` | Where the cloc binary lives on your system (full path including 'cloc')
  `exclude_dir` | Comma separated list of directories to exclude
  `output_directory` | Where to put the generated report file
  `source_directory` | Where to look for the source code (relative to the project root folder)
  `xml` | Should we generate an XML File (if false, it will generate a plain text file)?

</details>





### download_dsyms

Download dSYM files from Apple iTunes Connect for Bitcode apps

> This action downloads dSYM files from Apple iTunes Connect after
the ipa got re-compiled by Apple. Useful if you have Bitcode enabled
```ruby
lane :refresh_dsyms do
  download_dsyms                  # Download dSYM files from iTC
  upload_symbols_to_crashlytics   # Upload them to Crashlytics
  clean_build_artifacts           # Delete the local dSYM files
end
```

download_dsyms | 
-----|----
Supported platforms | ios
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
download_dsym
```

```ruby
download_dsym(version: "1.0.0", build_number: "345")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `username` | Your Apple ID Username for iTunes Connect
  `app_identifier` | The bundle identifier of your app
  `team_id` | The ID of your team if you're in multiple teams
  `team_name` | The name of your team if you're in multiple teams
  `platform` | The app platform for dSYMs you wish to download
  `version` | The app version for dSYMs you wish to download
  `build_number` | The app build_number for dSYMs you wish to download

</details>





### version_get_podspec

Receive the version number from a podspec file



version_get_podspec | 
-----|----
Supported platforms | ios, mac
Author | @Liquidsoul, @KrauseFx



<details>
<summary>1 Example</summary>

```ruby
version = version_get_podspec(path: "TSMessages.podspec")
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `path` | You must specify the path to the podspec file

</details>





### erb

Allows to Generate output files based on ERB templates

> Renders an ERB template with `placeholders` given as a hash via parameter,
if no :destination is set, returns rendered template as string

erb | 
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



<details>
<summary>1 Example</summary>

```ruby
# Example `erb` template:

# Variable1 <%= var1 %>
# Variable2 <%= var2 %>
# <% for item in var3 %>
#        <%= item %>
# <% end %>

erb(
  template: "1.erb",
  destination: "/tmp/rendered.out",
  placeholders: {
    :var1 => 123,
    :var2 => "string",
    :var3 => ["element1", "element2"]
  }
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `template` | ERB Template File
  `destination` | Destination file
  `placeholders` | Placeholders given as a hash

</details>





### build_and_upload_to_appetize

Generate and upload an ipa file to appetize.io

> This should be called from danger
More information in the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md)

build_and_upload_to_appetize | 
-----|----
Supported platforms | ios
Author | @KrauseFx


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `xcodebuild` | Parameters that are passed to the xcodebuild action
  `scheme` | The scheme to build. Can also be passed using the `xcodebuild` parameter
  `api_token` | Appetize.io API Token

</details>





### adb_devices

Get an Array of Connected android device serials

> Fetches device list via adb, e.g. run an adb command on all connected devices.

adb_devices | 
-----|----
Supported platforms | android
Author | @hjanuschka
Returns | Returns an array of all currently connected android devices



<details>
<summary>1 Example</summary>

```ruby
adb_devices.each  do |device|
  model = adb(command: "shell getprop ro.product.model",
    serial: device.serial
   ).strip

  puts "Model #{model} is connected"
end
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `adb_path` | The path to your `adb` binary

</details>





### clipboard

Copies a given string into the clipboard. Works only on macOS



clipboard | 
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



<details>
<summary>2 Examples</summary>

```ruby
clipboard(value: "https://github.com/fastlane/fastlane/tree/master/fastlane")
```

```ruby
clipboard(value: lane_context[SharedValues::HOCKEY_DOWNLOAD_LINK])
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `value` | The string that should be copied into the clipboard

</details>





### appetize_viewing_url_generator

Generate an URL for appetize simulator

> Check out the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md) for more information

appetize_viewing_url_generator | 
-----|----
Supported platforms | ios
Author | @KrauseFx
Returns | The URL to preview the iPhone app


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `public_key` | Public key of the app you wish to update
  `device` | Device type: iphone4s, iphone5s, iphone6, iphone6plus, ipadair, iphone6s, iphone6splus, ipadair2, nexus5, nexus7 or nexus9
  `scale` | Scale of the simulator
  `orientation` | Device orientation
  `language` | Device language in ISO 639-1 language code, e.g. 'de'
  `color` | Color of the device
  `launch_url` | Specify a deep link to open when your app is launched

</details>





### artifactory

This action uploads an artifact to artifactory



artifactory | 
-----|----
Supported platforms | ios, android, mac
Author | @koglinjg



<details>
<summary>1 Example</summary>

```ruby
artifactory(
  username: "username",
  password: "password",
  endpoint: "https://artifactory.example.com/artifactory/",
  file: "example.ipa",  # File to upload
  repo: "mobile_artifacts",       # Artifactory repo
  repo_path: "/ios/appname/example-major.minor.ipa"   # Path to place the artifact including its filename
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `file` | File to be uploaded to artifactory
  `repo` | Artifactory repo to put the file in
  `repo_path` | Path to deploy within the repo, including filename
  `endpoint` | Artifactory endpoint
  `username` | Artifactory username
  `password` | Artifactory password
  `properties` | Artifact properties hash
  `ssl_pem_file` | Location of pem file to use for ssl verification
  `ssl_verify` | Verify SSL
  `proxy_username` | Proxy username
  `proxy_password` | Proxy password
  `proxy_address` | Proxy address
  `proxy_port` | Proxy port

</details>





### ssh

Allows remote command execution using ssh

> Lets you execute remote commands via ssh using username/password or ssh-agent. If one of the commands in command-array returns non 0 - it fails.

ssh | 
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



<details>
<summary>1 Example</summary>

```ruby
ssh(
  host: "dev.januschka.com",
  username: "root",
  commands: [
    "date",
    "echo 1 > /tmp/file1"
  ]
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `username` | Username
  `password` | Password
  `host` | Hostname
  `port` | Port
  `commands` | Commands
  `log` | Log commands and output

</details>





### update_urban_airship_configuration

Set the Urban Airship plist configuration values

> This action updates the AirshipConfig.plist need to configure the Urban Airship SDK at runtime, allowing keys and secrets to easily be set for Enterprise and Production versions of the application.

update_urban_airship_configuration | 
-----|----
Supported platforms | ios
Author | @kcharwood



<details>
<summary>1 Example</summary>

```ruby
update_urban_airship_configuration(
  plist_path: "AirshipConfig.plist",
  production_app_key: "PRODKEY",
  production_app_secret: "PRODSECRET"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `plist_path` | Path to Urban Airship configuration Plist
  `development_app_key` | The development app key
  `development_app_secret` | The development app secret
  `production_app_key` | The production app key
  `production_app_secret` | The production app secret
  `detect_provisioning_mode` | Automatically detect provisioning mode

</details>





### update_icloud_container_identifiers

This action changes the iCloud container identifiers in the entitlements file

> Updates the iCloud Container Identifiers in the given Entitlements file, so you can use different iCloud containers for different builds like Adhoc, App Store, etc.

update_icloud_container_identifiers | 
-----|----
Supported platforms | ios
Author | @JamesKuang



<details>
<summary>1 Example</summary>

```ruby
update_icloud_container_identifiers(
  entitlements_file: "/path/to/entitlements_file.entitlements",
  icloud_container_identifiers: ["iCloud.com.companyname.appname"]
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `entitlements_file` | The path to the entitlement file which contains the iCloud container identifiers
  `icloud_container_identifiers` | An Array of unique identifiers for the iCloud containers. Eg. ['iCloud.com.test.testapp']

</details>





### rsync

Rsync files from :source to :destination

> A wrapper around rsync, rsync is a tool that lets you synchronize files, including permissions and so on for a more detailed information about rsync please see rsync(1) manpage.

rsync | 
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



<details>
<summary>1 Example</summary>

```ruby
rsync(
  source: "root@host:/tmp/1.txt",
  destination: "/tmp/local_file.txt"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `extra` | Port
  `source` | source file/folder
  `destination` | destination file/folder

</details>





### upload_symbols_to_sentry

Upload dSYM symbolication files to Sentry

> This action allows you to upload symbolication files to Sentry. It's extra useful if you use it to download the latest dSYM files from Apple when you use Bitcode

upload_symbols_to_sentry | 
-----|----
Supported platforms | ios
Author | @joshdholtz
Returns | The uploaded dSYM path(s)



<details>
<summary>1 Example</summary>

```ruby
upload_symbols_to_sentry(
  auth_token: "...",
  org_slug: "...",
  project_slug: "...",
  dsym_path: "./App.dSYM.zip"
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `api_host` | API host url for Sentry
  `api_key` | API key for Sentry
  `auth_token` | Authentication token for Sentry
  `org_slug` | Organization slug for Sentry project
  `project_slug` | Prgoject slug for Sentry
  `dsym_path` | Path to your symbols file. For iOS and Mac provide path to app.dSYM.zip
  `dsym_paths` | Path to an array of your symbols file. For iOS and Mac provide path to app.dSYM.zip

</details>





### tryouts

Upload a new build to Tryouts

> More information http://tryouts.readthedocs.org/en/latest/releases.html#create-release

tryouts | 
-----|----
Supported platforms | ios, android
Author | @alicertel



<details>
<summary>1 Example</summary>

```ruby
tryouts(
  api_token: "...",
  app_id: "application-id",
  build_file: "test.ipa",
)
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `app_id` | Tryouts application hash
  `api_token` | API Token for Tryouts Access
  `build_file` | Path to your IPA or APK file. Optional if you use the `gym` or `xcodebuild` action
  `notes` | Release notes
  `notes_path` | Release notes text file path. Overrides the :notes paramether
  `notify` | Notify testers? 0 for no
  `status` | 2 to make your release public. Release will be distributed to available testers. 1 to make your release private. Release won't be distributed to testers. This also prevents release from showing up for SDK update

</details>





### dotgpg_environment

Reads in production secrets set in a dotgpg file and puts them in ENV

> More information about dotgpg can be found at https://github.com/ConradIrwin/dotgpg

dotgpg_environment | 
-----|----
Supported platforms | ios, android, mac
Author | @simonlevy5



<details>
<summary>1 Example</summary>

```ruby
dotgpg_environment(dotgpg_file: './path/to/gpgfile')
```


</details>


<details>
<summary>Parameters</summary>

Key | Description
----|------------
  `dotgpg_file` | Path to your gpg file

</details>







# Plugins
| Action | Plugin | Description | Usage Number
---------|--------|-------------|--------------
synx | [synx](https://github.com/afonsograca/fastlane-plugin-synx) | Organise your Xcode project folder to match your Xcode groups. | 5741
ascii_art | [ascii_art](https://github.com/neonichu/fastlane-ascii-art) | Add some fun to your fastlane output. | 3799
get_info_plist_path | [versioning](https://github.com/SiarheiFedartsou/fastlane-plugin-versioning) | Allows to work set/get app version directly to/from Info.plist | 1666
trainer | [trainer](https://github.com/KrauseFx/trainer) | Convert xcodebuild plist files to JUnit reports | 1565
pixie | `pixie` | Show your build status on PIXIE! | 1130
xamarin_build | [xamarin_build](https://github.com/punksta/fastlane-plugin-xamarin_build) | Build xamarin android\ios projects | 989
extract_app_icon | `polidea` | Polidea's fastlane action | 743
read_changelog | [changelog](https://github.com/pajapro/fastlane-plugin-changelog) | Automate changes to your project CHANGELOG.md | 730
get_binary_size | `polidea` | Polidea's fastlane action | 691
ftp | [ftp](https://github.com/PoissonBallon/fastlane-ftp-plugin) | Simple ftp upload and download for Fastlane | 691
get_version_number_from_plist | [versioning](https://github.com/SiarheiFedartsou/fastlane-plugin-versioning) | Allows to work set/get app version directly to/from Info.plist | 648
extract_app_name | `polidea` | Polidea's fastlane action | 627
appicon | [appicon](https://github.com/neonichu/fastlane-plugin-appicon) | Generate required icon sizes and iconset from a master application icon. | 617
extract_version | `polidea` | Polidea's fastlane action | 615
polidea_store | `polidea` | Polidea's fastlane action | 583
increment_build_number_in_plist | [versioning](https://github.com/SiarheiFedartsou/fastlane-plugin-versioning) | Allows to work set/get app version directly to/from Info.plist | 572
extract_certificate | [xamarin_build](https://github.com/punksta/fastlane-plugin-xamarin_build) | Build xamarin android\ios projects | 548
increment_version_code | [increment_version_code](https://github.com/Jems22/fastlane-plugin-increment_version_code) | Increment the version code of your android project. | 546
carthage_cache_exist | [carthage_cache](https://github.com/thii/fastlane-plugin-carthage_cache) | A Fastlane plugin that allows to cache Carthage/Build folder in Amazon S3. | 539
get_version_name | [get_version_name](https://github.com/Jems22/fastlane-plugin-get-version-name) | Get the version name of an Android project. | 534
xamarin_update_configuration | [xamarin_build](https://github.com/punksta/fastlane-plugin-xamarin_build) | Build xamarin android\ios projects | 511
carthage_cache_install | [carthage_cache](https://github.com/thii/fastlane-plugin-carthage_cache) | A Fastlane plugin that allows to cache Carthage/Build folder in Amazon S3. | 474
upload_to_onesky | [upload_to_onesky](https://github.com/joshrlesch/fastlane-plugin-upload_to_onesky) | Upload a strings file to OneSky | 458
poeditor_export | [poeditor_export](https://github.com/Supmenow/fastlane-plugin-poeditor_export) | Exports translations from POEditor.com | 433
add_prefix_schema | `polidea` | Polidea's fastlane action | 411
branding | [branding](https://github.com/snatchev/fastlane-branding-plugin) | Add some branding to your fastlane output | 397
automated_test_emulator_run | [automated_test_emulator_run](https://github.com/AzimoLabs/fastlane-plugin-automated-test-emulator-run) | Allows to wrap gradle task or shell command that runs integrated tests that prepare and starts single AVD before test run. After tests are finished, emulator is killed and deleted. | 380
xcake | [xcake](https://github.com/jcampbell05/xcake/) | Create your Xcode projects automatically using a stupid simple DSL. | 376
release_notes | `polidea` | Polidea's fastlane action | 350
deploy_file_provider | `deploy_file_provider` | Prepares metadata files with structure ready for AppStore, PlayStore deploy | 330
instrumented_tests | [instrumented_tests](https://github.com/joshrlesch/fastlane-plugin-instrumented_tests) | New action to run instrumented tests for android. This basically creates and boots an emulator before running an gradle commands so that you can run instrumented tests against that emulator. After the gradle command is executed, the avd gets shut down and deleted. This is really helpful on CI services, keeping them clean and always having a fresh avd for testing. | 325
increment_version_number_in_plist | [versioning](https://github.com/SiarheiFedartsou/fastlane-plugin-versioning) | Allows to work set/get app version directly to/from Info.plist | 307
get_version_code | [get_version_code](https://github.com/Jems22/fastlane-plugin-get_version_code) | Get the version code of anAndroid project. This action will return the version code of your project according to the one set in your build.gradle file | 302
stamp_changelog | [changelog](https://github.com/pajapro/fastlane-plugin-changelog) | Automate changes to your project CHANGELOG.md | 287
remove_provisioning_profile | [remove_provisioning_profile](https://github.com/Antondomashnev/fastlane-plugin-remove-provisioning-profile) | Remove provision profile from your local machine | 281
applivery | [applivery](https://github.com/applivery/fastlane-applivery-plugin) | Upload new build to Applivery | 266
act | [act](https://github.com/richardszalay/fastlane-plugin-act) | Applies changes to plists and app icons inside a compiled IPA | 253
goodify_info_plist | [goodify_info_plist](https://github.com/lyndsey-ferguson/fastlane_plugins) | This plugin will update the plist so that the built application can be deployed and managed within BlackBerry's Good Dynamics Control Center for Enterprise Mobility Management. | 245
tunes | [tunes](https://github.com/neonichu/fastlane-tunes) | Play music using fastlane, because you can. | 214
giffy_random_gif_url | [giffy](https://github.com/SiarheiFedartsou/fastlane-plugin-giffy) | Fastlane plugin for Giffy.com API | 200
jira_transition | [jira_transition](https://github.com/valeriomazzeo/fastlane-plugin-jira_transition) | Apply a JIRA transition to issues mentioned in the changelog | 180
commit_android_version_bump | [commit_android_version_bump](https://github.com/Jems22/fastlane-plugin-commit_android_version_bump) | This Android plugins allow you to commit every modification done in your build.gradle file during the execution of a lane. In fast, it do the same as the commit_version_bump action, but for Android | 163
unzip | [unzip](https://github.com/maxoly/fastlane-plugin-unzip) | Extract compressed files in a ZIP | 147
sentry_upload_dsym | [sentry](https://github.com/getsentry/sentry-fastlane) | Upload symbols to Sentry | 145
droidicon | [droidicon](https://github.com/chrhsmt/fastlane-plugin-droidicon) | Generate required icon sizes and iconset from a master application icon | 135
version_from_last_tag | `version_from_last_tag` | Perform a regex on last (latest) git tag and perform a regex to extract a version number such as Release 1.2.3 | 113
get_app_store_version_number | [versioning](https://github.com/SiarheiFedartsou/fastlane-plugin-versioning) | Allows to work set/get app version directly to/from Info.plist | 105
download_file | [download_file](https://github.com/maxoly/fastlane-plugin-download_file) | This action downloads a file from an HTTP/HTTPS url (e.g. ZIP file) and puts it in a destination path | 102
update_changelog | [changelog](https://github.com/pajapro/fastlane-plugin-changelog) | Automate changes to your project CHANGELOG.md | 100
facelift | [facelift](https://github.com/richardszalay/fastlane-plugin-facelift) | Deprecated in favor of 'fastlane-plugin-act' | 96
sharethemeal | `sharethemeal` | ShareTheMeal | 92
coreos_deploy | [coreos](https://github.com/icuisine-pos/fastlane-plugin-coreos) | Deploy docker services to CoreOS hosts | 87
export_localizations | [localization](https://github.com/vmalyi/fastlane-plugin-localization) | Export/import app localizations with help of xcodebuild -exportLocalizations/-importLocalizations tool | 61
update_provisioning_profile_specifier | [update_provisioning_profile_specifier](https://github.com/faithfracture/update_provisioning_profile_specifier) | Update the provisioning profile in the Xcode Project file for a specified target | 60
carthage_cache_publish | [carthage_cache](https://github.com/thii/fastlane-plugin-carthage_cache) | A Fastlane plugin that allows to cache Carthage/Build folder in Amazon S3. | 58
import_localizations | [localization](https://github.com/vmalyi/fastlane-plugin-localization) | Export/import app localizations with help of xcodebuild -exportLocalizations/-importLocalizations tool | 51
upload_folder_to_s3 | [upload_folder_to_s3](https://github.com/teriiehina/fastlane-plugin-upload_folder_to_s3) | Upload a folder to S3 | 51
instabug | [instabug](https://github.com/SiarheiFedartsou/fastlane-plugin-instabug) | Uploads dSYM to Instabug | 49
upload_symbols_to_hockey | [upload_symbols_to_hockey](https://github.com/justin/fastlane-plugin-upload_symbols_to_hockey) | Upload dSYM symbolication files to Hockey | 46
framer | [framer](https://github.com/spreaker/fastlane-framer-plugin) | Create images combining app screenshots with templates to make nice pictures for the App Store | 44
tpa | [tpa](https://github.com/mbogh/fastlane-plugin-tpa) | TPA gives you advanced user behaviour analytics, app distribution, crash analytics and more | 39
create_jira_version | [jira_versions](https://github.com/SandyChapman/fastlane-plugin-jira_versions) | Manage your JIRA project's releases/versions with this plugin. | 32
ensure_xcode_build_version | [ensure_xcode_build_version](https://github.com/nafu/fastlane-plugin-ensure_xcode_build_version) | Ensure Xcode Build Version for working with Beta, GM and Release | 31
github_status | [github_status](https://github.com/mfurtak/fastlane-plugin-github_status) | Provides the ability to display and act upon GitHub server status as part of your build | 31
clang_analyzer | [clang_analyzer](https://github.com/SiarheiFedartsou/fastlane-plugin-clang_analyzer) | Runs Clang Static Analyzer(http://clang-analyzer.llvm.org/) and generates report | 28
coreos | [coreos](https://github.com/icuisine-pos/fastlane-plugin-coreos) | Deploy docker services to CoreOS hosts | 27
latest_hockeyapp_version_number | [latest_hockeyapp_version_number](https://github.com/tpalmer/fastlane-plugin-latest_hockeyapp_version_number) | Easily fetch the most recent HockeyApp version number for your app | 20
check_good_version | [check_good_version](https://github.com/lyndsey-ferguson/fastlane_plugins) | Checks the version of the installed Good framework | 19
rubocop | [ruby](https://github.com/KrauseFx/fastlane-plugin-ruby) | Useful fastlane actions for Ruby projects | 16
get_build_number_from_plist | [versioning](https://github.com/SiarheiFedartsou/fastlane-plugin-versioning) | Allows to work set/get app version directly to/from Info.plist | 15
wait_xcrun | [wait_xcrun](https://github.com/mgrebenets/fastlane-plugin-wait_xcrun) | Wait for Xcode toolchain to come back online after switching Xcode versions. | 14
release_jira_version | [jira_versions](https://github.com/SandyChapman/fastlane-plugin-jira_versions) | Manage your JIRA project's releases/versions with this plugin. | 14
update_xcodeproj | [update_xcodeproj](https://github.com/nafu/fastlane-plugin-update_xcodeproj) | Update Xcode projects | 13
giffy_random_sticker_url | [giffy](https://github.com/SiarheiFedartsou/fastlane-plugin-giffy) | Fastlane plugin for Giffy.com API | 11
ya_tu_sabes | [ya_tu_sabes](https://github.com/neonichu/fastlane-plugin-ya_tu_sabes) | Ya tu sabes. | 10
get_unprovisioned_devices_from_hockey | [get_unprovisioned_devices_from_hockey](https://github.com/leandog/fastlane-plugin-get_unprovisioned_devices_from_hockey) | Retrieves a list of unprovisioned devices from Hockey which can be passed directly into register_devices. | 9
certificate_expirydate | [certificate_expirydate](https://github.com/lyndsey-ferguson/fastlane_plugins/fastlane-plugin-certificate_expirydate) | Retrieves the expiry date of the given p12 certificate file | 9
app_icon | `polidea` | Polidea's fastlane action | 6
rspec | [ruby](https://github.com/KrauseFx/fastlane-plugin-ruby) | Useful fastlane actions for Ruby projects | 6
figlet | `figlet` | Wrapper around figlet which makes large ascii text words | 5
clubmate | [clubmate](https://github.com/KrauseFx/fastlane-plugin-clubmate) | Print the Club Mate logo in your build output | 3
no_u | [no_u](https://github.com/neonichu/fastlane-plugin-no_u) | no u | 3
get_version_number_from_git_branch | [versioning](https://github.com/SiarheiFedartsou/fastlane-plugin-versioning) | Allows to work set/get app version directly to/from Info.plist | 3
pretty_junit | [pretty_junit](https://github.com/leandog/fastlane-plugin-pretty_junit) | Pretty JUnit test results for your Android projects. | 2
import_provisioning | `polidea` | Polidea's fastlane action | 2
messagesicon | [appicon](https://github.com/neonichu/fastlane-plugin-appicon) | Generate required icon sizes and iconset from a master application icon. | 2
delete_files | [delete_files](https://github.com/leandog/fastlane-plugin-delete_files) | Deletes a file, folder or multiple files using shell glob pattern. | 1
