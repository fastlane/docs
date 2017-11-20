<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# set_changelog


Set the changelog for all languages on iTunes Connect




> This is useful if you have only one changelog for all languages.
You can store the changelog in `./fastlane/changelog.txt` and it will automatically get loaded from there. This integration is useful if you support e.g. 10 languages and want to use the same "What's new"-text for all languages.
Defining the version is optional, fastlane will try to automatically detect it if you don't provide one


set_changelog |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



**2 Examples**

```ruby
set_changelog(changelog: "Changelog for all Languages")
```

```ruby
set_changelog(app_identifier: "com.krausefx.app", version: "1.0", changelog: "Changelog for all Languages")
```





**Parameters**

Key | Description
----|------------
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `version` | The version number to create/update
  `changelog` | Changelog text that should be uploaded to iTunes Connect
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `team_name` | The name of your iTunes Connect team if you're in multiple teams




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action set_changelog
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_changelog.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
