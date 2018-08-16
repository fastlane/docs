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
To show the documentation in your terminal, run
```no-highlight
fastlane action app_store_build_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_build_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
