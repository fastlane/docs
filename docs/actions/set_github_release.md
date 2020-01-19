<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_github_release.rb
-->

# set_github_release


This will create a new release on GitHub and upload assets for it




> Creates a new release on GitHub. You must provide your GitHub Personal token (get one from [https://github.com/settings/tokens/new](https://github.com/settings/tokens/new)), the repository name and tag name. By default, that's `master`.<br>If the tag doesn't exist, one will be created on the commit or branch passed in as commitish.<br>Out parameters provide the release's id, which can be used for later editing and the release HTML link to GitHub. You can also specify a list of assets to be uploaded to the release with the `:upload_assets` parameter.


set_github_release ||
---|---
Supported platforms | ios, android, mac
Author | @czechboy0, @tommeier
Returns | A hash containing all relevant information of this release<br>Access things like 'html_url', 'tag_name', 'name', 'body'



## 1 Example

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





## Parameters

Key | Description | Default
----|-------------|--------
  `repository_name` | The path to your repo, e.g. 'fastlane/fastlane' | 
  `server_url` | The server url. e.g. 'https://your.internal.github.host/api/v3' (Default: 'https://api.github.com') | `https://api.github.com`
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens | [*](#parameters-legend-dynamic)
  `tag_name` | Pass in the tag name | 
  `name` | Name of this release | 
  `commitish` | Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually master) | 
  `description` | Description of this release | [*](#parameters-legend-dynamic)
  `is_draft` | Whether the release should be marked as draft | `false`
  `is_prerelease` | Whether the release should be marked as prerelease | `false`
  `upload_assets` | Path to assets to be uploaded with the release | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `set_github_release` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::SET_GITHUB_RELEASE_HTML_LINK` | Link to your created release
  `SharedValues::SET_GITHUB_RELEASE_RELEASE_ID` | Release id (useful for subsequent editing)
  `SharedValues::SET_GITHUB_RELEASE_JSON` | The whole release JSON object

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action set_github_release
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_github_release
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_github_release parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_github_release.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
