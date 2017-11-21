<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# copy_artifacts


Small action to save your build artifacts. Useful when you use reset_git_repo




> This action copies artifacts to a target directory. It's useful if you have a CI that will pick up these artifacts and attach them to the build. Useful e.g. for storing your `.ipa`s, `.dSYM.zip`s, `.mobileprovision`s, `.cert`s
Make sure your target_path is gitignored, and if you use `reset_git_repo`, make sure the artifacts are added to the exclude list


copy_artifacts |
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic



**1 Example**

```ruby
copy_artifacts(
  target_path: "artifacts",
  artifacts: ["*.cer", "*.mobileprovision", "*.ipa", "*.dSYM.zip"]
)

# Reset the git repo to a clean state, but leave our artifacts in place
reset_git_repo(
  exclude: "artifacts"
)
```





**Parameters**

Key | Description
----|------------
  `keep_original` | Set this to true if you want copy, rather than move, semantics
  `target_path` | The directory in which you want your artifacts placed
  `artifacts` | An array of file patterns of the files/folders you want to preserve
  `fail_on_missing` | Fail when a source file isn't found




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action copy_artifacts
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/copy_artifacts.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
