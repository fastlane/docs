<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# get_build_number_repository


Get the build number from the current repository




> This action will get the **build number** according to what the SCM HEAD reports.
Currently supported SCMs are svn (uses root revision), git-svn (uses svn revision) and git (uses short hash) and mercurial (uses short hash or revision number).
There is an option, `:use_hg_revision_number`, which allows to use mercurial revision number instead of hash.


get_build_number_repository |
-----|----
Supported platforms | ios, mac
Author | @bartoszj, @pbrooks, @armadsen
Returns | The build number from the current repository



## 1 Example

```ruby
get_build_number_repository
```





## Parameters

Key | Description
----|------------
  `use_hg_revision_number` | Use hg revision number instead of hash (ignored for non-hg repos)




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action get_build_number_repository
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_build_number_repository.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
