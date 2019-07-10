<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/testflight.rb
-->

# testflight


Alias for the `upload_to_testflight` action




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

<h5 align="center"><em>pilot</em> is part of <a href="https://fastlane.tools">fastlane</a>: The easiest way to automate beta deployments and releases for your iOS and Android apps.</h5>

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

## Provider Short Name
If you are on multiple App Store Connect teams, iTunes Transporter may need a provider short name to know where to upload your binary. _pilot_ will try to use the long name of the selected team to detect the provider short name. To override the detected value with an explicit one, use the `itc_provider` option.

## Use an Application Specific Password to upload

_pilot_/`upload_to_testflight` can use an [Application Specific Password via the `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD` envirionment variable](https://docs.fastlane.tools/best-practices/continuous-integration/#application-specific-passwords) to upload a binary if both the `skip_waiting_for_build_processing` and `apple_id` options are set. (If any of those are not set, it will use the normal Apple login process that might require 2FA authentication.)

<hr />


testflight ||
---|---
Supported platforms | ios
Author | @KrauseFx



## 7 Examples

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

```ruby
upload_to_testflight(
  beta_app_feedback_email: "email@email.com",
  beta_app_description: "This is a description of my app",
  demo_account_required: true,
  notify_external_testers: false,
  changelog: "This is my changelog of things that have changed in a log"
)
```

```ruby
upload_to_testflight(
  beta_app_review_info: {
    contact_email: "email@email.com",
    contact_first_name: "Connect",
    contact_last_name: "API",
    contact_phone: "5558675309",
    demo_account_name: "demo@email.com",
    demo_account_password: "connectapi",
    notes: "this is review note for the reviewer <3 thank you for reviewing"
  },
  localized_app_info: {
    "default": {
      feedback_email: "default@email.com",
      marketing_url: "https://example.com/marketing-defafult",
      privacy_policy_url: "https://example.com/privacy-defafult",
      description: "Default description",
    },
    "en-GB": {
      feedback_email: "en-gb@email.com",
      marketing_url: "https://example.com/marketing-en-gb",
      privacy_policy_url: "https://example.com/privacy-en-gb",
      description: "en-gb description",
    }
  },
  localized_build_info: {
    "default": {
      whats_new: "Default changelog",
    },
    "en-GB": {
      whats_new: "en-gb changelog",
    }
  }
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `app_identifier` | The bundle identifier of the app to upload or manage testers (optional) | [*](#parameters-legend-dynamic)
  `app_platform` | The platform to use (optional) | `ios`
  `apple_id` | Apple ID property in the App Information section in App Store Connect | [*](#parameters-legend-dynamic)
  `ipa` | Path to the ipa file to upload | [*](#parameters-legend-dynamic)
  `demo_account_required` | Do you need a demo account when Apple does review? | `false`
  `beta_app_review_info` | Beta app review information for contact info and demo account | 
  `localized_app_info` | Localized beta app test info for description, feedback email, marketing url, and privacy policy | 
  `beta_app_description` | Provide the 'Beta App Description' when uploading a new build | 
  `beta_app_feedback_email` | Provide the beta app email when uploading a new build | 
  `localized_build_info` | Localized beta app test info for what's new | 
  `changelog` | Provide the 'What to Test' text when uploading a new build. `skip_waiting_for_build_processing: false` is required to set the changelog | 
  `skip_submission` | Skip the distributing action of pilot and only upload the ipa file | `false`
  `skip_waiting_for_build_processing` | Don't wait for the build to process. If set to true, the changelog won't be set, `distribute_external` option won't work and no build will be distributed to testers. (You might want to use this option if you are using this action on CI and have to pay for 'minutes used' on your CI plan) | `false`
  `update_build_info_on_upload` | **DEPRECATED!** Update build info immediately after validation. This is deprecated and will be removed in a future release. App Store Connect no longer supports setting build info until after build processing has completed, which is when build info is updated by default | `false`
  `uses_non_exempt_encryption` | Provide the 'Uses Non-Exempt Encryption' for export compliance. This is used if there is 'ITSAppUsesNonExemptEncryption' is not set in the Info.plist | `false`
  `distribute_external` | Should the build be distributed to external testers? | `false`
  `notify_external_testers` | Should notify external testers? | `true`
  `first_name` | The tester's first name | 
  `last_name` | The tester's last name | 
  `email` | The tester's email | 
  `testers_file_path` | Path to a CSV file of testers | `./testers.csv`
  `groups` | Associate tester to one group or more by group name / group id. E.g. `-g "Team 1","Team 2"` | 
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `dev_portal_team_id` | The short ID of your team in the developer portal, if you're in multiple teams. Different from your iTC team ID! | [*](#parameters-legend-dynamic)
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. This value will override the automatically detected provider short name. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column | 
  `wait_processing_interval` | Interval in seconds to wait for App Store Connect processing | `30`
  `wait_for_uploaded_build` | **DEPRECATED!** No longer needed with the transition over to the App Store Connect API - Use version info from uploaded ipa file to determine what build to use for distribution. If set to false, latest processing or any latest build will be used | `false`
  `reject_build_waiting_for_review` | Expire previous if it's 'waiting for review' | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action testflight
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run testflight
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run testflight parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/testflight.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
