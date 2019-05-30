<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/latest_testflight_build_number.rb
-->

# latest_testflight_build_number


Fetches most recent build number from TestFlight




> Provides a way to have `increment_build_number` be based on the latest build you uploaded to iTC.<br>Fetches the most recent build number from TestFlight based on the version number. Provides a way to have `increment_build_number` be based on the latest build you uploaded to iTC.


latest_testflight_build_number ||
---|---
Supported platforms | ios
Author | @daveanderson
Returns | Integer representation of the latest build number uploaded to TestFlight



## 2 Examples

```ruby
latest_testflight_build_number(version: "1.3")
```

```ruby
increment_build_number({
  build_number: latest_testflight_build_number + 1
})
```





## Parameters

Key | Description | Default
----|-------------|--------
  `live` | Query the live version (ready-for-sale) | `false`
  `app_identifier` | The bundle identifier of your app | [*](#parameters-legend-dynamic)
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `version` | The version number whose latest build number we want | 
  `platform` | The platform to use (optional) | `ios`
  `initial_build_number` | sets the build number to given value if no build is in current train | `1`
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `latest_testflight_build_number` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::LATEST_TESTFLIGHT_BUILD_NUMBER` | The latest build number of the latest version of the app uploaded to TestFlight

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action latest_testflight_build_number
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run latest_testflight_build_number
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run latest_testflight_build_number parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/latest_testflight_build_number.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
