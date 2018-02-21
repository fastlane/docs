<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# latest_testflight_build_number


Fetches most recent build number from TestFlight




> Provides a way to have increment_build_number be based on the latest build you uploaded to iTC.
Fetches most recent build number from TestFlight based on the version number. Provides a way to have `increment_build_number` be based on the latest build you uploaded to iTC.


latest_testflight_build_number |
-----|----
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
  `live` | Query the live version (ready-for-sale) | false
  `app_identifier` | The bundle identifier of your app | -
  `username` | Your Apple ID Username | -
  `version` | The version number whose latest build number we want | -
  `platform` | The platform to use (optional) | ios
  `initial_build_number` | sets the build number to given value if no build is in current train | 1
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams | -
  `team_name` | The name of your iTunes Connect team if you're in multiple teams | -

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action latest_testflight_build_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/latest_testflight_build_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
