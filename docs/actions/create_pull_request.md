<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_pull_request.rb
-->

# create_pull_request


This will create a new pull request on GitHub







create_pull_request ||
---|---
Supported platforms | ios, android, mac
Author | @seei, @tommeier, @marumemomo
Returns | The pull request URL when successful



## 1 Example

```ruby
create_pull_request(
  api_token: "secret",      # optional, defaults to ENV["GITHUB_API_TOKEN"]
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
  `api_token` | Personal API Token for GitHub - generate one at https://github.com/settings/tokens | [*](#parameters-legend-dynamic)
  `repo` | The name of the repository you want to submit the pull request to | 
  `title` | The title of the pull request | 
  `body` | The contents of the pull request | 
  `labels` | The labels for the pull request | 
  `head` | The name of the branch where your changes are implemented (defaults to the current branch name) | [*](#parameters-legend-dynamic)
  `base` | The name of the branch you want your changes pulled into (defaults to `master`) | `master`
  `api_url` | The URL of GitHub API - used when the Enterprise (default to `https://api.github.com`) | `https://api.github.com`
  `assignees` | The assignees for the pull request | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_pull_request` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::CREATE_PULL_REQUEST_HTML_URL` | The HTML URL to the created pull request

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action create_pull_request
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_pull_request
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_pull_request parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_pull_request.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
