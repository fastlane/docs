<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/github_api.rb
-->

# github_api


Call a GitHub API endpoint and get the resulting JSON response




> Calls any GitHub API endpoint. You must provide your GitHub Personal token (get one from [https://github.com/settings/tokens/new](https://github.com/settings/tokens/new)).<br>Out parameters provide the status code and the full response JSON if valid, otherwise the raw response body.<br>Documentation: [https://developer.github.com/v3](https://developer.github.com/v3).


github_api ||
---|---
Supported platforms | ios, android, mac
Author | @tommeier
Returns | A hash including the HTTP status code (:status), the response body (:body), and if valid JSON has been returned the parsed JSON (:json).



## 2 Examples

```ruby
result = github_api(
  server_url: "https://api.github.com",
  api_token: ENV["GITHUB_TOKEN"],
  http_method: "GET",
  path: "/repos/:owner/:repo/readme",
  body: { ref: "master" }
)
```

```ruby
# Alternatively call directly with optional error handling or block usage
  GithubApiAction.run(
    server_url: "https://api.github.com",
    api_token: ENV["GITHUB_TOKEN"],
    http_method: "GET",
    path: "/repos/:owner/:repo/readme",
    error_handlers: {
      404 => proc do |result|
        UI.message("Something went wrong - I couldn't find it...")
      end,
      '*' => proc do |result|
        UI.message("Handle all error codes other than 404")
      end
    }
  ) do |result|
    UI.message("JSON returned: #{result[:json]}")
  end

```





## Parameters

Key | Description | Default
----|-------------|--------
  `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com') | `https://api.github.com`
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens | [*](#parameters-legend-dynamic)
  `http_method` | The HTTP method. e.g. GET / POST | `GET`
  `body` | The request body in JSON or hash format | `{}`
  `raw_body` | The request body taken vertabim instead of as JSON, useful for file uploads | 
  `path` | The endpoint path. e.g. '/repos/:owner/:repo/readme' | 
  `url` | The complete full url - used instead of path. e.g. 'https://uploads.github.com/repos/fastlane...' | 
  `error_handlers` | Optional error handling hash based on status code, or pass '*' to handle all errors | `{}`
  `headers` | Optional headers to apply | `{}`
  `secure` | Optionally disable secure requests (ssl_verify_peer) | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `github_api` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::GITHUB_API_STATUS_CODE` | The status code returned from the request
  `SharedValues::GITHUB_API_RESPONSE` | The full response body
  `SharedValues::GITHUB_API_JSON` | The parsed json returned from GitHub

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action github_api
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run github_api
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run github_api parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/github_api.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
