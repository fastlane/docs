<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_build_number_repository.rb
-->

# set_build_number_repository


Set the build number from the current repository




> This action will set the **build number** according to what the SCM HEAD reports.<br>Currently supported SCMs are svn (uses root revision), git-svn (uses svn revision) and git (uses short hash) and mercurial (uses short hash or revision number).<br>There is an option, `:use_hg_revision_number`, which allows to use mercurial revision number instead of hash


set_build_number_repository ||
---|---
Supported platforms | ios, mac
Author | @pbrooks, @armadsen, @AndrewSB



## 2 Examples

```ruby
set_build_number_repository
```

```ruby
set_build_number_repository(
  xcodeproj: "./path/to/MyApp.xcodeproj"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `use_hg_revision_number` | Use hg revision number instead of hash (ignored for non-hg repos) | `false`
  `xcodeproj` | explicitly specify which xcodeproj to use | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action set_build_number_repository
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_build_number_repository.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
