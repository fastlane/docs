# tryouts


Upload a new build to Tryouts




> More information http://tryouts.readthedocs.org/en/latest/releases.html#create-release


tryouts |
-----|----
Supported platforms | ios, android
Author | @alicertel



**1 Example**

```ruby
tryouts(
  api_token: "...",
  app_id: "application-id",
  build_file: "test.ipa",
)
```





**Parameters**

Key | Description
----|------------
  `app_id` | Tryouts application hash
  `api_token` | API Token for Tryouts Access
  `build_file` | Path to your IPA or APK file. Optional if you use the _gym_ or _xcodebuild_ action
  `notes` | Release notes
  `notes_path` | Release notes text file path. Overrides the :notes parameter
  `notify` | Notify testers? 0 for no
  `status` | 2 to make your release public. Release will be distributed to available testers. 1 to make your release private. Release won't be distributed to testers. This also prevents release from showing up for SDK update




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action tryouts
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/tryouts.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
