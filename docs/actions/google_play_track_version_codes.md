<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/google_play_track_version_codes.rb
-->

# google_play_track_version_codes


Retrieves version codes for a Google Play track




> More information: [https://docs.fastlane.tools/actions/supply/](https://docs.fastlane.tools/actions/supply/)


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
  `track` | The track of the application to use. The default available tracks are: production, beta, alpha, internal, rollout | `production`
  `key` | **DEPRECATED!** Use `--json_key` instead - The p12 File used to authenticate with Google | [*](#parameters-legend-dynamic)
  `issuer` | **DEPRECATED!** Use `--json_key` instead - The issuer of the p12 file (email address of the service account) | [*](#parameters-legend-dynamic)
  `json_key` | The path to a file containing service account JSON, used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The raw service account JSON data used to authenticate with Google | [*](#parameters-legend-dynamic)
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/ | 
  `timeout` | Timeout for read, open, and send (in seconds) | `300`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action google_play_track_version_codes
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run google_play_track_version_codes
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run google_play_track_version_codes parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/google_play_track_version_codes.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
