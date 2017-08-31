# app_store_build_number


Returns the current build_number of either live or edit version




> Returns the current build number of either the live or testflight version - it is useful for getting the build_number of the current or ready-for-sale app version, and it also works on non-live testflight version. If you need to handle more build-trains please see `latest_testflight_build_number`


app_store_build_number |
-----|----
Supported platforms | ios, mac
Author | @hjanuschka



**3 Examples**

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





**Parameters**

Key | Description
----|------------
  `initial_build_number` | sets the build number to given value if no build is in current train
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `live` | Query the live version (ready-for-sale)
  `version` | The version number whose latest build number we want
  `team_name` | The name of your iTunes Connect team if you're in multiple teams




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action app_store_build_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_build_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
