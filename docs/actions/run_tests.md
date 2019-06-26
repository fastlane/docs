<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/run_tests.rb
-->

# run_tests


Easily run tests of your iOS app (via _scan_)




<p align="center">
  <img src="/img/actions/scan.png" width="250">
</p>

###### The easiest way to run tests of your iOS and Mac app

_scan_ makes it easy to run tests of your iOS and Mac app on a simulator or connected device.

-------

<p align="center">
    <a href="#whats-scan">Features</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#scanfile">Scanfile</a>
</p>

-------

# What's scan?

![https://pbs.twimg.com/media/CURcEpuWoAArE3d.png:large](https://pbs.twimg.com/media/CURcEpuWoAArE3d.png:large)

### Before _scan_

```no-highlight
xcodebuild \
  -workspace MyApp.xcworkspace \
  -scheme "MyApp" \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' \
  test
```

As the output will look like this

```no-highlight
/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.o Example/main.m normal arm64 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/felixkrause/Developer/fastlane/gym/example/cocoapods
    export LANG=en_US.US-ASCII
    export PATH="/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:/Applications/Xcode-beta.app/Contents/Developer/usr/bin:/Users/felixkrause/.rvm/gems/ruby-2.2.0/bin:/Users/felixkrause/.rvm/gems/ruby-2.2.0@global/bin:/Users/felixkrause/.rvm/rubies/ruby-2.2.0/bin:/Users/felixkrause/.rvm/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch arm64 -fmessage-length=126 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fobjc-arc -fmodules -gmodules -fmodules-cache-path=/Users/felixkrause/Library/Developer/Xcode/DerivedData/ModuleCache -fmodules-prune-interval=86400 -fmodules-prune-after=345600 -fbuild-session-file=/Users/felixkrause/Library/Developer/Xcode/DerivedData/ModuleCache/Session.modulevalidation -fmodules-validate-once-per-build-session -Wnon-modular-include-in-framework-module -Werror=non-modular-include-in-framework-module -Wno-trigraphs -fpascal-strings -Os -fno-common -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wunreachable-code -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-arc-repeated-use-of-weak -Wduplicate-method-match -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wconditional-uninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DCOCOAPODS=1 -DNS_BLOCK_ASSERTIONS=1 -DOBJC_OLD_DISPATCH_PROTOTYPES=0 -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.0.sdk -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -miphoneos-version-min=9.0 -g -fvisibility=hidden -Wno-sign-conversion -fembed-bitcode -iquote /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-generated-files.hmap -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-own-target-headers.hmap -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-all-target-headers.hmap -iquote /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/ExampleProductName-project-headers.hmap -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/BuildProductsPath/Release-iphoneos/include -I/Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public -I/Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public/HexColors -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/DerivedSources/arm64 -I/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/DerivedSources -F/Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/BuildProductsPath/Release-iphoneos -isystem /Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public -isystem /Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Pods/Headers/Public/HexColors -MMD -MT dependencies -MF /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.d --serialize-diagnostics /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.dia -c /Users/felixkrause/Developer/fastlane/gym/example/cocoapods/Example/main.m -o /Users/felixkrause/Library/Developer/Xcode/DerivedData/Example-fhlmxikmujknefgidqwqvtbatohi/Build/Intermediates/ArchiveIntermediates/Example/IntermediateBuildFilesPath/Example.build/Release-iphoneos/Example.build/Objects-normal/arm64/main.o
```
you'll probably want to use something like [xcpretty](https://github.com/supermarin/xcpretty), which will look like this:

```no-highlight
set -o pipefail &&
  xcodebuild \
    -workspace MyApp.xcworkspace \
    -scheme "MyApp" \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1' \
    test \
  | xcpretty \
    -r "html" \
    -o "tests.html"
```

### With _scan_

```no-highlight
fastlane scan
```

### Why _scan_?

_scan_ uses the latest APIs and tools to make running tests plain simple and offer a great integration into your existing workflow, like [_fastlane_](https://fastlane.tools) or Jenkins.

|          |  scan Features  |
|----------|-----------------|
🏁 | Beautiful inline build output while running the tests
🚠 | Sensible defaults: Automatically detect the project, schemes and more
📊 | Support for HTML, JSON and JUnit reports
🔎 | Xcode duplicated your simulators again? _scan_ will handle this for you
🔗 | Works perfectly with [_fastlane_](https://fastlane.tools) and other tools
🚅 | Don't remember any complicated build commands, just _scan_
🔧 | Easy and dynamic configuration using parameters and environment variables
📢 | Beautiful slack notifications of the test results
💾 | Store common build settings in a `Scanfile`
📤 | The raw `xcodebuild` outputs are stored in `~/Library/Logs/scan`
💻 | Supports both iOS and Mac applications
👱 | Automatically switches to the [travis formatter](https://github.com/kattrali/xcpretty-travis-formatter) when running on Travis
📖 | Helps you resolve common test errors like simulator not responding

_scan_ uses a plain `xcodebuild` command, therefore keeping 100% compatible with `xcodebuild`. To generate the nice output, _scan_ uses [xcpretty](https://github.com/supermarin/xcpretty). You can alway access the raw output in `~/Library/Logs/scan`.

![img/actions/scanScreenshot.png](/img/actions/scanScreenshot.png)
![img/actions/slack.png](/img/actions/slack.png)
![img/actions/scanHTML.png](/img/actions/scanHTML.png)
![img/actions/scanHTMLFailing.png](/img/actions/scanHTMLFailing.png)

# Usage

```no-highlight
fastlane scan
```

That's all you need to run your tests. If you want more control, here are some available parameters:

```no-highlight
fastlane scan --workspace "Example.xcworkspace" --scheme "AppName" --device "iPhone 6" --clean
```

If you need to use a different xcode install, use `xcode-select` or define `DEVELOPER_DIR`:

```no-highlight
DEVELOPER_DIR="/Applications/Xcode6.2.app" scan
```

To run _scan_ on multiple devices via [_fastlane_](https://fastlane.tools), add this to your `Fastfile`:

```ruby
scan(
  workspace: "Example.xcworkspace",
  devices: ["iPhone 6s", "iPad Air"]
)
```

For a list of all available parameters use

```no-highlight
fastlane action scan
```

To access the raw `xcodebuild` output open `~/Library/Logs/scan`

# Scanfile

Since you might want to manually trigger the tests but don't want to specify all the parameters every time, you can store your defaults in a so called `Scanfile`.

Run `fastlane scan init` to create a new configuration file. Example:

```ruby-skip-tests
scheme("Example")
devices(["iPhone 6s", "iPad Air"])

clean(true)

output_types("html")
```

# Automating the whole process

_scan_ works great together with [_fastlane_](https://fastlane.tools), which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby
lane :test do
  scan(scheme: "Example")
end
```

<hr />


run_tests ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx



## 6 Examples

```ruby
run_tests
```

```ruby
scan # alias for "run_tests"
```

```ruby
run_tests(
  workspace: "App.xcworkspace",
  scheme: "MyTests",
  clean: false
)
```

```ruby
# Build For Testing
run_tests(
   derived_data_path: "my_folder",
   build_for_testing: true
)
```

```ruby
# run tests using derived data from prev. build
run_tests(
   derived_data_path: "my_folder",
   test_without_building: true
)
```

```ruby
# or run it from an existing xctestrun package
run_tests(
   xctestrun: "/path/to/mytests.xctestrun"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `workspace` | Path to the workspace file | 
  `project` | Path to the project file | 
  `scheme` | The project's scheme. Make sure it's marked as `Shared` | 
  `device` | The name of the simulator type you want to run tests on (e.g. 'iPhone 6') | 
  `devices` | Array of devices to run the tests on (e.g. ['iPhone 6', 'iPad Air']) | 
  `skip_detect_devices` | Should skip auto detecting of devices if none were specified | `false`
  `force_quit_simulator` | Enabling this option will automatically killall Simulator processes before the run | `false`
  `reset_simulator` | Enabling this option will automatically erase the simulator before running the application | `false`
  `prelaunch_simulator` | Enabling this option will launch the first simulator prior to calling any xcodebuild command | 
  `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false`
  `app_identifier` | The bundle identifier of the app to uninstall (only needed when enabling reinstall_app) | [*](#parameters-legend-dynamic)
  `only_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to run | 
  `skip_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to skip | 
  `xctestrun` | Run tests using the provided `.xctestrun` file | 
  `toolchain` | The toolchain that should be used for building the application (e.g. `com.apple.dt.toolchain.Swift_2_3, org.swift.30p620160816a`) | 
  `clean` | Should the project be cleaned before building it? | `false`
  `code_coverage` | Should code coverage be generated? (Xcode 7 and up) | 
  `address_sanitizer` | Should the address sanitizer be turned on? | 
  `thread_sanitizer` | Should the thread sanitizer be turned on? | 
  `open_report` | Should the HTML report be opened when tests are completed? | `false`
  `output_directory` | The directory in which all reports will be stored | [*](#parameters-legend-dynamic)
  `output_style` | Define how the output should look like. Valid values are: standard, basic, rspec, or raw (disables xcpretty) | 
  `output_types` | Comma separated list of the output types (e.g. html, junit, json-compilation-database) | `html,junit`
  `output_files` | Comma separated list of the output files, corresponding to the types provided by :output_types (order should match). If specifying an output type of json-compilation-database with :use_clang_report_name enabled, that option will take precedence | 
  `buildlog_path` | The directory where to store the raw log | [*](#parameters-legend-dynamic)
  `include_simulator_logs` | If the logs generated by the app (e.g. using NSLog, perror, etc.) in the Simulator should be written to the output_directory | `false`
  `suppress_xcode_output` | Suppress the output of xcodebuild to stdout. Output is still saved in buildlog_path | 
  `formatter` | A custom xcpretty formatter to use | 
  `xcpretty_args` | Pass in xcpretty additional command line arguments (e.g. '--test --no-color' or '--tap --no-utf') | 
  `derived_data_path` | The directory where build products and other derived data will go | 
  `should_zip_build_products` | Should zip the derived data build products and place in output path? | `false`
  `result_bundle` | Should an Xcode result bundle be generated in the output directory | `false`
  `use_clang_report_name` | Generate the json compilation database with clang naming convention (compile_commands.json) | `false`
  `max_concurrent_simulators` | Constrain the number of simulator devices on which to test concurrently. Equivalent to -maximum-concurrent-test-simulator-destinations | 
  `disable_concurrent_testing` | Do not run test bundles in parallel on the specified destinations. Testing will occur on each destination serially. Equivalent to -disable-concurrent-testing | `false`
  `skip_build` | Should debug build be skipped before test build? | `false`
  `test_without_building` | Test without building, requires a derived data path | 
  `build_for_testing` | Build for testing only, does not run tests | 
  `sdk` | The SDK that should be used for building the application | 
  `configuration` | The configuration to use when building the app. Defaults to 'Release' | [*](#parameters-legend-dynamic)
  `xcargs` | Pass additional arguments to xcodebuild. Be sure to quote the setting names and values e.g. OTHER_LDFLAGS="-ObjC -lstdc++" | 
  `xcconfig` | Use an extra XCCONFIG file to build your app | 
  `slack_url` | Create an Incoming WebHook for your Slack group to post results there | 
  `slack_channel` | #channel or @username | 
  `slack_message` | The message included with each message posted to slack | 
  `slack_use_webhook_configured_username_and_icon` | Use webhook's default username and icon settings? (true/false) | `false`
  `slack_username` | Overrides the webhook's username property if slack_use_webhook_configured_username_and_icon is false | `fastlane`
  `slack_icon_url` | Overrides the webhook's image property if slack_use_webhook_configured_username_and_icon is false | `https://s3-eu-west-1.amazonaws.com/fastlane.tools/fastlane.png`
  `skip_slack` | Don't publish to slack, even when an URL is given | `false`
  `slack_only_on_failure` | Only post on Slack if the tests fail | `false`
  `destination` | Use only if you're a pro, use the other options instead | 
  `custom_report_file_name` | **DEPRECATED!** Use `--output_files` instead - Sets custom full report file name when generating a single report | 
  `xcodebuild_command` | Allows for override of the default `xcodebuild` command | `env NSUnbufferedIO=YES xcodebuild`
  `fail_build` | Should this step stop the build if the tests fail? Set this to false if you're using trainer | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `run_tests` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::SCAN_DERIVED_DATA_PATH` | The path to the derived data
  `SharedValues::SCAN_GENERATED_PLIST_FILE` | The generated plist file
  `SharedValues::SCAN_GENERATED_PLIST_FILES` | The generated plist files
  `SharedValues::SCAN_ZIP_BUILD_PRODUCTS_PATH` | The path to the zipped build products

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action run_tests
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run run_tests
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run run_tests parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/run_tests.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
