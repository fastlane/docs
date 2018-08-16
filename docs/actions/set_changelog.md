<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_changelog.rb
-->

# set_changelog


Set the changelog for all languages on App Store Connect




> This is useful if you have only one changelog for all languages.<br>You can store the changelog in `./fastlane/changelog.txt` and it will automatically get loaded from there. This integration is useful if you support e.g. 10 languages and want to use the same "What's new"-text for all languages.<br>Defining the version is optional. _fastlane_ will try to automatically detect it if you don't provide one.


set_changelog ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx



## 2 Examples

```ruby
set_changelog(changelog: "Changelog for all Languages")
```

```ruby
set_changelog(app_identifier: "com.krausefx.app", version: "1.0", changelog: "Changelog for all Languages")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `app_identifier` | The bundle identifier of your app | [*](#parameters-legend-dynamic)
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `version` | The version number to create/update | 
  `changelog` | Changelog text that should be uploaded to App Store Connect | 
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `platform` | The platform of the app (ios, appletvos, mac) | `ios`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action set_changelog
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_changelog.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
