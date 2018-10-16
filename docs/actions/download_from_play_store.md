<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/download_from_play_store.rb
-->

# download_from_play_store


Download metadata and binaries from Google Play (via _supply_)




> More information: https://docs.fastlane.tools/actions/download_from_play_store/


download_from_play_store ||
---|---
Supported platforms | android
Author | @janpio



## 1 Example

```ruby
download_from_play_store
```





## Parameters

Key | Description | Default
----|-------------|--------
  `package_name` | The package name of the application to use | [*](#parameters-legend-dynamic)
  `metadata_path` | Path to the directory containing the metadata files | [*](#parameters-legend-dynamic)
  `key` | **DEPRECATED!** Use `--json_key` instead - The p12 File used to authenticate with Google | [*](#parameters-legend-dynamic)
  `issuer` | **DEPRECATED!** Use `--json_key` instead - The issuer of the p12 file (email address of the service account) | [*](#parameters-legend-dynamic)
  `json_key` | The path to a file containing service account JSON, used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The raw service account JSON data used to authenticate with Google | [*](#parameters-legend-dynamic)
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/ | 
  `timeout` | Timeout for read, open, and send (in seconds) | `300`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action download_from_play_store
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/download_from_play_store.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
