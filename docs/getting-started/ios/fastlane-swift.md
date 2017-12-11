# Getting Started with Fastlane.swift

Welcome to Fastlane.swift. Fastlane.swift allows you to write your _fastlane_ configuration using Xcode, in Swift - the language you have come to know and love from the world of iOS development..

## Currently Supported:

Fastlane.swift currently supports all actions in the main, [_fastlane_](https://github.com/fastlane/fastlane) repository. The API for each action is automatically generated and will accept all options and parameters.

## Get Started:

### Step 1:

Run the following command in your terminal:

``` no-highlight
fastlane init swift
```

### Step 2:

Open the file located at `<path/to/your/project>/fastlane/swift/FastlaneRunner/FastlaneRunner.xcodeproj` to configure `Fastfile.swift` to your liking.

### Step 3:

Run `fastlane <laneName>` in your terminal to execute _fastlane_.

### Step 4:

🎉



## Known Limitations:

Currently, Fastlane.swift does not have support for plugins. This is a work in progress and we will continue to update this doc with the current working condition of each feature as we get closer to a production-ready release.

## We Would Love Your Feedback

Please feel free to open an issue on GitHub to report any issues you are having with Fastlane.swift and we will respond as quickly as possible.