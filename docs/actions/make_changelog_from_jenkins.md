<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/make_changelog_from_jenkins.rb
-->

# make_changelog_from_jenkins


Generate a changelog using the Changes section from the current Jenkins build




> This is useful when deploying automated builds. The changelog from Jenkins lists all the commit messages since the last build.


make_changelog_from_jenkins |
-----|----
Supported platforms | ios, android, mac
Author | @mandrizzle



## 1 Example

```ruby
make_changelog_from_jenkins(
  # Optional, lets you set a changelog in the case is not generated on Jenkins or if ran outside of Jenkins
  fallback_changelog: "Bug fixes and performance enhancements"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `fallback_changelog` | Fallback changelog if there is not one on Jenkins, or it couldn't be read | `''`
  `include_commit_body` | Include the commit body along with the summary | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action make_changelog_from_jenkins
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/make_changelog_from_jenkins.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
