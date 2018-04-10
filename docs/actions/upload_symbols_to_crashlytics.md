<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_symbols_to_crashlytics.rb
-->

# upload_symbols_to_crashlytics


Upload dSYM symbolication files to Crashlytics




> This action allows you to upload symbolication files to Crashlytics. It's extra useful if you use it to download the latest dSYM files from Apple when you use Bitcode. This action will not fail the build if one of the uploads failed. The reason for that is that sometimes some of dSYM files are invalid, and we don't want them to fail the complete build.


upload_symbols_to_crashlytics ||
---|---
Supported platforms | ios
Author | @KrauseFx



## 1 Example

```ruby
upload_symbols_to_crashlytics(dsym_path: "./App.dSYM.zip")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `dsym_path` | Path to the DSYM file or zip to upload | [*](#parameters-legend-dynamic)
  `api_token` | Crashlytics API Key | 
  `gsp_path` | Path to GoogleService-Info.plist | 
  `binary_path` | The path to the upload-symbols file of the Fabric app | 
  `platform` | The platform of the app (ios, appletvos, mac) | `ios`
  `dsym_worker_threads` | The number of threads to use for simultaneous dSYM upload | `1`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action upload_symbols_to_crashlytics
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_symbols_to_crashlytics.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
