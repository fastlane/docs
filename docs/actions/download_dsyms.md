<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/download_dsyms.rb
-->

# download_dsyms


Download dSYM files from App Store Connect for Bitcode apps




> This action downloads dSYM files from App Store Connect after the ipa gets re-compiled by Apple. Useful if you have Bitcode enabled.

```ruby
lane :refresh_dsyms do
  download_dsyms                  # Download dSYM files from iTC
  upload_symbols_to_crashlytics   # Upload them to Crashlytics
  clean_build_artifacts           # Delete the local dSYM files
end
```
>


download_dsyms ||
---|---
Supported platforms | ios
Author | @KrauseFx



## 3 Examples

```ruby
download_dsyms
```

```ruby
download_dsyms(version: "1.0.0", build_number: "345")
```

```ruby
download_dsyms(min_version: "1.2.3")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `username` | Your Apple ID Username for App Store Connect | [*](#parameters-legend-dynamic)
  `app_identifier` | The bundle identifier of your app | [*](#parameters-legend-dynamic)
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `platform` | The app platform for dSYMs you wish to download (ios, appletvos) | `:ios`
  `version` | The app version for dSYMs you wish to download, pass in 'latest' to download only the latest build's dSYMs | 
  `build_number` | The app build_number for dSYMs you wish to download | 
  `min_version` | The minimum app version for dSYMs you wish to download | 
  `output_directory` | Where to save the download dSYMs, defaults to the current path | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `download_dsyms` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::DSYM_PATHS` | An array to all the zipped dSYM files

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action download_dsyms
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run download_dsyms
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run download_dsyms parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/download_dsyms.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
