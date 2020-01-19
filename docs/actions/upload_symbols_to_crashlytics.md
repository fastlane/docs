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
  `dsym_paths` | Paths to the DSYM files or zips to upload | 
  `api_token` | Crashlytics API Key | 
  `gsp_path` | Path to GoogleService-Info.plist | 
  `binary_path` | The path to the upload-symbols file of the Fabric app | 
  `platform` | The platform of the app (ios, appletvos, mac) | `ios`
  `dsym_worker_threads` | The number of threads to use for simultaneous dSYM upload | `1`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action upload_symbols_to_crashlytics
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_symbols_to_crashlytics
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_symbols_to_crashlytics parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_symbols_to_crashlytics.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
