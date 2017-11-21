<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# download_dsyms


Download dSYM files from Apple iTunes Connect for Bitcode apps




> This action downloads dSYM files from Apple iTunes Connect after
the ipa got re-compiled by Apple. Useful if you have Bitcode enabled
```ruby
lane :refresh_dsyms do
  download_dsyms                  # Download dSYM files from iTC
  upload_symbols_to_crashlytics   # Upload them to Crashlytics
  clean_build_artifacts           # Delete the local dSYM files
end
```


download_dsyms |
-----|----
Supported platforms | ios
Author | @KrauseFx



**2 Examples**

```ruby
download_dsyms
```

```ruby
download_dsyms(version: "1.0.0", build_number: "345")
```





**Parameters**

Key | Description
----|------------
  `username` | Your Apple ID Username for iTunes Connect
  `app_identifier` | The bundle identifier of your app
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `team_name` | The name of your iTunes Connect team if you're in multiple teams
  `platform` | The app platform for dSYMs you wish to download
  `version` | The app version for dSYMs you wish to download, pass in 'latest' to download only the latest build's dSYMs
  `build_number` | The app build_number for dSYMs you wish to download
  `output_directory` | Where to save the download dSYMs, defaults to the current path




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action download_dsyms
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/download_dsyms.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
