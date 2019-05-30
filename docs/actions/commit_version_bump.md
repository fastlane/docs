<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/commit_version_bump.rb
-->

# commit_version_bump


Creates a 'Version Bump' commit. Run after `increment_build_number`




> This action will create a 'Version Bump' commit in your repo. Useful in conjunction with `increment_build_number`.<br>It checks the repo to make sure that only the relevant files have changed. These are the files that `increment_build_number` (`agvtool`) touches:

>- All `.plist` files
- The `.xcodeproj/project.pbxproj` file
>
Then commits those files to the repo.<br>Customize the message with the `:message` option. It defaults to 'Version Bump'.<br>If you have other uncommitted changes in your repo, this action will fail. If you started off in a clean repo, and used the _ipa_ and or _sigh_ actions, then you can use the [clean_build_artifacts](https://docs.fastlane.tools/actions/clean_build_artifacts/) action to clean those temporary files up before running this action.


commit_version_bump ||
---|---
Supported platforms | ios, mac
Author | @lmirosevic



## 8 Examples

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

```ruby
commit_version_bump(
  no_verify: true # optional, default: false
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
  `no_verify` | Whether or not to use --no-verify | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `commit_version_bump` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::MODIFIED_FILES` | The list of paths of modified files

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action commit_version_bump
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run commit_version_bump
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run commit_version_bump parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/commit_version_bump.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
