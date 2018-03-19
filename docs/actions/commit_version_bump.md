<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# commit_version_bump


Creates a 'Version Bump' commit. Run after `increment_build_number`




> This action will create a 'Version Bump' commit in your repo. Useful in conjunction with `increment_build_number`.
It checks the repo to make sure that only the relevant files have changed, these are the files that `increment_build_number` (`agvtool`) touches:
- All .plist files
- The `.xcodeproj/project.pbxproj` file
Then commits those files to the repo.
Customize the message with the `:message` option, defaults to 'Version Bump'
If you have other uncommitted changes in your repo, this action will fail. If you started off in a clean repo, and used the _ipa_ and or _sigh_ actions, then you can use the `clean_build_artifacts` action to clean those temporary files up before running this action.


commit_version_bump |
-----|----
Supported platforms | ios, mac
Author | @lmirosevic



## 7 Examples

```ruby
commit_version_bump
```

```ruby
commit_version_bump(
  message: "Version Bump",# create a commit with a custom message
  xcodeproj: "./path/to/MyProject.xcodeproj", # optional, if you have multiple Xcode project files, you must specify your main project here
)
```

```ruby
commit_version_bump(
  settings: true # Include Settings.bundle/Root.plist
)
```

```ruby
commit_version_bump(
  settings: "About.plist" # Include Settings.bundle/About.plist
)
```

```ruby
commit_version_bump(
  settings: %w[About.plist Root.plist] # Include more than one plist from Settings.bundle
)
```

```ruby
commit_version_bump(
  include: %w[package.json custom.cfg] # include other updated files as part of the version bump
)
```

```ruby
commit_version_bump(
  ignore: /OtherProject/ # ignore files matching a regular expression
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `message` | The commit message when committing the version bump | 
  `xcodeproj` | The path to your project file (Not the workspace). If you have only one, this is optional | 
  `force` | Forces the commit, even if other files than the ones containing the version number have been modified | `false`
  `settings` | Include Settings.bundle/Root.plist with version bump | `false`
  `ignore` | A regular expression used to filter matched plist files to be modified | 
  `include` | A list of extra files to be included in the version bump (string array or comma-separated string) | `[]`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action commit_version_bump
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/commit_version_bump.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
