<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_connect_api.rb
-->

# app_store_connect_api


Send one App Store Connect API request and return Apple's JSON response




> Calls any App Store Connect API endpoint, including those _spaceship_ has no model for. Uses the API key from `api_key`, `api_key_path` or an earlier `app_store_connect_api_key`, else the Apple ID session. The same request is available from the command line as `fastlane spaceship api`.


app_store_connect_api ||
---|---
Supported platforms | ios, mac
Author | @lacostej
Returns | A hash with the HTTP status code (:status), the response body as text (:body) and parsed (:json, {} when empty). With paginate, the pages merged into one response



## 3 Examples

```ruby
app_store_connect_api_key(key_id: "D383SF739", issuer_id: "6053b7fe-68a8-4acb-89be-165aa6465141", key_filepath: "./AuthKey_D383SF739.p8")
apps = app_store_connect_api(path: "/v1/apps?limit=200", paginate: true) # apps[:json]["data"] lists every app
```

```ruby
group = app_store_connect_api(
  path: "/v1/betaGroups/123",
  error_handlers: { 404 => proc { |result| UI.message("No such group") } }
)
```

```ruby
app_store_connect_api(
  http_method: "PATCH",
  path: "/v1/betaGroups/123",
  body: { data: { type: "betaGroups", id: "123", attributes: { name: "QA" } } },
  api_key_path: "fastlane/api_key.json"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `http_method` | The HTTP method: GET, POST, PATCH or DELETE | `GET`
  `path` | The request path with its query, e.g. /v1/apps?limit=200 | 
  `body` | The JSON request body, for POST and PATCH | 
  `paginate` | Follow links.next and return all pages as one response (GET only) | `false`
  `error_handlers` | Procs called with the result for error statuses, by status code or '*' for any other; without one, an error status fails the lane | `{}`
  `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | 
  `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | 
  `username` | Your Apple ID, when no API key is given. Defaults to the Appfile's apple_id | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action app_store_connect_api
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run app_store_connect_api
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run app_store_connect_api parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_connect_api.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
