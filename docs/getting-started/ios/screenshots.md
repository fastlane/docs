# fastlane screenshots for iOS and tvOS

Your App Store screenshots are probably the most important thing when it comes to convincing potential users to download or purchase your app. Unfortunately, many apps don't do screenshots well. This is often because taking screenshots of your app and then preparing them for display is time consuming, and it's hard to get everything right and consistent! For example:

- Are the screenshots in the App Store inconsistent with your latest app design?
- Is your app localized into many languages that require different screenshots for each?
- Have you made sure that no loading indicators are showing?
- Is the same content displayed for each of your size variations?

_fastlane_ tools can automate this process making it fast, and consistent while giving you beautiful results!

## Alternatives

For the full story about the many ways that developers can capture and beautify screenshots check out [this article](https://krausefx.com/blog/creating-perfect-app-store-screenshots-of-your-ios-app).

### Manually Capturing Screenshots

It goes without saying that this takes too much time, which also decreases the quality of the screenshots. Since it is not automated, the screenshots will show slightly different content on the various devices and languages. Many companies choose to create screenshots in one language and use them for all languages. While this might seem okay to us developers, there are many potential users out there that cannot read the text on your app screenshots if they are not localised. Have you ever looked at a screenshots with content in a language you don't know? It won't convince you to download the app.

However, the biggest disadvantage of this method is what happens when you need to repeat the process. If you notice a spelling mistake in the screenshots, if you release an update with a new design, or if you just want to show more up to date content, you'll have to create new screenshots for all languages and devices... manually.

The positive side of this approach is that your screenshots will all be crisp and correctly sized, with readable text.

### Scaled Screenshots via iTunes Connect

With the [iTunes Connect screenshot update](https://developer.apple.com/news/?id=08082016a) from August 2016, you can now use one set of screenshots for all available devices and screenshots. iTunes Connect will automatically scale the images for you, so that each device renders the same exact image.

While this is convenient, this approach has the same problems as the device frame approach: The screenshots don't actually show how the app looks on the user's device. It's a valid way to start though, since you can gradually overwrite screenshots for specific languages and devices.

# Capture Screenshots Automatically

_snapshot_ works with _fastlane_ to automate the process of capturing screenshots of your app. It allows you to:

- Capture hundreds of screenshots in multiple languages on all simulators
- Do something else while the computer takes the screenshots for you
- Configure it once, and store the configuration so anyone on the team can run it
- Generate a beautiful web page showing all screenshots on all devices. This is perfect to send to Q&A, marketing, or translators for verification
- Avoid having loading indicators in your App Store screenshots by intelligently waiting for network requests to be finished
- Get a summary of how your app looks like across all supported devices and languages

After _snapshot_ successfully captures all the screenshots, it will show you a beautiful HTML page to summarize all the screens that were captured:

![HTML summary page](/img/getting-started/ios/htmlPagePreviewFade.jpg)

## Getting Started Using UI Tests

_snapshot_ uses the capabilities of Apple's UI Tests to drive interactions with your app. To get familiar with writing UI Tests, check out the following introductions:

- [WWDC 2015 Introduction to UI Tests](https://developer.apple.com/videos/play/wwdc2015-406/)
- [A first look into UI Tests](http://www.mokacoding.com/blog/xcode-7-ui-testing/)
- [UI Testing in Xcode 7](http://masilotti.com/ui-testing-xcode-7/)
- [HSTestingBackchannel : ‘Cheat’ by communicating directly with your app](https://github.com/ConfusedVorlon/HSTestingBackchannel)
- [Automating App Store screenshots using fastlane snapshot and frameit](https://tisunov.github.io/2015/11/06/automating-app-store-screenshots-generation-with-fastlane-snapshot-and-sketch.html)

To jump-start your UI tests, you can use the UI Test recorder, which you can start by clicking the red record button on the bottom of the window. By interacting with your app through the simulator while using it, Xcode will generate UI Test code for you. To learn more, check out this [this blog post](https://krausefx.com/blog/run-xcode-7-ui-tests-from-the-command-line)!

## Setting Up _snapshot_

1. Create a new UI Test target in your Xcode project (See the top part of [this article](https://krausefx.com/blog/run-xcode-7-ui-tests-from-the-command-line))
1. Run `snapshot init` in your project folder
1. Add the `./SnapshotHelper.swift` file to your UI Test target (You can move the file anywhere you want)
1. (Objective C only) Add the bridging header to your test class.
    - `#import "MYUITests-Swift.h"`
    - The bridging header is named after your test target with -Swift.h appended.
1. In your UI Test class, click the `Record` button on the bottom left and record your interaction
1. To take a screenshot, call the following between interactions
    - Swift: `snapshot("01LoginScreen")`
    - Objective C: `[Snapshot snapshot:@"01LoginScreen" waitForLoadingIndicator:YES];`
1. Add the following code to your `setUp()` method:

**Swift**

```swift
let app = XCUIApplication()
setupSnapshot(app)
app.launch()
```

**Objective C**

```objective-c
XCUIApplication *app = [[XCUIApplication alloc] init];
[Snapshot setupSnapshot:app];
[app launch];
```

If you have _fastlane_ installed, it's easy to give _snapshot_ a try. First clone the _fastlane_ repo, head over to the _snapshot_ example project, and then run `fastlane snapshot`

```no-highlight
$ git clone https://github.com/fastlane/fastlane

$ cd fastlane/snapshot/example

$ fastlane snapshot
```

![/img/getting-started/ios/snapshot.gif](/img/getting-started/ios/snapshot.gif)

# Put Your Screenshots Into Device Frames

_frameit_ helps you beautify your screenshots with devices frames and text by running one simple command. It provides support for:

- Multiple device types
- Portrait and landscape orientations
- Black and silver devices
- Setting a background color and decorating the image with text

![frameit results](/img/getting-started/ios/frameit-results.png)

## Dependencies

### Installing ImageMagick

_frameit_ depends on a tool called `imagemagick` to do image manipulation. The easiest way to install it is through [homebrew](http://brew.sh/):

```no-highlight
brew install libpng jpeg imagemagick
```

### Troubleshooting ImageMagick

If you have installed _imagemagick_ but are seeing error messages like:

```no-highlight
mogrify: no decode delegate for this image format `PNG'
```

You may need to reinstall and build from source. Run:

```no-highlight
brew uninstall imagemagick; brew install libpng jpeg; brew install imagemagick --build-from-source
```

### Setting Up Device Frames

_fastlane_ uses device frames provided by Apple which need to be downloaded and installed separately for legal reasons. Running `fastlane frameit setup` can walk you through the process.

**TODO: Update this when we start distributing frames ourselves.**

```no-highlight
$ fastlane frameit setup
```

## Running

At its simplest, you can just run:

```no-highlight
fastlane frameit
```

A more complex example that configures a lot more about the output can be found in the [fastlane examples](https://github.com/fastlane/examples/tree/master/MindNode/screenshots) project.

# Upload Screenshots for the App Store

TODO: write about _deliver_

# All Together Now

To put all of this together so that anyone on your team could trigger this complete process, you could define a _fastlane_ lane called `screenshots`. It would be responsible for:

1. Running your app through _snapshot_ to automatically capture your screenshots
1. Decorating those screenshots with _frameit_
1. Having _deliver_ send your final screenshots to iTunes Connect for use in the App Store

That's all potentially as simple as:

```ruby
lane :screenshots do
  snapshot
  frameit(white: true)
  deliver
end
```
