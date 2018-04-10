<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/danger.rb
-->

# danger


Runs `danger` for the project




> Formalize your Pull Request etiquette.
More information: https://github.com/danger/danger


danger ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 2 Examples

```ruby
danger
```

```ruby
danger(
  danger_id: "unit-tests",
  dangerfile: "tests/MyOtherDangerFile",
  github_api_token: ENV["GITHUB_API_TOKEN"],
  verbose: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true`
  `verbose` | Show more debugging information | `false`
  `danger_id` | The identifier of this Danger instance | 
  `dangerfile` | The location of your Dangerfile | 
  `github_api_token` | GitHub API token for danger | 
  `fail_on_errors` | Should always fail the build process, defaults to false | `false`
  `new_comment` | Makes Danger post a new comment instead of editing its previous one | `false`
  `base` | A branch/tag/commit to use as the base of the diff. [master|dev|stable] | 
  `head` | A branch/tag/commit to use as the head. [master|dev|stable] | 
  `pr` | Run danger on a specific pull request. e.g. "https://github.com/danger/danger/pull/518" | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action danger
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/danger.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
