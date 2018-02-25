<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# number_of_commits


Return the number of commits in current git branch




> You can use this action to get the number of commits of this branch. This is useful if you want to set the build number to the number of commits. See `fastlane actions number_of_commits` for more details


number_of_commits |
-----|----
Supported platforms | ios, android, mac
Author | @onevcat, @samuelbeek
Returns | The total number of all commits in current git branch



## 2 Examples

```ruby
increment_build_number(build_number: number_of_commits)
```

```ruby
build_number = number_of_commits(all: true)
increment_build_number(build_number: number_of_commits)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `all` | Returns number of all commits instead of current branch | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action number_of_commits
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/number_of_commits.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
