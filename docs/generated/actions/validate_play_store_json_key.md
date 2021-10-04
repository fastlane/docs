<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/validate_play_store_json_key.rb
-->

# validate_play_store_json_key


Validate that the Google Play Store `json_key` works




> Use this action to test and validate your private key json key file used to connect and authenticate with the Google Play API


validate_play_store_json_key ||
---|---
Supported platforms | android
Author | @janpio



## 1 Example

```ruby
validate_play_store_json_key(
  json_key: 'path/to/you/json/key/file'
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `json_key` | The path to a file containing service account JSON, used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The raw service account JSON data used to authenticate with Google | [*](#parameters-legend-dynamic)
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/ | 
  `timeout` | Timeout for read, open, and send (in seconds) | `300`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action validate_play_store_json_key
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run validate_play_store_json_key
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run validate_play_store_json_key parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/validate_play_store_json_key.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
