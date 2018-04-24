<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_github_release.rb
-->

# get_github_release


This will verify if a given release version is available on GitHub




> This will return all information about a release. For example:<br><br>              {"url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713",<br>                 "assets_url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713/assets",<br>                 "upload_url"=>"https://uploads.github.com/repos/KrauseFx/fastlane/releases/1537713/assets{?name}",<br>                 "html_url"=>"https://github.com/fastlane/fastlane/releases/tag/1.8.0",<br>                 "id"=>1537713,<br>                 "tag_name"=>"1.8.0",<br>                 "target_commitish"=>"master",<br>                 "name"=>"1.8.0 Switch Lanes & Pass Parameters",<br>                 "draft"=>false,<br>                 "author"=><br>                  {"login"=>"KrauseFx",<br>                   "id"=>869950,<br>                   "avatar_url"=>"https://avatars.githubusercontent.com/u/869950?v=3",<br>                   "gravatar_id"=>"",<br>                   "url"=>"https://api.github.com/users/KrauseFx",<br>                   "html_url"=>"https://github.com/fastlane",<br>                   "followers_url"=>"https://api.github.com/users/KrauseFx/followers",<br>                   "following_url"=>"https://api.github.com/users/KrauseFx/following{/other_user}",<br>                   "gists_url"=>"https://api.github.com/users/KrauseFx/gists{/gist_id}",<br>                   "starred_url"=>"https://api.github.com/users/KrauseFx/starred{/owner}{/repo}",<br>                   "subscriptions_url"=>"https://api.github.com/users/KrauseFx/subscriptions",<br>                   "organizations_url"=>"https://api.github.com/users/KrauseFx/orgs",<br>                   "repos_url"=>"https://api.github.com/users/KrauseFx/repos",<br>                   "events_url"=>"https://api.github.com/users/KrauseFx/events{/privacy}",<br>                   "received_events_url"=>"https://api.github.com/users/KrauseFx/received_events",<br>                   "type"=>"User",<br>                   "site_admin"=>false},<br>                 "prerelease"=>false,<br>                 "created_at"=>"2015-07-14T23:33:01Z",<br>                 "published_at"=>"2015-07-14T23:44:10Z",<br>                 "assets"=>[],<br>                 "tarball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/tarball/1.8.0",<br>                 "zipball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/zipball/1.8.0",<br>                 "body"=> ...Markdown...<br>                "This is one of the biggest updates of _fastlane_ yet"<br>              }


get_github_release ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx, @czechboy0, @jaleksynas, @tommeier



## 1 Example

```ruby
release = get_github_release(url: "fastlane/fastlane", version: "1.0.0")
puts release["name"]
```





## Parameters

Key | Description | Default
----|-------------|--------
  `url` | The path to your repo, e.g. 'KrauseFx/fastlane' | 
  `server_url` | The server url. e.g. 'https://your.github.server/api/v3' (Default: 'https://api.github.com') | `https://api.github.com`
  `version` | The version tag of the release to check | 
  `api_token` | GitHub Personal Token (required for private repositories) | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action get_github_release
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_github_release.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
