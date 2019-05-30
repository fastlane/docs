<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_build_number.rb
-->

# app_store_build_number


Returns the current build_number of either live or edit version




> Returns the current build number of either the live or testflight version - it is useful for getting the build_number of the current or ready-for-sale app version, and it also works on non-live testflight version.<br>If you need to handle more build-trains please see `latest_testflight_build_number`.


app_store_build_number ||
---|---
Supported platforms | ios, mac
Author | @hjanuschka



## 3 Examples

```ruby
app_store_build_number
```

```ruby
app_store_build_number(
  app_identifier: "app.identifier",
  username: "user@host.com"
)
```

```ruby
app_store_build_number(
  live: false,
  app_identifier: "app.identifier",
  version: "1.2.9"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `initial_build_number` | sets the build number to given value if no build is in current train | 
  `app_identifier` | The bundle identifier of your app | [*](#parameters-legend-dynamic)
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `live` | Query the live version (ready-for-sale) | `true`
  `version` | The version number whose latest build number we want | 
  `platform` | The platform to use (optional) | `ios`
  `team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `app_store_build_number` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::LATEST_BUILD_NUMBER` | The latest build number of either live or testflight version

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action app_store_build_number
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run app_store_build_number
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run app_store_build_number parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_build_number.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
