<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/commit_github_file.rb
-->

# commit_github_file


This will commit a file directly on GitHub via the API




> Commits a file directly to GitHub. You must provide your GitHub Personal token
        (get one from https://github.com/settings/tokens/new), the repository name and the relative file path from the root git project.
        Out parameters provide the commit sha created, which can be used for later usage for examples such as releases, the direct download link and the full response JSON.
        Documentation: https://developer.github.com/v3/repos/contents/#create-a-file


commit_github_file |
-----|----
Supported platforms | ios, android, mac
Author | @tommeier
Returns | A hash containing all relevant information for this commit
Access things like 'html_url', 'sha', 'message'



## 1 Example

```ruby
response = commit_github_file(
  repository_name: "fastlane/fastlane",
  server_url: "https://api.github.com",
  api_token: ENV["GITHUB_TOKEN"],
  message: "Add my new file",
  branch: "master",
  path: "assets/my_new_file.xcarchive"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `repository_name` | The path to your repo, e.g. 'fastlane/fastlane' | 
  `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com') | `https://api.github.com`
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens | [*](#parameters-legend-dynamic)
  `branch` | The branch that the file should be committed on (default: master) | `master`
  `path` | The relative path to your file from project root e.g. assets/my_app.xcarchive | 
  `message` | The commit message. Defaults to the file name | [*](#parameters-legend-dynamic)
  `secure` | Optionally disable secure requests (ssl_verify_peer) | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action commit_github_file
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/commit_github_file.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
