# pilot


Upload a new binary to iTunes Connect for TestFlight beta testing




<p align="center">
  <img src="assets/PilotTextTransparentSmall.png" width="500">
</p>

###### The best way to manage your TestFlight testers and builds from your terminal

Pilot makes it easier to manage your app on Apple’s TestFlight. You can:

- Upload & distribute builds
- Add & remove testers
- Retrieve information about testers & devices
- Import/export all available testers

`pilot` uses [spaceship.airforce](https://spaceship.airforce) to interact with iTunes Connect :rocket:

-------

<p align="center">
    <a href="#usage">Usage</a> &bull;
    <a href="#tips">Tips</a>
</p>

-------

<h5 align="center"><code>pilot</code> is part of <a href="https://fastlane.tools">fastlane</a>: The easiest way to automate beta deployments and releases for your iOS and Android apps.</h5>

# Usage

For all commands you can specify the Apple ID to use using `-u felix@krausefx.com`. If you execute `pilot` in a project already using [fastlane](https://fastlane.tools) the username and app identifier will automatically be determined.

## Uploading builds

To upload a new build, just run

```
fastlane pilot upload
```

This will automatically look for an `ipa` in your current directory and tries to fetch the login credentials from your [fastlane setup](https://fastlane.tools).

You'll be asked for any missing information. Additionally, you can pass all kinds of parameters:

```
fastlane pilot --help
```

You can pass a changelog using

```
fastlane pilot upload --changelog "Something that is new here"
```

You can also skip the submission of the binary, which means, the `ipa` file will only be uploaded and not distributed to testers:

```
fastlane pilot upload --skip_submission
```

`pilot` does all kinds of magic for you:

- Automatically detects the bundle identifier from your `ipa` file
- Automatically fetch the AppID of your app based on the bundle identifier

`pilot` uses [spaceship](https://spaceship.airforce) to submit the build metadata and the iTunes Transporter to upload the binary. Because iTunes Transporter's upload capability is only supported on OS X, `pilot upload` does not work on Linux, as described [in this issue](https://github.com/fastlane/fastlane/issues/5789)

## List builds

To list all builds for specific application use

```
fastlane pilot builds
```

The result lists all active builds and processing builds:

```
+-----------+---------+----------+----------+----------+
|                   Great App Builds                   |
+-----------+---------+----------+----------+----------+
| Version # | Build # | Testing  | Installs | Sessions |
+-----------+---------+----------+----------+----------+
| 0.9.13    | 1       | Expired  | 1        | 0        |
| 0.9.13    | 2       | Expired  | 0        | 0        |
| 0.9.20    | 3       | Expired  | 0        | 0        |
| 0.9.20    | 4       | Internal | 5        | 3        |
+-----------+---------+----------+----------+----------+
```

## Managing beta testers

### List of Testers

This command will list all your testers, both internal and external.

```
fastlane pilot list
```

The output will look like this:

```
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

To add a new tester to both your iTunes Connect account and to your app (if given), use the `pilot add` command. This will create a new tester (if necessary) or add an existing tester to the app to test.

```
fastlane pilot add email@invite.com
```

Additionally you can specify the app identifier (if necessary):

```
fastlane pilot add email@email.com -a com.krausefx.app
```

### Find a tester

To find a specific tester use

```
fastlane pilot find felix@krausefx.com
```

The resulting output will look like this:

```
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

```
fastlane pilot remove felix@krausefx.com
```

### Export testers

To export all external testers to a CSV file. Useful if you need to import tester info to another system or a new account.

```
fastlane pilot export
```

### Import testers

Add external testers from a CSV file. Sample CSV file available [here](https://itunesconnect.apple.com/itc/docs/tester_import.csv).

```
fastlane pilot import
```

You can also specify the directory using

```
fastlane pilot export -c ~/Desktop/testers.csv
fastlane pilot import -c ~/Desktop/testers.csv
 ```

# Tips

## Debug information

If you run into any issues you can use the `verbose` mode to get a more detailed output:

    fastlane pilot upload --verbose

## Firewall Issues

`pilot` uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol from the command line using

```
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" pilot ...
```

If you are using `pilot` via the [fastlane action](https://docs.fastlane.tools/actions#pilot), add the following to your `Fastfile`

```
ENV["DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS"] = "-t DAV"
pilot...
```

## Credentials Issues

If your password contains special characters, `pilot` may throw a confusing error saying your "Your Apple ID or password was entered incorrectly". The easiest way to fix this error is to change your password to something that **does not** contains special characters.

## How is my password stored?

`pilot` uses the [CredentialsManager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) from `fastlane`.

<hr />


pilot |
-----|----
Supported platforms | ios
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
