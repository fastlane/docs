<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# last_git_commit


Return last git commit hash, abbreviated commit hash, commit message and author







last_git_commit |
-----|----
Supported platforms | ios, android, mac
Author | @ngutman
Returns | Returns the following dict: {commit_hash: "commit hash", abbreviated_commit_hash: "abbreviated commit hash" author: "Author", message: "commit message"}



**1 Example**

```ruby
commit = last_git_commit
crashlytics(notes: commit[:message]) # message of commit
author = commit[:author] # author of the commit
hash = commit[:commit_hash] # long sha of commit
short_hash = commit[:abbreviated_commit_hash] # short sha of commit
```





<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action last_git_commit
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/last_git_commit.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
