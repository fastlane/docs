# hg_push


This will push changes to the remote hg repository




> The mercurial equivalent of [`push_to_git_remote`](#push_to_git_remote) — pushes your local commits to a remote mercurial repo. Useful when local changes such as adding a version bump commit or adding a tag are part of your lane’s actions.


hg_push |
-----|----
Supported platforms | ios, android, mac
Author | @sjrmanning



**2 Examples**

```ruby
hg_push
```

```ruby
hg_push(
  destination: "ssh://hg@repohost.com/owner/repo",
  force: true
)
```





**Parameters**

Key | Description
----|------------
  `force` | Force push to remote. Defaults to false
  `destination` | The destination to push to




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action hg_push
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_push.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
