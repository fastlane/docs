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
androidTestImplementation 'tools.fastlane:screengrab:x.x.x'
```

The latest version is [ ![Download](https://api.bintray.com/packages/fastlane/fastlane/screengrab/images/download.svg) ](https://bintray.com/fastlane/fastlane/screengrab/_latestVersion)

As of Screengrab version 2.0.0, all Android test dependencies are AndroidX dependencies. This means a device with API 18+, Android 4.3 or greater is required. If you wish to capture screenshots with an older Android OS, then you must use a 1.x.x version.

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
  - You can create your APKs manually with `./gradlew assembleDebug assembleAndroidTest`
  - You can also create a lane and use `build_android_app`:
    ```ruby
    desc "Build debug and test APK for screenshots"
    lane :build_for_screengrab do
      build_android_app(
        task: 'assemble',
        build_type: 'Debug'
      )
      build_android_app(
        task: 'assemble',
        build_type: 'AndroidTest'
      )
    end
    ```
- Once complete run `fastlane screengrab` in your app project directory to generate screenshots
  - You will be prompted to provide any required parameters which are not in your **Screengrabfile** or provided as command line arguments
- Your screenshots will be saved to `fastlane/metadata/android` in the directory where you ran _screengrab_

## Improved screenshot capture with UI Automator

As of _screengrab_ 0.5.0, you can specify different strategies to control the way _screengrab_ captures screenshots. The newer strategy delegates to [UI Automator](https://developer.android.com/topic/libraries/testing-support-library/index.html#UIAutomator) which fixes a number of problems compared to the original strategy:

* Shadows/elevation are correctly captured for Material UI
* Multi-window situations are correctly captured (dialogs, etc.)
* Works on Android N

UI Automator is the default strategy. However, UI Automator requires a device with **API level >= 18**. If you need to grab screenshots on an older Android version, use the latest 1.x.x version of this library and set the DecorView ScreenshotStrategy.

```java
Screengrab.setDefaultScreenshotStrategy(new DecorViewScreenshotStrategy());
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

Screengrab can clean your status bar to make your screenshots even more beautiful.  
Note: the clean status bar feature is only supported on devices with *API level >= 23*.

To use the clean status bar feature add the following lines to your src/debug/AndroidManifest.xml
```xml
<!-- Indicates the use of the clean status bar feature -->
<uses-feature android:name="tools.fastlane.screengrab.cleanstatusbar"/>
<!-- Allows for changing the status bar -->
<uses-permission android:name="android.permission.DUMP"/>
```

After that you can enable and disable the clean status bar at any moment during your tests.  
In most cases you probably want to do this in the @BeforeClass and @AfterClass methods.
```java
@BeforeClass
public static void beforeAll() {
    CleanStatusBar.enableWithDefaults();
}

@AfterClass
public static void afterAll() {
    CleanStatusBar.disable();
}
```

Have a look at the methods of the `CleanStatusBar` class to customize the status bar even more.  
You could for example show the Bluetooth icon and the LTE text.
```java
new CleanStatusBar()
    .setBluetoothState(BluetoothState.DISCONNECTED)
    .setMobileNetworkDataType(MobileDataType.LTE)
    .enable();
```

# Advanced _screengrab_

<details>
<summary>Launch Arguments</summary>

You can provide additional arguments to your testcases on launch. These strings will be available in your tests through `InstrumentationRegistry.getArguments()`.

```ruby
screengrab(
  launch_arguments: [
    "username hjanuschka",
    "build_number 201"
  ]
)
```

```java
Bundle extras = InstrumentationRegistry.getArguments();
String peerID = null;
if (extras != null) {
  if (extras.containsKey("username")) {
    username = extras.getString("username");
    System.out.println("Username: " + username);
  } else {
    System.out.println("No username in extras");
  }
} else {
  System.out.println("No extras");
}
```
</details>

<details>
<summary>Detecting screengrab at runtime</summary>

For some apps, it is helpful to know when _screengrab_ is running so that you can display specific data for your screenshots. For iOS fastlane users, this is much like "FASTLANE_SNAPSHOT". In order to do this, you'll need to have at least two product flavors of your app.

Add two product flavors to the app-level build.gradle file:
```
android {
...
    flavorDimensions "mode"
    productFlavors {
        screengrab {
            dimension "mode"
        }
        regular {
            dimension "mode"
        }
    }
...
}
```

Check for the existence of that flavor (i.e screengrab) in your app code as follows in order to use mock data or customize data for screenshots:
```
if (BuildConfig.FLAVOR == "screengrab") {
    System.out.println("screengrab is running!");
}
```

When running _screengrab_, do the following to build the flavor you want as well as the test apk. Note that you use "assembleFlavor_name" where Flavor_name is the flavor name, capitalized (i.e. Screengrab).
```
./gradlew assembleScreengrab assembleAndroidTest
```

Run _screengrab_:
```
fastlane screengrab
```
_screengrab_ will ask you to select the debug and test apps (which you can then add to your Screengrabfile to skip this step later).

The debug apk should be somewhere like this:

`app/build/outputs/apk/screengrab/debug/app-screengrab-debug.apk`

The test apk should be somewhere like this:

`app/build/outputs/apk/androidTest/screengrab/debug/app-screengrab-debug-androidTest.apk`

Sit back and enjoy your new screenshots!

Note: while this could also be done by creating a new build variant (i.e. debug, release and creating a new one called screengrab), [Android only allows one build type to be tested](http://tools.android.com/tech-docs/new-build-system/user-guide#TOC-Testing) which defaults to debug. That's why we use product flavors.

</details>


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
  `test_instrumentation_runner` | The fully qualified class name of your test instrumentation runner | `androidx.test.runner.AndroidJUnitRunner`
  `ending_locale` | Return the device to this locale after running tests | `en-US`
  `use_adb_root` | Restarts the adb daemon using `adb root` to allow access to screenshots directories on device. Use if getting 'Permission denied' errors | `false`
  `app_apk_path` | The path to the APK for the app under test | [*](#parameters-legend-dynamic)
  `tests_apk_path` | The path to the APK for the the tests bundle | [*](#parameters-legend-dynamic)
  `specific_device` | Use the device or emulator with the given serial number or qualifier | 
  `device_type` | Type of device used for screenshots. Matches Google Play Types (phone, sevenInch, tenInch, tv, wear) | `phone`
  `exit_on_test_failure` | Whether or not to exit Screengrab on test failure. Exiting on failure will not copy sceenshots to local machine nor open sceenshots summary | `true`
  `reinstall_app` | Enabling this option will automatically uninstall the application before running it | `false`
  `use_timestamp_suffix` | Add timestamp suffix to screenshot filename | `true`
  `adb_host` | Configure the host used by adb to connect, allows running on remote devices farm | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `screengrab` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::SCREENGRAB_OUTPUT_DIRECTORY` | The path to the output directory

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action screengrab
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run screengrab
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run screengrab parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/screengrab.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
