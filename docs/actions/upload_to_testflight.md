<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_to_testflight.rb
-->

# upload_to_testflight


Upload new binary to App Store Connect for TestFlight beta testing (via _pilot_)




<p align="center">
  <img src="/img/actions/PilotTextTransparentSmall.png" width="500">
</p>

###### The best way to manage your TestFlight testers and builds from your terminal

Pilot makes it easier to manage your app on Apple’s TestFlight. You can:

- Upload & distribute builds
- Add & remove testers
- Retrieve information about testers & devices
- Import/export all available testers

_pilot_ uses [spaceship.airforce](https://spaceship.airforce) to interact with App Store Connect 🚀

-------

<p align="center">
    <a href="#usage">Usage</a> &bull;
    <a href="#tips">Tips</a>
</p>

-------

<h5 align="center"><code>pilot</code> is part of <a href="https://fastlane.tools">fastlane</a>: The easiest way to automate beta deployments and releases for your iOS and Android apps.</h5>

# Usage

For all commands you can specify the Apple ID to use using `-u felix@krausefx.com`. If you execute _pilot_ in a project already using [_fastlane_](https://fastlane.tools) the username and app identifier will automatically be determined.

## Uploading builds

To upload a new build, just run

```no-highlight
fastlane pilot upload
```

This will automatically look for an `ipa` in your current directory and tries to fetch the login credentials from your [fastlane setup](https://fastlane.tools).

You'll be asked for any missing information. Additionally, you can pass all kinds of parameters:

```no-highlight
fastlane action pilot
```

You can pass a changelog using

```no-highlight
fastlane pilot upload --changelog "Something that is new here"
```

You can also skip the submission of the binary, which means, the `ipa` file will only be uploaded and not distributed to testers:

```no-highlight
fastlane pilot upload --skip_submission
```

_pilot_ does all kinds of magic for you:

- Automatically detects the bundle identifier from your `ipa` file
- Automatically fetch the AppID of your app based on the bundle identifier

_pilot_ uses [_spaceship_](https://spaceship.airforce) to submit the build metadata and the iTunes Transporter to upload the binary. Because iTunes Transporter's upload capability is only supported on OS X, `pilot upload` does not work on Linux, as described [in this issue](https://github.com/fastlane/fastlane/issues/5789)

## List builds

To list all builds for specific application use

```no-highlight
fastlane pilot builds
```

The result lists all active builds and processing builds:

```no-highlight
+-----------+---------+----------+
|      Great App Builds          |
+-----------+---------+----------+
| Version # | Build # | Installs |
+-----------+---------+----------+
| 0.9.13    | 1       | 0        |
| 0.9.13    | 2       | 0        |
| 0.9.20    | 3       | 0        |
| 0.9.20    | 4       | 3        |
+-----------+---------+----------+
```

## Managing beta testers

### List of Testers

This command will list all your testers, both internal and external.

```no-highlight
fastlane pilot list
```

The output will look like this:

```no-highlight
+--------+--------+--------------------------+-----------+
|                    Internal Testers                    |
+--------+--------+--------------------------+-----------+
| First  | Last   | Email                    | # Devices |
+--------+--------+--------------------------+-----------+
| Felix  | Krause | felix@krausefx.com       | 2         |
+--------+--------+--------------------------+-----------+

+-----------+---------+----------------------------+-----------+
|                       External Testers                       |
+-----------+---------+----------------------------+-----------+
| First     | Last    | Email                      | # Devices |
+-----------+---------+----------------------------+-----------+
| Max       | Manfred | email@email.com            | 0         |
| Detlef    | Müller  | detlef@krausefx.com        | 1         |
+-----------+---------+----------------------------+-----------+
```

### Add a new tester

To add a new tester to both your App Store Connect account and to your app (if given), use the `pilot add` command. This will create a new tester (if necessary) or add an existing tester to the app to test.

```no-highlight
fastlane pilot add email@invite.com
```

Additionally you can specify the app identifier (if necessary):

```no-highlight
fastlane pilot add email@email.com -a com.krausefx.app
```

### Find a tester

To find a specific tester use

```no-highlight
fastlane pilot find felix@krausefx.com
```

The resulting output will look like this:

```no-highlight
+---------------------+---------------------+
|            felix@krausefx.com             |
+---------------------+---------------------+
| First name          | Felix               |
| Last name           | Krause              |
| Email               | felix@krausefx.com  |
| Latest Version      | 0.9.14 (23          |
| Latest Install Date | 03/28/15 19:00      |
| 2 Devices           | • iPhone 6, iOS 8.3 |
|                     | • iPhone 5, iOS 7.0 |
+---------------------+---------------------+
```

### Remove a tester

This command will only remove external beta testers.

```no-highlight
fastlane pilot remove felix@krausefx.com
```

### Export testers

To export all external testers to a CSV file. Useful if you need to import tester info to another system or a new account.

```no-highlight
fastlane pilot export
```

### Import testers

Add external testers from a CSV file. Create a file (ex: `testers.csv`) and fill it with the following format:

```no-highlight
John,Appleseed,appleseed_john@mac.com,group-1;group-2
```

```no-highlight
fastlane pilot import
```

You can also specify the directory using

```no-highlight
fastlane pilot export -c ~/Desktop/testers.csv
fastlane pilot import -c ~/Desktop/testers.csv
```

# Tips

## Debug information

If you run into any issues you can use the `verbose` mode to get a more detailed output:

```no-highlight
fastlane pilot upload --verbose
```

## Firewall Issues

_pilot_ uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol from the command line using

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" pilot ...
```

If you are using _pilot_ via the [fastlane action](https://docs.fastlane.tools/actions#pilot), add the following to your `Fastfile`

```no-highlight
ENV["DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS"] = "-t DAV"
pilot...
```

## Credentials Issues

If your password contains special characters, _pilot_ may throw a confusing error saying your "Your Apple ID or password was entered incorrectly". The easiest way to fix this error is to change your password to something that **does not** contains special characters.

## How is my password stored?

_pilot_ uses the [CredentialsManager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) from _fastlane_.

<hr />


upload_to_testflight ||
---|---
Supported platforms | ios
Author | @KrauseFx



## 5 Examples

```ruby
upload_to_testflight
```

```ruby
testflight # alias for "upload_to_testflight"
```

```ruby
pilot # alias for "upload_to_testflight"
```

```ruby
upload_to_testflight(skip_submission: true) # to only upload the build
```

```ruby
upload_to_testflight(
  username: "felix@krausefx.com",
  app_identifier: "com.krausefx.app",
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `app_identifier` | The bundle identifier of the app to upload or manage testers (optional) | [*](#parameters-legend-dynamic)
  `app_platform` | The platform to use (optional) | `ios`
  `ipa` | Path to the ipa file to upload | [*](#parameters-legend-dynamic)
  `changelog` | Provide the 'what's new' text when uploading a new build | 
  `beta_app_description` | Provide the beta app description when uploading a new build | 
  `beta_app_feedback_email` | Provide the beta app email when uploading a new build | 
  `skip_submission` | Skip the distributing action of pilot and only upload the ipa file | `false`
  `skip_waiting_for_build_processing` | Don't wait for the build to process. If set to true, the changelog won't be set, `distribute_external` option won't work and no build will be distributed to testers | `false`
  `update_build_info_on_upload` | **DEPRECATED!** Update build info immediately after validation. This is deprecated and will be removed in a future release. App Store Connect no longer supports setting build info until after build processing has completed, which is when build info is updated by default | `false`
  `apple_id` | The unique App ID provided by App Store Connect | [*](#parameters-legend-dynamic)
  `distribute_external` | Should the build be distributed to external testers? | `false`
  `notify_external_testers` | Should notify external testers? | `true`
  `demo_account_required` | Do you need a demo account when Apple does review? | `false`
  `first_name` | The tester's first name | 
  `last_name` | The tester's last name | 
  `email` | The tester's email | 
  `testers_file_path` | Path to a CSV file of testers | `./testers.csv`
  `wait_processing_interval` | Interval in seconds to wait for App Store Connect processing | `30`
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID! | [*](#parameters-legend-dynamic)
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column | 
  `groups` | Associate tester to one group or more by group name / group id. E.g. `-g "Team 1","Team 2"` | 
  `wait_for_uploaded_build` | Use version info from uploaded ipa file to determine what build to use for distribution. If set to false, latest processing or any latest build will be used | `false`
  `reject_build_waiting_for_review` | Expire previous if it's 'waiting for review' | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action upload_to_testflight
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_to_testflight.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
