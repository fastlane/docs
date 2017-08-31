# latest_testflight_build_number


Fetches most recent build number from TestFlight




> Provides a way to have increment_build_number be based on the latest build you uploaded to iTC.
Fetches most recent build number from TestFlight based on the version number. Provides a way to have `increment_build_number` be based on the latest build you uploaded to iTC.


latest_testflight_build_number |
-----|----
Supported platforms | ios
Author | @daveanderson
Returns | Integer representation of the latest build number uploaded to TestFlight



**2 Examples**

```ruby
latest_testflight_build_number(version: "1.3")
```

```ruby
increment_build_number({
  build_number: latest_testflight_build_number + 1
})
```





**Parameters**

Key | Description
----|------------
  `live` | Query the live version (ready-for-sale)
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `version` | The version number whose latest build number we want
  `initial_build_number` | sets the build number to given value if no build is in current train
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `team_name` | The name of your iTunes Connect team if you're in multiple teams




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action latest_testflight_build_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/latest_testflight_build_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
