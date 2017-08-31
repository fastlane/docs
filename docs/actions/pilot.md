# pilot


Upload a new binary to iTunes Connect for TestFlight beta testing




> More details can be found on https://github.com/fastlane/fastlane/tree/master/pilot
This integration will only do the TestFlight upload


pilot |
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



**4 Examples**

```ruby
testflight
```

```ruby
pilot # alias for "testflight"
```

```ruby
testflight(skip_submission: true) # to only upload the build
```

```ruby
testflight(
  username: "felix@krausefx.com",
  app_identifier: "com.krausefx.app",
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)
```





**Parameters**

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | The bundle identifier of the app to upload or manage testers (optional)
  `app_platform` | The platform to use (optional)
  `ipa` | Path to the ipa file to upload
  `changelog` | Provide the 'what's new' text when uploading a new build
  `beta_app_description` | Provide the beta app description when uploading a new build
  `beta_app_feedback_email` | Provide the beta app email when uploading a new build
  `skip_submission` | Skip the distributing action of pilot and only upload the ipa file
  `skip_waiting_for_build_processing` | Don't wait for the build to process. If set to true, the changelog won't be set, `distribute_external` option won't work and no build will be distributed to testers
  `update_build_info_on_upload` | [DEPRECATED!] true - Update build info immediately after validation. This is deprecated and will be removed in a future release. iTunesConnect no longer supports setting build info until after build processing has completed, which is when build info is updated by default
  `apple_id` | The unique App ID provided by iTunes Connect
  `distribute_external` | Should the build be distributed to external testers?
  `first_name` | The tester's first name
  `last_name` | The tester's last name
  `email` | The tester's email
  `testers_file_path` | Path to a CSV file of testers
  `wait_processing_interval` | Interval in seconds to wait for iTunes Connect processing
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `team_name` | The name of your iTunes Connect team if you're in multiple teams
  `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID!
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team
  `groups` | Associate tester to one group or more by group name / group id. E.g. '-g "Team 1","Team 2"'




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action pilot
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/pilot.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
