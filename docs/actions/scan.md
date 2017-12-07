<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# scan


Alias for the `run_tests` action




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

_scan_ uses the latest APIs and tools to make running tests plain simple and offer a great integration into your existing workflow, like [fastlane](https://fastlane.tools) or Jenkins.

|          |  scan Features  |
|----------|-----------------|
🏁 | Beautiful inline build output while running the tests
🚠 | Sensible defaults: Automatically detect the project, schemes and more
📊 | Support for HTML, JSON and JUnit reports
🔎 | Xcode duplicated your simulators again? _scan_ will handle this for you
🔗  | Works perfectly with [fastlane](https://fastlane.tools) and other tools
🚅 | Don't remember any complicated build commands, just _scan_
🔧  | Easy and dynamic configuration using parameters and environment variables
📢 | Beautiful slack notifications of the test results
💾   | Store common build settings in a `Scanfile`
📤 | The raw `xcodebuild` outputs are stored in `~/Library/Logs/scan`
💻 | Supports both iOS and Mac applications
👱      | Automatically switches to the [travis formatter](https://github.com/kattrali/xcpretty-travis-formatter) when running on Travis
📖     | Helps you resolve common test errors like simulator not responding

_scan_ uses a plain `xcodebuild` command, therefore keeping 100% compatible with `xcodebuild`. To generate the nice output, _scan_ uses [xcpretty](https://github.com/supermarin/xcpretty). You can alway access the raw output in `~/Library/Logs/scan`.

![img/actions/scanScreenshot.png](/img/actions/scanScreenshot.png)
![img/actions/slack.png](/img/actions/slack.png)
![img/actions/scanHTML.png](/img/actions/scanHTML.png)
![img/actions/scanHTMLFailing.png](/img/actions/scanHTMLFailing.png)

# Usage

    fastlane scan

That's all you need to run your tests. If you want more control, here are some available parameters:

    fastlane scan --workspace "Example.xcworkspace" --scheme "AppName" --device "iPhone 6" --clean

If you need to use a different xcode install, use `xcode-select` or define `DEVELOPER_DIR`:

    DEVELOPER_DIR="/Applications/Xcode6.2.app" scan

To run _scan_ on multiple devices via [fastlane](https://fastlane.tools), add this to your `Fastfile`:

```ruby
scan(
  workspace: "Example.xcworkspace",
  devices: ["iPhone 6s", "iPad Air"]
)
```

For a list of all available parameters use

    fastlane action scan

To access the raw `xcodebuild` output open `~/Library/Logs/scan`

# Scanfile

Since you might want to manually trigger the tests but don't want to specify all the parameters every time, you can store your defaults in a so called `Scanfile`.

Run `fastlane scan init` to create a new configuration file. Example:

```ruby-skip-tests
scheme "Example"
devices ["iPhone 6s", "iPad Air"]

clean true

output_types "html"
```

# Automating the whole process

_scan_ works great together with [fastlane](https://fastlane.tools), which connects all deployment tools into one streamlined workflow.

Using _fastlane_ you can define a configuration like

```ruby
lane :test do
  scan(scheme: "Example")
end
```

For more information visit the [fastlane GitHub page](https://github.com/fastlane/fastlane/tree/master/fastlane).

<hr />


scan |
-----|----
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

Key | Description
----|------------
  `workspace` | Path to the workspace file
  `project` | Path to the project file
  `device` | The name of the simulator type you want to run tests on (e.g. 'iPhone 6')
  `toolchain` | The toolchain that should be used for building the application (e.g. com.apple.dt.toolchain.Swift_2_3, org.swift.30p620160816a)
  `devices` | Array of devices to run the tests on (e.g. ['iPhone 6', 'iPad Air'])
  `scheme` | The project's scheme. Make sure it's marked as `Shared`
  `clean` | Should the project be cleaned before building it?
  `code_coverage` | Should code coverage be generated? (Xcode 7 and up)
  `address_sanitizer` | Should the address sanitizer be turned on?
  `thread_sanitizer` | Should the thread sanitizer be turned on?
  `skip_build` | Should debug build be skipped before test build?
  `output_directory` | The directory in which all reports will be stored
  `output_style` | Define how the output should look like (standard, basic, rspec or raw)
  `output_types` | Comma separated list of the output types (e.g. html, junit, json-compilation-database)
  `output_files` | Comma separated list of the output files, corresponding to the types provided by :output_types (order should match). If specifying an output type of json-compilation-database with :use_clang_report_name enabled, that option will take precedence
  `buildlog_path` | The directory where to store the raw log
  `include_simulator_logs` | If the logs generated by the app (e.g. using NSLog, perror, etc.) in the Simulator should be written to the output_directory
  `formatter` | A custom xcpretty formatter to use
  `test_without_building` | Test without building, requires a derived data path
  `build_for_testing` | Build for testing only, does not run tests
  `xctestrun` | Run tests using the provided .xctestrun file
  `derived_data_path` | The directory where build products and other derived data will go
  `result_bundle` | Location of the Xcode result bundle
  `sdk` | The SDK that should be used for building the application
  `open_report` | Should the HTML report be opened when tests are completed?
  `configuration` | The configuration to use when building the app. Defaults to 'Release'
  `destination` | Use only if you're a pro, use the other options instead
  `xcargs` | Pass additional arguments to xcodebuild. Be sure to quote the setting names and values e.g. OTHER_LDFLAGS="-ObjC -lstdc++"
  `xcconfig` | Use an extra XCCONFIG file to build your app
  `only_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to run
  `skip_testing` | Array of strings matching Test Bundle/Test Suite/Test Cases to skip
  `slack_url` | Create an Incoming WebHook for your Slack group to post results there
  `slack_channel` | #channel or @username
  `slack_message` | The message included with each message posted to slack
  `skip_slack` | Don't publish to slack, even when an URL is given
  `slack_only_on_failure` | Only post on Slack if the tests fail
  `use_clang_report_name` | Generate the json compilation database with clang naming convention (compile_commands.json)
  `custom_report_file_name` | [DEPRECATED!] Use --output_files - Sets custom full report file name when generating a single report
  `fail_build` | Should this step stop the build if the tests fail? Set this to false if you're using trainer




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action scan
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/scan.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
