# fastlane screenshots for Android

Your app screenshots are probably the most important thing when it comes to convincing potential users to download or purchase your app. Unfortunately, many apps don't do screenshots well. This is often because taking screenshots of your app and then preparing them for display is time consuming, and it's hard to get everything right and consistent! For example:

- Are the screenshots in Google Play inconsistent with your latest app design?
- Is your app localized into many languages that require different screenshots for each?
- Is the same content displayed for each of your size variations?

_fastlane_ tools can automate this process, making it fast and consistent while giving you beautiful results!

![running screengrab](/img/getting-started/android/running-screengrab.gif)

# Capture Screenshots Automatically

_screengrab_ works with _fastlane_ to automate the process of capturing screenshots of your app. It allows you to:

- Capture hundreds of screenshots in multiple languages on any simulator
- Do something else while the computer takes the screenshots for you
- Configure it once, and store the configuration so anyone on the team can run it
- Get a summary of how your app looks like across all supported devices and languages

After _screengrab_ completes, it will show you summary of the screenshots you captured:

![screengrab results](/img/getting-started/android/screengrab-results.png)

## Getting Started Using Espresso

_screengrab_ uses the capabilities of Android's built-in [Instrumented tests](https://developer.android.com/training/testing/unit-testing/instrumented-unit-tests.html) combined with [Espresso](https://developer.android.com/topic/libraries/testing-support-library/index.html#Espresso) to drive interactions with your app. To get familiar with writing UI Tests with Espresso, check out [Testing UI for a Single App](http://developer.android.com/training/testing/ui-testing/espresso-testing.html).

## Installing _screengrab_

Install the gem:

```
sudo gem install screengrab
```

### Gradle dependency

Add the test dependency to your Gradle build:

```java
androidTestCompile 'tools.fastlane:screengrab:0.3.2'
```

### Configuring your Manifest Permissions
Ensure that the following permissions exist in your `src/debug/AndroidManifest.xml`

```xml
<!-- Allows unlocking your device and activating its screen so UI tests can succeed -->
<uses-permission android:name="android.permission.DISABLE_KEYGUARD"/>
<uses-permission android:name="android.permission.WAKE_LOCK"/>

<!-- Allows for storing and retrieving screenshots -->
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

<!-- Allows changing locales -->
<uses-permission android:name="android.permission.CHANGE_CONFIGURATION" />
```

## Configuring your UI Tests for _screengrab_

1.  Add `@ClassRule public static final LocaleTestRule localeTestRule = new LocaleTestRule();` to your tests class to handle automatic switching of locales
2.  To capture screenshots, add the following to your tests `Screengrab.screenshot("name_of_screenshot_here");` on the appropriate screens

## Generating Screenshots with Screengrab

- Run `./gradlew assembleDebug assembleAndroidTest` to generate debug and test APKs
- Run `fastlane screengrab` in your app project directory to generate screenshots
    - You will be prompted to provide any required parameters which are not in your `Screengrabfile`, or provided as command line arguments
- Your screenshots will be saved to `fastlane/metadata/android` in the directory where you ran `fastlane screengrab`

### Improved screenshot capture with UI Automator

As of _screengrab_ 0.5.0, you can specify different strategies to control the way _screengrab_ captures screenshots. The newer strategy delegates to [UI Automator](https://developer.android.com/topic/libraries/testing-support-library/index.html#UIAutomator) which fixes a number of problems compared to the original strategy:

* Shadows/elevation are correctly captured for Material UI
* Multi-window situations are correctly captured (dialogs, etc.)
* Works on Android N

However, UI Automator requires a device with **API level >= 18**, so it is not yet the default strategy. To enable it for all screenshots by default, make the following call before your tests run:

```java
Screengrab.setDefaultScreenshotStrategy(new UiAutomatorScreenshotStrategy());
```

# Upload Screenshots to Google Play

After generating your screenshots using `fastlane screengrab`, you'll usually want to upload them to Google Play.

**TODO: Bring in _supply_ getting started content**

To upload the screenshots stored in `fastlane/screenshots`, just run

```no-highlight
fastlane supply
```

# Use in Fastfile

To put all of this together so that anyone on your team could trigger generating and uploading new screenshots, you can define a _fastlane_ lane called `screenshots`. It would be responsible for:

1. Running your app through _screengrab_ to automatically capture your screenshots
1. Having _supply_ send your screenshots to Google Play for use in the store

Add the following code to your `fastlane/Fastfile`:

```ruby
lane :screenshots do
  screengrab
  supply
end
```

To get a list of all available options for each of the steps, run

```no-highlight
fastlane action screengrab
fastlane action supply
```

