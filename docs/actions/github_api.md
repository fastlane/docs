<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/github_api.rb
-->

# github_api


Call a GitHub API endpoint and get the resulting JSON response




> Calls any GitHub API endpoint. You must provide your GitHub Personal token (get one from https://github.com/settings/tokens/new).<br>          Out parameters provide the status code and the full response JSON if valid, otherwise the raw response body.<br>          Documentation: https://developer.github.com/v3


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
To show the documentation in your terminal, run
```no-highlight
fastlane action github_api
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/github_api.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
