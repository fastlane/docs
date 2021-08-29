<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_to_play_store_internal_app_sharing.rb
-->

# upload_to_play_store_internal_app_sharing


Upload binaries to Google Play Internal App Sharing (via _supply_)




> More information: https://docs.fastlane.tools/actions/upload_to_play_store_internal_app_sharing/


upload_to_play_store_internal_app_sharing ||
---|---
Supported platforms | android
Author | @andrewhavens
Returns | Returns a string containing the download URL for the uploaded APK/AAB (or array of strings if multiple were uploaded).



## 1 Example

```ruby
upload_to_play_store_internal_app_sharing
```





## Parameters

Key | Description | Default
----|-------------|--------
  `package_name` | The package name of the application to use | [*](#parameters-legend-dynamic)
  `json_key` | The path to a file containing service account JSON, used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The raw service account JSON data used to authenticate with Google | [*](#parameters-legend-dynamic)
  `apk` | Path to the APK file to upload | [*](#parameters-legend-dynamic)
  `apk_paths` | An array of paths to APK files to upload | 
  `aab` | Path to the AAB file to upload | [*](#parameters-legend-dynamic)
  `aab_paths` | An array of paths to AAB files to upload | 
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/ | 
  `timeout` | Timeout for read, open, and send (in seconds) | `300`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action upload_to_play_store_internal_app_sharing
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_to_play_store_internal_app_sharing
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_to_play_store_internal_app_sharing parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_to_play_store_internal_app_sharing.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
