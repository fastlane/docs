<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# set_github_release


This will create a new release on GitHub and upload assets for it




> Creates a new release on GitHub. You must provide your GitHub Personal token
        (get one from https://github.com/settings/tokens/new), the repository name
        and tag name. By default that's 'master'. If the tag doesn't exist, one will be created on the commit or branch passed-in as
        commitish. Out parameters provide the release's id, which can be used for later editing and the
        release html link to GitHub. You can also specify a list of assets to be uploaded to the release with the upload_assets parameter.


set_github_release |
-----|----
Supported platforms | ios, android, mac
Author | @czechboy0, @tommeier
Returns | A hash containing all relevant information of this release
Access things like 'html_url', 'tag_name', 'name', 'body'



**1 Example**

```ruby
github_release = set_github_release(
  repository_name: "fastlane/fastlane",
  api_token: ENV["GITHUB_TOKEN"],
  name: "Super New actions",
  tag_name: "v1.22.0",
  description: (File.read("changelog") rescue "No changelog provided"),
  commitish: "master",
  upload_assets: ["example_integration.ipa", "./pkg/built.gem"]
)
```





**Parameters**

Key | Description
----|------------
  `repository_name` | The path to your repo, e.g. 'fastlane/fastlane'
  `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com')
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens
  `tag_name` | Pass in the tag name
  `name` | Name of this release
  `commitish` | Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually master)
  `description` | Description of this release
  `is_draft` | Whether the release should be marked as draft
  `is_prerelease` | Whether the release should be marked as prerelease
  `upload_assets` | Path to assets to be uploaded with the release




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action set_github_release
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_github_release.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
