<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/google_play_track_version_codes.rb
-->

# google_play_track_version_codes


Retrieves version codes for a Google Play track




> More information: https://docs.fastlane.tools/actions/supply/


google_play_track_version_codes ||
---|---
Supported platforms | android
Author | @panthomakos
Returns | Array of integers representing the version codes for the given Google Play track



## 1 Example

```ruby
google_play_track_version_codes
```





## Parameters

Key | Description | Default
----|-------------|--------
  `package_name` | The package name of the application to use | [*](#parameters-legend-dynamic)
  `track` | The track of the application to use: production, beta, alpha, internal, rollout | `production`
  `key` | [DEPRECATED!] Use --json_key instead - The p12 File used to authenticate with Google | [*](#parameters-legend-dynamic)
  `issuer` | [DEPRECATED!] Use --json_key instead - The issuer of the p12 file (email address of the service account) | [*](#parameters-legend-dynamic)
  `json_key` | The path to a file containing service account JSON, used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The raw service account JSON data used to authenticate with Google | [*](#parameters-legend-dynamic)
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/ | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action google_play_track_version_codes
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/google_play_track_version_codes.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
