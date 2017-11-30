<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# import_from_git


Import another Fastfile from a remote git repository to use its lanes




> This is useful if you have shared lanes across multiple apps and you want to store the Fastfile
in a remote git repository.


import_from_git |
-----|----
Supported platforms | ios, android, mac
Author | @fabiomassimo, @KrauseFx, @Liquidsoul



## 1 Example

```ruby
import_from_git(
  url: "git@github.com:fastlane/fastlane.git", # The URL of the repository to import the Fastfile from.
  branch: "HEAD", # The branch to checkout on the repository. Defaults to `HEAD`.
  path: "fastlane/Fastfile" # The path of the Fastfile in the repository. Defaults to `fastlane/Fastfile`.
  version: "~> 1.0.0" #The version to checkout on the respository. Optimistic operator can be used to select the latest version within constraints.
)
```





## Parameters

Key | Description
----|------------
  `url` | The URL of the repository to import the Fastfile from
  `branch` | The branch or tag to check-out on the repository
  `path` | The path of the Fastfile in the repository
  `version` | The version to checkout on the respository. Optimistic operator can be used to select the latest version within constraints




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action import_from_git
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_from_git.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
