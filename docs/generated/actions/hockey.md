<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hockey.rb
-->

# hockey


Refer to [App Center](https://github.com/Microsoft/fastlane-plugin-appcenter/)

> HockeyApp will be no longer supported and will be transitioned into App Center on November 16, 2019.<br>Please migrate over to [App Center](https://github.com/Microsoft/fastlane-plugin-appcenter/)


> HockeyApp will be no longer supported and will be transitioned into App Center on November 16, 2019.<br>Please migrate over to [App Center](https://github.com/Microsoft/fastlane-plugin-appcenter/)<br><br>Symbols will also be uploaded automatically if a `app.dSYM.zip` file is found next to `app.ipa`. In case it is located in a different place you can specify the path explicitly in the `:dsym` parameter.<br>More information about the available options can be found in the [HockeyApp Docs](http://support.hockeyapp.net/kb/api/api-versions#upload-version).


hockey ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx, @modzelewski, @lacostej



## 3 Examples

```ruby
hockey(
  api_token: "...",
  ipa: "./app.ipa",
  notes: "Changelog"
)
```

```ruby
hockey(
  api_token: "...",
  create_update: true,
  public_identifier: "....",
  bundle_short_version: "1.0.2",
  bundle_version: "1.0.2.145",
  ipa: "./my.msi",
  notes: "Changelog"
)
```

```ruby
# You can bypass the CDN if you are uploading to Hockey and receive an SSL error (which can happen on corporate firewalls)
hockey(
  api_token: "...",
  ipa: "./app.ipa",
  notes: "Changelog",
  bypass_cdn: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `apk` | Path to your APK file | [*](#parameters-legend-dynamic)
  `api_token` | API Token for Hockey Access | 
  `ipa` | Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action. For Mac zip the .app. For Android provide path to .apk file. In addition you could use this to upload .msi, .zip, .pkg, etc if you use the 'create_update' mechanism | [*](#parameters-legend-dynamic)
  `dsym` | Path to your symbols file. For iOS and Mac provide path to app.dSYM.zip. For Android provide path to mappings.txt file | [*](#parameters-legend-dynamic)
  `create_update` | Set true if you want to create then update your app as opposed to just upload it. You will need the 'public_identifier', 'bundle_version' and 'bundle_short_version' | `false`
  `notes` | Beta Notes | [*](#parameters-legend-dynamic)
  `notify` | Notify testers? "1" for yes | `1`
  `status` | Download status: "1" = No user can download; "2" = Available for download (only possible with full-access token) | `2`
  `create_status` | Download status for initial version creation when create_update is true: "1" = No user can download; "2" = Available for download (only possible with full-access token) | `2`
  `notes_type` | Notes type for your :notes, "0" = Textile, "1" = Markdown (default) | `1`
  `release_type` | Release type of the app: "0" = Beta (default), "1" = Store, "2" = Alpha, "3" = Enterprise | `0`
  `mandatory` | Set to "1" to make this update mandatory | `0`
  `teams` | Comma separated list of team ID numbers to which this build will be restricted | 
  `users` | Comma separated list of user ID numbers to which this build will be restricted | 
  `tags` | Comma separated list of tags which will receive access to the build | 
  `bundle_short_version` | The bundle_short_version of your application, required when using `create_update` | 
  `bundle_version` | The bundle_version of your application, required when using `create_update` | 
  `public_identifier` | App id of the app you are targeting, usually you won't need this value. Required, if `upload_dsym_only` set to `true` | 
  `commit_sha` | The Git commit SHA for this build | 
  `repository_url` | The URL of your source repository | 
  `build_server_url` | The URL of the build job on your build server | 
  `upload_dsym_only` | Flag to upload only the dSYM file to hockey app | `false`
  `owner_id` | ID for the owner of the app | 
  `strategy` | Strategy: 'add' = to add the build as a new build even if it has the same build number (default); 'replace' = to replace a build with the same build number | `add`
  `timeout` | Request timeout in seconds | 
  `bypass_cdn` | Flag to bypass Hockey CDN when it uploads successfully but reports error | `false`
  `dsa_signature` | DSA signature for sparkle updates for macOS | `''`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `hockey` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::HOCKEY_DOWNLOAD_LINK` | The newly generated download link for this build
  `SharedValues::HOCKEY_BUILD_INFORMATION` | contains all keys/values from the HockeyApp API, like :title, :bundle_identifier

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action hockey
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hockey
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hockey parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hockey.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
