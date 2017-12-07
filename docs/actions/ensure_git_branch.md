<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# ensure_git_branch


Raises an exception if not on a specific git branch




> This action will check if your git repo is checked out to a specific branch.
You may only want to make releases from a specific branch, so `ensure_git_branch`
will stop a lane if it was accidentally executed on an incorrect branch.


ensure_git_branch |
-----|----
Supported platforms | ios, android, mac
Author | @dbachrach, @Liquidsoul



## 2 Examples

```ruby
ensure_git_branch # defaults to `master` branch
```

```ruby
ensure_git_branch(
  branch: 'develop'
)
```





## Parameters

Key | Description
----|------------
  `branch` | The branch that should be checked for. String that can be either the full name of the branch or a regex to match




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_git_branch
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_git_branch.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
