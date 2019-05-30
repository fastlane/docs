<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/push_to_git_remote.rb
-->

# push_to_git_remote


Push local changes to the remote branch




> Lets you push your local commits to a remote git repo. Useful if you make local changes such as adding a version bump commit (using `commit_version_bump`) or a git tag (using 'add_git_tag') on a CI server, and you want to push those changes back to your canonical/main repo.<br>If this is a new branch, use the `set_upstream` option to set the remote branch as upstream.


push_to_git_remote ||
---|---
Supported platforms | ios, android, mac
Author | @lmirosevic



## 2 Examples

```ruby
push_to_git_remote # simple version. pushes "master" branch to "origin" remote
```

```ruby
push_to_git_remote(
  remote: "origin",         # optional, default: "origin"
  local_branch: "develop",  # optional, aliased by "branch", default is set to current branch
  remote_branch: "develop", # optional, default is set to local_branch
  force: true,    # optional, default: false
  force_with_lease: true,   # optional, default: false
  tags: false,    # optional, default: true
  no_verify: true,# optional, default: false
  set_upstream: true        # optional, default: false
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `local_branch` | The local branch to push from. Defaults to the current branch | [*](#parameters-legend-dynamic)
  `remote_branch` | The remote branch to push to. Defaults to the local branch | [*](#parameters-legend-dynamic)
  `force` | Force push to remote | `false`
  `force_with_lease` | Force push with lease to remote | `false`
  `tags` | Whether tags are pushed to remote | `true`
  `remote` | The remote to push to | `origin`
  `no_verify` | Whether or not to use --no-verify | `false`
  `set_upstream` | Whether or not to use --set-upstream | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action push_to_git_remote
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run push_to_git_remote
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run push_to_git_remote parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/push_to_git_remote.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
