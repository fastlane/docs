<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/testfairy.rb
-->

# testfairy


Upload a new build to [TestFairy](https://www.testfairy.com/)




> You can retrieve your API key on [your settings page](https://free.testfairy.com/settings/)


testfairy ||
---|---
Supported platforms | ios, android
Author | @taka0125, @tcurdt



## 1 Example

```ruby
testfairy(
  api_key: "...",
  ipa: "./ipa_file.ipa",
  comment: "Build #{lane_context[SharedValues::BUILD_NUMBER]}",
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_key` | API Key for TestFairy | 
  `ipa` | Path to your IPA file for iOS | [*](#parameters-legend-dynamic)
  `apk` | Path to your APK file for Android | [*](#parameters-legend-dynamic)
  `symbols_file` | Symbols mapping file | [*](#parameters-legend-dynamic)
  `upload_url` | API URL for TestFairy | `https://upload.testfairy.com`
  `testers_groups` | Array of tester groups to be notified | `[]`
  `metrics` | Array of metrics to record (cpu,memory,network,phone_signal,gps,battery,mic,wifi) | `[]`
  `comment` | Additional release notes for this upload. This text will be added to email notifications | `No comment provided`
  `auto_update` | Allows an easy upgrade of all users to the current version. To enable set to 'on' | `off`
  `notify` | Send email to testers | `off`
  `options` | Array of options (shake,video_only_wifi,anonymous) | `[]`
  `timeout` | Request timeout in seconds | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `testfairy` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::TESTFAIRY_BUILD_URL` | URL of the newly uploaded build

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action testfairy
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run testfairy
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run testfairy parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/testfairy.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
