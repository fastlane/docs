<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# upload_to_play_store


Upload metadata, screenshots and binaries to Google Play (via `supply`)




> More information: https://github.com/fastlane/fastlane/tree/master/supply


upload_to_play_store |
-----|----
Supported platforms | android
Author | @KrauseFx



## 2 Examples

```ruby
upload_to_play_store
```

```ruby
supply # alias for "upload_to_play_store"
```





## Parameters

Key | Description
----|------------
  `package_name` | The package name of the application to use
  `track` | The track of the application to use: production, beta, alpha, rollout
  `rollout` | The percentage of the user fraction when uploading to the rollout track
  `metadata_path` | Path to the directory containing the metadata files
  `key` | [DEPRECATED!] Use --json_key instead - The p12 File used to authenticate with Google
  `issuer` | [DEPRECATED!] Use --json_key instead - The issuer of the p12 file (email address of the service account)
  `json_key` | The service account json file used to authenticate with Google
  `json_key_data` | The service account json used to authenticate with Google
  `apk` | Path to the APK file to upload
  `apk_paths` | An array of paths to APK files to upload
  `skip_upload_apk` | Whether to skip uploading APK
  `skip_upload_metadata` | Whether to skip uploading metadata
  `skip_upload_images` | Whether to skip uploading images, screenshots not included
  `skip_upload_screenshots` | Whether to skip uploading SCREENSHOTS
  `track_promote_to` | The track to promote to: production, beta, alpha, rollout
  `validate_only` | Only validate changes with Google Play rather than actually publish
  `mapping` | Path to the mapping file to upload
  `mapping_paths` | An array of paths to mapping files to upload
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/
  `check_superseded_tracks` | Check the other tracks for superseded versions and disable them




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action upload_to_play_store
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_to_play_store.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
