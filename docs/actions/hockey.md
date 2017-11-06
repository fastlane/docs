# hockey


Upload a new build to HockeyApp




> Symbols will also be uploaded automatically if a `app.dSYM.zip` file is found next to `app.ipa`. In case it is located in a different place you can specify the path explicitly in `:dsym` parameter.
More information about the available options can be found in the [HockeyApp Docs](http://support.hockeyapp.net/kb/api/api-versions#upload-version).


hockey |
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx, @modzelewski, @lacostej



**2 Examples**

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





**Parameters**

Key | Description
----|------------
  `apk` | Path to your APK file
  `api_token` | API Token for Hockey Access
  `ipa` | Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action. For Mac zip the .app. For Android provide path to .apk file. In addition you could use this to upload .msi, .zip, .pkg, etc if you use the 'create_update' mechanism
  `dsym` | Path to your symbols file. For iOS and Mac provide path to app.dSYM.zip. For Android provide path to mappings.txt file
  `create_update` | Set true if you want to create then update your app as opposed to just upload it. You will need the 'public_identifier', 'bundle_version' and 'bundle_short_version'
  `notes` | Beta Notes
  `notify` | Notify testers? "1" for yes
  `status` | Download status: "1" = No user can download; "2" = Available for download (only possible with full-access token)
  `create_status` | Download status for initial version creation when create_update is true: "1" = No user can download; "2" = Available for download (only possible with full-access token)
  `notes_type` | Notes type for your :notes, "0" = Textile, "1" = Markdown (default)
  `release_type` | Release type of the app: "0" = Beta (default), "1" = Store, "2" = Alpha, "3" = Enterprise
  `mandatory` | Set to "1" to make this update mandatory
  `teams` | Comma separated list of team ID numbers to which this build will be restricted
  `users` | Comma separated list of user ID numbers to which this build will be restricted
  `tags` | Comma separated list of tags which will receive access to the build
  `bundle_short_version` | The bundle_short_version of your application, required when using `create_update`
  `bundle_version` | The bundle_version of your application, required when using `create_update`
  `public_identifier` | App id of the app you are targeting, usually you won't need this value. Required, if `upload_dsym_only` set to `true`
  `commit_sha` | The Git commit SHA for this build
  `repository_url` | The URL of your source repository
  `build_server_url` | The URL of the build job on your build server
  `upload_dsym_only` | Flag to upload only the dSYM file to hockey app
  `owner_id` | ID for the owner of the app
  `strategy` | Strategy: 'add' = to add the build as a new build even if it has the same build number (default); 'replace' = to replace a build with the same build number
  `timeout` | Request timeout in seconds
  `bypass_cdn` | Flag to bypass Hockey CDN when it uploads successfully but reports error
  `dsa_signature` | DSA signature for sparkle updates for macOS




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action hockey
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hockey.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
