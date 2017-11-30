<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# capture_android_screenshots


Automated localized screenshots of your Android app (via `screengrab`)







capture_android_screenshots |
-----|----
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

Key | Description
----|------------
  `android_home` | Path to the root of your Android SDK installation, e.g. ~/tools/android-sdk-macosx
  `build_tools_version` | The Android build tools version to use, e.g. '23.0.2'
  `locales` | A list of locales which should be used
  `clear_previous_screenshots` | Enabling this option will automatically clear previously generated screenshots before running screengrab
  `output_directory` | The directory where to store the screenshots
  `skip_open_summary` | Don't open the summary after running _screengrab_
  `app_package_name` | The package name of the app under test (e.g. com.yourcompany.yourapp)
  `tests_package_name` | The package name of the tests bundle (e.g. com.yourcompany.yourapp.test)
  `use_tests_in_packages` | Only run tests in these Java packages
  `use_tests_in_classes` | Only run tests in these Java classes
  `launch_arguments` | Additional launch arguments
  `test_instrumentation_runner` | The fully qualified class name of your test instrumentation runner
  `ending_locale` | Return the device to this locale after running tests
  `app_apk_path` | The path to the APK for the app under test
  `tests_apk_path` | The path to the APK for the the tests bundle
  `specific_device` | Use the device or emulator with the given serial number or qualifier
  `device_type` | Type of device used for screenshots. Matches Google Play Types (phone, sevenInch, tenInch, tv, wear)
  `exit_on_test_failure` | Whether or not to exit Screengrab on test failure. Exiting on failure will not copy sceenshots to local machine nor open sceenshots summary
  `reinstall_app` | Enabling this option will automatically uninstall the application before running it




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action capture_android_screenshots
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/capture_android_screenshots.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
