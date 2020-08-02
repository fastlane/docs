# Getting Started with Fastlane.swift (beta)

Welcome to Fastlane.swift. Fastlane.swift allows you to write your _fastlane_ configuration using Xcode, in Swift - the language you have come to know and love from the world of iOS development.

Fastlane.swift is currently in beta. Please provide feedback by opening an issue in the [_fastlane_ repo](https://github.com/fastlane/fastlane).

## Currently Supported

Fastlane.swift currently supports all built-in [fastlane actions](https://docs.fastlane.tools/actions/). Make sure to update to the most recent _fastlane_ release to try this feature.

## Get Started

### Step 1

Run the following command in your terminal:

``` no-highlight
fastlane init swift
```

### Step 2

Open the file located at `[project]/fastlane/swift/FastlaneRunner/FastlaneRunner.xcodeproj` to configure your lanes in `Fastfile.swift`.

```swift
func betaLane() {
    desc("Submit a new Beta Build to Apple TestFlight. This will also make sure the profile is up to date")

    syncCodeSigning(gitUrl: "URL/for/your/git/repo", appIdentifier: [appIdentifier], username: appleID)
    // Build your app - more options available
    buildIosApp(scheme: "SchemeName")
    uploadToTestflight(username: appleID)
    // You can also use other beta testing services here (run `fastlane actions`)
}
```

### Step 3

Run `fastlane <laneName>` in your terminal to execute _fastlane_.

### Step 4

🎉

## Defining Lanes

Lanes are defined with functions that end with `Lane` within the `class Fastfile: LaneFile`.

```swift
class Fastfile: LaneFile {
    func testLane() {
        desc("This is a lane")
    }

    func helper() {
        // This is not a lane but can be called from a lane
    }
}
```

## Passing Parameters

To pass parameters from the command line to your lane, use the following syntax:

```no-highlight
fastlane [lane] key:value key2:value2

fastlane deploy submit:false build_number:24
```

To access those values, change your lane declaration to also include `withOptions options:[String: String]?`

```swift
class Fastfile: LaneFile {
    func deployLane(withOptions options:[String: String]?) {
        // ...
        if let submit = options?["submit"], submit == "true" {
            // Only when submit is true
        }
        // ...
        incrementBuildNumber(buildNumber: options?["build_number"])
        // ...
    }
}
```

## Run Parallel

`Fastlane Swift` uses socket internally. Therefore, for several `Lane`s to run in parallel at the same time, each `Lane` must be specified different `socket port` (lane's default `socket port` is `2000`)

To specify `socket port` from the command line to your lane, use the following syntax:

```no-highlight
fastlane [lane] --swift_server_port [socket port]
```

## Known Limitations

Currently, Fastlane.swift does not have support for plugins. This is a work in progress and we will continue to update this doc with the current working condition of each feature as we move from beta to general availability.

## We Would Love Your Feedback

Please feel free to [open an issue on GitHub](https://github.com/fastlane/fastlane) to report any problems you are having with Fastlane.swift and we will respond as quickly as possible.
