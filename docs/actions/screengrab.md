<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/screengrab.rb
-->

# screengrab


Alias for the `capture_android_screenshots` action




<p align="center">
  <img src="/img/actions/screengrab.png" width="250">
</p>

###### Automated localized screenshots of your Android app on every device

_screengrab_ generates localized screenshots of your Android app for different device types and languages for Google Play and can be uploaded using [_supply_](https://fastlane.tools/supply).

<img src="/img/actions/running-screengrab.gif" width="640">

### Why should I automate this process?

- Create hundreds of screenshots in multiple languages on emulators or real devices, saving you hours
- Easily verify that localizations fit into labels on all screen dimensions to find UI mistakes before you ship
- You only need to configure it once for anyone on your team to run it
- Keep your screenshots perfectly up-to-date with every app update. Your customers deserve it!
- Fully integrates with [_fastlane_](https://fastlane.tools) and [_supply_](https://fastlane.tools/supply)

# Installation

Install the gem

```no-highlight
sudo gem install fastlane
```

##### Gradle dependency
```java
androidTestCompile('tools.fastlane:screengrab:x.x.x')
```

The latest version is [ ![Download](https://api.bintray.com/packages/fastlane/fastlane/screengrab/images/download.svg) ](https://bintray.com/fastlane/fastlane/screengrab/_latestVersion)

##### Configuring your Manifest Permissions

Ensure that the following permissions exist in your **src/debug/AndroidManifest.xml**

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

##### Configuring your <a href="#ui-tests">UI Tests</a> for Screenshots

1. Add `@ClassRule public static final LocaleTestRule localeTestRule = new LocaleTestRule();` to your tests class to handle automatic switching of locales
2. To capture screenshots, add the following to your tests `Screengrab.screenshot("name_of_screenshot_here");` on the appropriate screens

# Generating Screenshots with Screengrab
- Then, before running `fastlane screengrab` you'll need a debug and test apk
  - You can create your APKs with `./gradlew assembleDebug assembleAndroidTest`
- Once complete run `fastlane screengrab` in your app project directory to generate screenshots
  - You will be prompted to provide any required parameters which are not in your **Screengrabfile** or provided as command line arguments
- Your screenshots will be saved to `fastlane/metadata/android` in the directory where you ran _screengrab_

## Improved screenshot capture with UI Automator

As of _screengrab_ 0.5.0, you can specify different strategies to control the way _screengrab_ captures screenshots. The newer strategy delegates to [UI Automator](https://developer.android.com/topic/libraries/testing-support-library/index.html#UIAutomator) which fixes a number of problems compared to the original strategy:

* Shadows/elevation are correctly captured for Material UI
* Multi-window situations are correctly captured (dialogs, etc.)
* Works on Android N

However, UI Automator requires a device with **API level >= 18**, so it is not yet the default strategy. To enable it for all screenshots by default, make the following call before your tests run:

```java
Screengrab.setDefaultScreenshotStrategy(new UiAutomatorScreenshotStrategy());
```

## Improved screenshot capture with Falcon

As of _screengrab_ 1.2.0, you can specify a new strategy to delegate to [Falcon](https://github.com/jraska/Falcon). Falcon may work better than UI Automator in some situations and also provides similar benefits as UI Automator:

* Multi-window situations are correctly captured (dialogs, etc.)
* Works on Android N

Falcon requires a device with **API level >= 10**. To enable it for all screenshots by default, make the following call before your tests run:

```java
Screengrab.setDefaultScreenshotStrategy(new FalconScreenshotStrategy(activityRule.getActivity()));
```

## Advanced Screengrabfile Configuration

Running `fastlane screengrab init` generated a Screengrabfile which can store all of your configuration options. Since most values will not change often for your project, it is recommended to store them there.

The `Screengrabfile` is written in Ruby, so you may find it helpful to use an editor that highlights Ruby syntax to modify this file.

```ruby-skip-tests
# remove the leading '#' to uncomment lines

# app_package_name('your.app.package')
# use_tests_in_packages(['your.screenshot.tests.package'])

# app_apk_path('path/to/your/app.apk')
# tests_apk_path('path/to/your/tests.apk')

locales(['en-US', 'fr-FR', 'it-IT'])

# clear all previously generated screenshots in your local output directory before creating new ones
clear_previous_screenshots(true)
```

For more information about all available options run

```no-highlight
fastlane action screengrab
```

# Tips

## UI Tests

Check out [Testing UI for a Single App](http://developer.android.com/training/testing/ui-testing/espresso-testing.html) for an introduction to using Espresso for UI testing.

##### Example UI Test Class (Using JUnit4)
```java
@RunWith(JUnit4.class)
public class JUnit4StyleTests {
    @ClassRule
    public static final LocaleTestRule localeTestRule = new LocaleTestRule();

    @Rule
    public ActivityTestRule<MainActivity> activityRule = new ActivityTestRule<>(MainActivity.class);

    @Test
    public void testTakeScreenshot() {
        Screengrab.screenshot("before_button_click");

        onView(withId(R.id.fab)).perform(click());

        Screengrab.screenshot("after_button_click");
    }
}

```
There is an [example project](https://github.com/fastlane/fastlane/tree/master/screengrab/example/src/androidTest/java/tools/fastlane/localetester) showing how to use use JUnit 3 or 4 and Espresso with the screengrab Java library to capture screenshots during a UI test run.

Using JUnit 4 is preferable because of its ability to perform actions before and after the entire test class is run. This means you will change the device's locale far fewer times when compared with JUnit 3 running those commands before and after each test method.

When using JUnit 3 you'll need to add a bit more code:

- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getTestLocale());` in `setUp()`
- Use `LocaleUtil.changeDeviceLocaleTo(LocaleUtil.getEndingLocale());` in `tearDown()`
- Use `Screengrab.screenshot("name_of_screenshot_here");` to capture screenshots at the appropriate points in your tests

If you're having trouble getting your device unlocked and the screen activated to run tests, try using `ScreenUtil.activateScreenForTesting(activity);` in your test setup.

## Clean Status Bar

You can use [QuickDemo](https://github.com/PSPDFKit-labs/QuickDemo) to clean up the status bar for your screenshots.

<hr />


screengrab ||
---|---
Supported platforms | android
Author | @asfalcone, @i2amsam, @mfurtak



## 3 Examples

```ruby
capture_android_screenshots
```

```ruby
screengrab # alias for "capture_android_screenshots"
```

```ruby
capture_android_screenshots(
  locales: ["en-US", "fr-FR", "ja-JP"],
  clear_previous_screenshots: true,
  app_apk_path: "build/outputs/apk/example-debug.apk",
  tests_apk_path: "build/outputs/apk/example-debug-androidTest-unaligned.apk"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `android_home` | Path to the root of your Android SDK installation, e.g. ~/tools/android-sdk-macosx | [*](#parameters-legend-dynamic)
  `build_tools_version` | The Android build tools version to use, e.g. '23.0.2' | 
  `locales` | A list of locales which should be used | `["en-US"]`
  `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running screengrab | `false`
  `output_directory` | The directory where to store the screenshots | `fastlane/metadata/android`
  `skip_open_summary` | Don't open the summary after running _screengrab_ | [*](#parameters-legend-dynamic)
  `app_package_name` | The package name of the app under test (e.g. com.yourcompany.yourapp) | [*](#parameters-legend-dynamic)
  `tests_package_name` | The package name of the tests bundle (e.g. com.yourcompany.yourapp.test) | 
  `use_tests_in_packages` | Only run tests in these Java packages | 
  `use_tests_in_classes` | Only run tests in these Java classes | 
  `launch_arguments` | Additional launch arguments | 
  `test_instrumentation_runner` | The fully qualified class name of your test instrumentation runner | `android.support.test.runner.AndroidJUnitRunner`
  `ending_locale` | Return the device to this locale after running tests | `en-US`
  `app_apk_path` | The path to the APK for the app under test | [*](#parameters-legend-dynamic)
  `tests_apk_path` | The path to the APK for the the tests bundle | [*](#parameters-legend-dynamic)
  `specific_device` | Use the device or emulator with the given serial number or qualifier | 
  `device_type` | Type of device used for screenshots. Matches Google Play Types (phone, sevenInch, tenInch, tv, wear) | `phone`
  `exit_on_test_failure` | Whether or not to exit Screengrab on test failure. Exiting on failure will not copy sceenshots to local machine nor open sceenshots summary | `true`
  `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action screengrab
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/screengrab.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
