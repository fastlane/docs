# _fastlane_ screenshots for Android

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

_screengrab_ uses the capabilities of Android's built-in [Instrumented tests](https://developer.android.com/training/testing/unit-testing/instrumented-unit-tests.html) combined with [Espresso](https://developer.android.com/topic/libraries/testing-support-library/index.html#Espresso) to drive interactions with your app. 

To get started with writing UI Tests with Espresso, Checkout the [Create UI tests with Espresso Test Recorder](https://www.youtube.com/watch?v=JRkDVvB106k) video which talks about the Espresso Recording feature for writing UI tests. To learn more about UI testing in Android, refer to the [Testing UI for a Single App](http://developer.android.com/training/testing/ui-testing/espresso-testing.html) guide.

## Installing _screengrab_

Install the gem:

```
sudo gem install screengrab
```

### Gradle dependency

Add the test dependency to your Gradle build:

```java
androidTestCompile 'tools.fastlane:screengrab:x.x.x'
```

The latest version can be determined by visiting the [_screengrab_ RubyGems page](https://rubygems.org/gems/screengrab)

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

1. To handle automatic switching of locales, add `@ClassRule public static final LocaleTestRule localeTestRule = new LocaleTestRule();` to /app/java/<com.your.package>(AndroidTest)/ExampleInstrumentedTest.java or to your tests class 
2. To capture screenshots, add the following to your tests `Screengrab.screenshot("name_of_screenshot_here");` on the appropriate screens

##### Example UI Test Class (Using JUnit4)
```java
@RunWith(JUnit4.class)
public class ExampleInstrumentedTest {
    @ClassRule
    public static final LocaleTestRule localeTestRule = new LocaleTestRule();

    @Rule
    public ActivityTestRule<MainActivity> activityRule = new ActivityTestRule<>(MainActivity.class);

    @Test
    public void testTakeScreenshot() {
        Screengrab.screenshot("before_button_click");

        // Your custom onView...
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

### Improved screenshot capture with UI Automator

As of _screengrab_ 0.5.0, you can specify different strategies to control the way _screengrab_ captures screenshots. The newer strategy delegates to [UI Automator](https://developer.android.com/topic/libraries/testing-support-library/index.html#UIAutomator) which fixes a number of problems compared to the original strategy:

* Shadows/elevation are correctly captured for Material UI
* Multi-window situations are correctly captured (dialogs, etc.)
* Works on Android N

However, UI Automator requires a device with **API level >= 18**, so it is not yet the default strategy. To enable it for all screenshots by default, make the following call before your tests run:

```java
Screengrab.setDefaultScreenshotStrategy(new UiAutomatorScreenshotStrategy());
```

## Clean Status Bar

You can use [QuickDemo](https://github.com/PSPDFKit-labs/QuickDemo) to clean up the status bar for your screenshots.


## Generating Screenshots with Screengrab

- Run `./gradlew assembleDebug assembleAndroidTest` to generate debug and test APKs
- Run `fastlane screengrab` in your app project directory to generate screenshots
    - You will be prompted to provide any required parameters which are not in your `Screengrabfile`, or provided as command line arguments
- Your screenshots will be saved to `fastlane/metadata/android` in the directory where you ran `fastlane screengrab`


# Upload Screenshots to Google Play

After generating your screenshots using `fastlane screengrab`, you'll usually want to upload them to Google Play.

To upload the screenshots stored in `fastlane/metadata/android`, just run:

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

# Advanced _screengrab_

<details>
<summary>Launch Arguments</summary>

You can provide additional arguments to your testcases on launch. These strings will be available in your tests through `InstrumentationRegistry.getArguments()`.

```ruby
launch_arguments([
  "username hjanuschka",
  "build_number 201"
])
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
    System.out.println("screengrab is running!")
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

