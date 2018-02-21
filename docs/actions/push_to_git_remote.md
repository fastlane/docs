<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# push_to_git_remote


Push local changes to the remote branch




> Lets you push your local commits to a remote git repo. Useful if you make local changes such as adding a version bump commit (using `commit_version_bump`) or a git tag (using 'add_git_tag') on a CI server, and you want to push those changes back to your canonical/main repo.


push_to_git_remote |
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic



## 2 Examples

```ruby
push_to_git_remote # simple version. pushes "master" branch to "origin" remote
```

```ruby
push_to_git_remote(
  remote: "origin",         # optional, default: "origin"
  local_branch: "develop",  # optional, aliased by "branch", default: "master"
  remote_branch: "develop", # optional, default is set to local_branch
  force: true,    # optional, default: false
  tags: false     # optional, default: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `local_branch` | The local branch to push from. Defaults to the current branch | -
  `remote_branch` | The remote branch to push to. Defaults to the local branch | -
  `force` | Force push to remote. Defaults to false | false
  `tags` | Whether tags are pushed to remote. Defaults to true | true
  `remote` | The remote to push to. Defaults to `origin` | origin

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action push_to_git_remote
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/push_to_git_remote.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
