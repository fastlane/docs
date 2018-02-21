<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# create_pull_request


This will create a new pull request on GitHub







create_pull_request |
-----|----
Supported platforms | ios, android, mac
Author | @seei, @tommeier
Returns | The parsed JSON when successful



## 1 Example

```ruby
create_pull_request(
  api_token: ENV["GITHUB_TOKEN"],
  repo: "fastlane/fastlane",
  title: "Amazing new feature",
  head: "my-feature",       # optional, defaults to current branch name
  base: "master", # optional, defaults to "master"
  body: "Please pull this in!",       # optional
  api_url: "http://yourdomain/api/v3" # optional, for GitHub Enterprise, defaults to "https://api.github.com"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens | *
  `repo` | The name of the repository you want to submit the pull request to | -
  `title` | The title of the pull request | -
  `body` | The contents of the pull request | -
  `head` | The name of the branch where your changes are implemented (defaults to the current branch name) | *
  `base` | The name of the branch you want your changes pulled into (defaults to `master`) | master
  `api_url` | The URL of GitHub API - used when the Enterprise (default to `https://api.github.com`) | https://api.github.com

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action create_pull_request
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_pull_request.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
