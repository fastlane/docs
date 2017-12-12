# Getting Started with Fastlane.swift (beta)

Welcome to Fastlane.swift. Fastlane.swift allows you to write your _fastlane_ configuration using Xcode, in Swift - the language you have come to know and love from the world of iOS development.

Fastlane.swift is currently in beta. Please provide feedback by opening an issue in the [_fastlane_ repo](https://github.com/fastlane/fastlane).

## Currently Supported:

Fastlane.swift currently supports all actions in the main, [_fastlane_](https://github.com/fastlane/fastlane) repository.

## Get Started:

### Step 1:

Run the following command in your terminal:

``` no-highlight
fastlane init swift
```

### Step 2:

Open the file located at `[project]/fastlane/swift/FastlaneRunner/FastlaneRunner.xcodeproj` to configure your lanes in `Fastfile.swift`.

```swift
func betaLane() {
    desc("Submit a new Beta Build to Apple TestFlight. This will also make sure the profile is up to date")

    match(gitUrl: "URL/for/your/git/repo", appIdentifier: [appIdentifier], username: appleID)
    // Build your app - more options available
    gym(scheme: "SchemeName")
    pilot(username: appleID)
    // You can also use other beta testing services here (run `fastlane actions`)
}
```

### Step 3:

Run `fastlane <laneName>` in your terminal to execute _fastlane_.

### Step 4:

🎉



## Known Limitations:

Currently, Fastlane.swift does not have support for plugins. This is a work in progress and we will continue to update this doc with the current working condition of each feature as we move from beta to general availability.

## We Would Love Your Feedback

Please feel free to [open an issue on GitHub]((https://github.com/fastlane/fastlane) to report any problems you are having with Fastlane.swift and we will respond as quickly as possible.