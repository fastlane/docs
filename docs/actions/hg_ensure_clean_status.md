# hg_ensure_clean_status


Raises an exception if there are uncommitted hg changes




> Along the same lines as the [`ensure_git_status_clean`](#ensure_git_status_clean) action, this is a sanity check to ensure the working mercurial repo is clean. Especially useful to put at the beginning of your Fastfile in the `before_all` block.


hg_ensure_clean_status |
-----|----
Supported platforms | ios, android, mac
Author | @sjrmanning



**1 Example**

```ruby
hg_ensure_clean_status
```





<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action hg_ensure_clean_status
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_ensure_clean_status.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
