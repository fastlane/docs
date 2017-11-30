<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# ensure_git_status_clean


Raises an exception if there are uncommitted git changes




> A sanity check to make sure you are working in a repo that is clean. Especially
useful to put at the beginning of your Fastfile in the `before_all` block, if
some of your other actions will touch your filesystem, do things to your git repo,
or just as a general reminder to save your work. Also needed as a prerequisite for
some other actions like `reset_git_repo`.


ensure_git_status_clean |
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic, @antondomashnev



## 1 Example

```ruby
ensure_git_status_clean
```





## Parameters

Key | Description
----|------------
  `show_uncommitted_changes` | The flag whether to show uncommitted changes if the repo is dirty




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_git_status_clean
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_git_status_clean.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
