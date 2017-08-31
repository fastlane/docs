# google_play_track_version_codes


Retrieves version codes for a Google Play track




> More information: https://github.com/fastlane/fastlane/tree/master/supply


google_play_track_version_codes |
-----|----
Supported platforms | android
Author | @panthomakos
Returns | Array of integers representing the version codes for the given Google Play track



**1 Example**

```ruby
google_play_track_version_codes
```





**Parameters**

Key | Description
----|------------
  `package_name` | The package name of the application to use
  `track` | The track of the application to use: production, beta, alpha, rollout
  `key` | [DEPRECATED!] Use --json_key instead - The p12 File used to authenticate with Google
  `issuer` | [DEPRECATED!] Use --json_key instead - The issuer of the p12 file (email address of the service account)
  `json_key` | The service account json file used to authenticate with Google
  `json_key_data` | The service account json used to authenticate with Google
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action google_play_track_version_codes
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/google_play_track_version_codes.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
