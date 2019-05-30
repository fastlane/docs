<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_github_release.rb
-->

# get_github_release


This will verify if a given release version is available on GitHub




> This will return all information about a release. For example:

```no-highlight
{
  "url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713",
   "assets_url"=>"https://api.github.com/repos/KrauseFx/fastlane/releases/1537713/assets",
   "upload_url"=>"https://uploads.github.com/repos/KrauseFx/fastlane/releases/1537713/assets{?name}",
   "html_url"=>"https://github.com/fastlane/fastlane/releases/tag/1.8.0",
   "id"=>1537713,
   "tag_name"=>"1.8.0",
   "target_commitish"=>"master",
   "name"=>"1.8.0 Switch Lanes & Pass Parameters",
   "draft"=>false,
   "author"=>
    {"login"=>"KrauseFx",
     "id"=>869950,
     "avatar_url"=>"https://avatars.githubusercontent.com/u/869950?v=3",
     "gravatar_id"=>"",
     "url"=>"https://api.github.com/users/KrauseFx",
     "html_url"=>"https://github.com/fastlane",
     "followers_url"=>"https://api.github.com/users/KrauseFx/followers",
     "following_url"=>"https://api.github.com/users/KrauseFx/following{/other_user}",
     "gists_url"=>"https://api.github.com/users/KrauseFx/gists{/gist_id}",
     "starred_url"=>"https://api.github.com/users/KrauseFx/starred{/owner}{/repo}",
     "subscriptions_url"=>"https://api.github.com/users/KrauseFx/subscriptions",
     "organizations_url"=>"https://api.github.com/users/KrauseFx/orgs",
     "repos_url"=>"https://api.github.com/users/KrauseFx/repos",
     "events_url"=>"https://api.github.com/users/KrauseFx/events{/privacy}",
     "received_events_url"=>"https://api.github.com/users/KrauseFx/received_events",
     "type"=>"User",
     "site_admin"=>false},
   "prerelease"=>false,
   "created_at"=>"2015-07-14T23:33:01Z",
   "published_at"=>"2015-07-14T23:44:10Z",
   "assets"=>[],
   "tarball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/tarball/1.8.0",
   "zipball_url"=>"https://api.github.com/repos/KrauseFx/fastlane/zipball/1.8.0",
   "body"=> ...Markdown...
  "This is one of the biggest updates of _fastlane_ yet"
}
```
>


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



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_github_release` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::GET_GITHUB_RELEASE_INFO` | Contains all the information about this release

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action get_github_release
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_github_release
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_github_release parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_github_release.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
