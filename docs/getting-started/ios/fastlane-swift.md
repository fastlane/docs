# Getting Started with Fastlane.swift (beta)

Welcome to Fastlane.swift. Fastlane.swift allows you to write your _fastlane_ configuration using Xcode, in Swift - the language you have come to know and love from the world of iOS development.

Fastlane.swift is currently in beta. Please provide feedback by opening an issue in the [_fastlane_ repo](https://github.com/fastlane/fastlane).

### Currently Supported

Fastlane.swift currently supports all built-in [fastlane actions](https://docs.fastlane.tools/actions/) and 3rd party [plugins](https://docs.fastlane.tools/plugins/available-plugins/). Make sure to update to the most recent _fastlane_ release to try these features.

### Get Started (Xcode)

#### Step 1

Run the following command in your terminal:

``` no-highlight
fastlane init swift
```

#### Step 2

Open the file located at `[project]/fastlane/swift/FastlaneSwiftRunner/FastlaneSwiftRunner.xcodeproj` to configure your lanes in `Fastfile.swift`.

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

#### Step 3

Run `fastlane <laneName>` in your terminal to execute _fastlane_.

#### Step 4

🎉

### Get Started (SPM) (Beta)

Swift Package Manager (SPM) support adds the ability to distribute _fastlane_ as a Swift Package Manager package, which allows other packages to integrate with the toolset.

#### Step 1

Create an executable Swift Package Manager project with `swift package init --type executable`.

#### Step 2

Add the _fastlane_ dependency to your `Package.swift`.

```swift
.package(name: "Fastlane", url: "https://github.com/fastlane/fastlane", from: "2.179.0")
```

A full example of a working package description would be the following.

```swift
// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "fastlaneRunner",
    products: [
        .executable(name: "fastlaneRunner", targets: ["fastlaneRunner"])
    ],
    dependencies: [
        .package(name: "Fastlane", url: "https://github.com/fastlane/fastlane", from: "2.179.0")
    ],
    targets: [
        .target(
            name: "fastlaneRunner",
            dependencies: ["Fastlane"],
            path: "Sources/Thingy"
        )
    ]
)
```

#### Step 3

Create your Fastfile.swift file in your package and add the desired lanes, as follows.

``` swift
import Fastlane

// Create a class with: 
class FastFile: LaneFile {
    // Your lanes goes here.
}
```

#### Step 4

Add an entry point (`@main`) or a `main.swift` file (mandatory for executable SPM packages) and don't forget to start the _fastlane_ runloop as follows:

```swift
import Fastlane

Main().run(with: Fastfile())
```

#### Step 5

Modify the target of your executable to have executable arguments `lane myLane` or add them in the call after making `swift build`.

```no-highlight
myExecutable lane myLane
```

##### Notes:

- You can edit the created `Package.swift` file to add your desired dependencies so you can use them in the Fastfile.

- If you want to just push your `Package.swift` and `Package.resolved` to the repo, you'd need to `swift build` the package to create your executable again which can be found in the `.debug` or `.release` folders, depending on how you built the package (`.debug` by default). 

##### Which _fastlane_ the runner starts

The runner starts `fastlane socket_server` itself, choosing _fastlane_ in this order:

1. `FASTLANE_SPM_BIN`, if set: the command to run, split by the shell, so quote a path that contains spaces (`FASTLANE_SPM_BIN="'/path with spaces/fastlane'"` or `FASTLANE_SPM_BIN="bundle exec fastlane"`).
2. The Bundler binstub `bin/fastlane` next to your `Gemfile`.
3. `bundle exec fastlane`, when there is a `Gemfile`: the one in `BUNDLE_GEMFILE`, or the nearest `Gemfile` or `gems.rb` from the working directory up, as Bundler finds it.
4. `fastlane` on your `PATH`.

When you start the runner from Xcode, the `PATH` it gets is minimal, so set `FASTLANE_SPM_BIN` to an absolute path.

If another process already listens on the runner's port (`swiftServerPort`, 2000 by default) on `127.0.0.1` or `::1`, the runner stops and names it when it can, instead of connecting to it.

### Defining Lanes

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

### Passing Parameters

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

### Using Plugins

Once you [add a plugin](https://docs.fastlane.tools/plugins/using-plugins/#add-a-plugin-to-your-project), _fastlane_ will automatically generate the corresponding API and make it available in `fastlane/swift/Plugins.swift`.

Example:

```sh
bundle exec fastlane add_plugin ascii_art
```

The `fastlane/swift/Plugins.swift` file should now contain the function `asciiArt()`, and you can access it in your lanes in `fastlane/Fastlane.swift`.

### Run Parallel

`Fastlane Swift` uses socket internally. Therefore, for several `Lane`s to run in parallel at the same time, each `Lane` must be specified different `socket port` (lane's default `socket port` is `2000`)

To specify `socket port` from the command line to your lane, use the following syntax:

```no-highlight
fastlane [lane] --swift_server_port [socket port]
```

### We Would Love Your Feedback

Please feel free to [open an issue on GitHub](https://github.com/fastlane/fastlane) to report any problems you are having with Fastlane.swift and we will respond as quickly as possible.
