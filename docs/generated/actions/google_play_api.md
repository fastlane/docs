<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/google_play_api.rb
-->

# google_play_api


Send one Google Play Developer API request and return Google's JSON response




> Calls any Google Play Developer API endpoint, including those _supply_ has no option for. Uses `json_key` or `json_key_data`, else Application Default Credentials. File uploads (APK, AAB, images) are not supported. The same request is available from the command line as `fastlane supply api`.


google_play_api ||
---|---
Supported platforms | android
Author | @lacostej
Returns | A hash with the HTTP status code (:status), the response body as text (:body) and parsed (:json, {} when empty). With paginate, the pages merged into one response



## 3 Examples

```ruby
reviews = google_play_api(path: "/androidpublisher/v3/applications/com.example/reviews", paginate: true, json_key: "play.json") # reviews[:json]["reviews"]
```

```ruby
google_play_api(
  path: "/androidpublisher/v3/applications/com.example/edits/123",
  json_key: "play.json",
  error_handlers: { 404 => proc { |result| UI.message("No such edit") } }
)
```

```ruby
edit = google_play_api(http_method: "POST", path: "/androidpublisher/v3/applications/com.example/edits", json_key: "play.json")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `http_method` | The HTTP method: GET, POST, PUT, PATCH or DELETE | `GET`
  `path` | The request path with its query, e.g. /androidpublisher/v3/applications/com.example/reviews | 
  `body` | The JSON request body, for POST, PUT and PATCH | 
  `paginate` | Follow the next page token and return all pages as one response (GET only) | `false`
  `error_handlers` | Procs called with the result for error statuses, by status code or '*' for any other; without one, an error status fails the lane | `{}`
  `json_key` | The path to a Google credentials JSON file (Application Default, Workload Identity, or Service Account), used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The raw content of a Google credentials JSON file, used to authenticate with Google | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action google_play_api
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run google_play_api
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run google_play_api parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/google_play_api.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
