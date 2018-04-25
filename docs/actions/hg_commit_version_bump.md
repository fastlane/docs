<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_commit_version_bump.rb
-->

# hg_commit_version_bump


This will commit a version bump to the hg repo




> The mercurial equivalent of the [commit_version_bump](https://docs.fastlane.tools/actions/commit_version_bump/) git action. Like the git version, it is useful in conjunction with [`increment_build_number`](https://docs.fastlane.tools/actions/increment_build_number/).<br>It checks the repo to make sure that only the relevant files have changed, these are the files that `increment_build_number` (`agvtool`) touches:

>- All `.plist` files
- The `.xcodeproj/project.pbxproj` file
>
Then commits those files to the repo.<br>Customize the message with the `:message` option, defaults to 'Version Bump'<br>If you have other uncommitted changes in your repo, this action will fail. If you started off in a clean repo, and used the _ipa_ and or _sigh_ actions, then you can use the [clean_build_artifacts](https://docs.fastlane.tools/actions/clean_build_artifacts/) action to clean those temporary files up before running this action.


hg_commit_version_bump ||
---|---
Supported platforms | ios, android, mac
Author | @sjrmanning



## 2 Examples

```ruby
hg_commit_version_bump
```

```ruby
hg_commit_version_bump(
  message: "Version Bump",       # create a commit with a custom message
  xcodeproj: "./path/MyProject.xcodeproj", # optional, if you have multiple Xcode project files, you must specify your main project here
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `message` | The commit message when committing the version bump | `Version Bump`
  `xcodeproj` | The path to your project file (Not the workspace). If you have only one, this is optional | 
  `force` | Forces the commit, even if other files than the ones containing the version number have been modified | `false`
  `test_dirty_files` | A list of dirty files passed in for testing | `file1, file2`
  `test_expected_files` | A list of expected changed files passed in for testing | `file1, file2`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action hg_commit_version_bump
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_commit_version_bump.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
