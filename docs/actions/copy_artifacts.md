<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/copy_artifacts.rb
-->

# copy_artifacts


Copy and save your build artifacts (useful when you use reset_git_repo)




> This action copies artifacts to a target directory. It's useful if you have a CI that will pick up these artifacts and attach them to the build. Useful e.g. for storing your `.ipa`s, `.dSYM.zip`s, `.mobileprovision`s, `.cert`s.<br>Make sure your `:target_path` is ignored from git, and if you use `reset_git_repo`, make sure the artifacts are added to the exclude list.


copy_artifacts ||
---|---
Supported platforms | ios, android, mac
Author | @lmirosevic



## 2 Examples

```ruby
copy_artifacts(
  target_path: "artifacts",
  artifacts: ["*.cer", "*.mobileprovision", "*.ipa", "*.dSYM.zip", "path/to/file.txt", "another/path/*.extension"]
)

# Reset the git repo to a clean state, but leave our artifacts in place
reset_git_repo(
  exclude: "artifacts"
)
```

```ruby
# Copy the .ipa created by _gym_ if it was successfully created
artifacts = []
artifacts << lane_context[SharedValues::IPA_OUTPUT_PATH] if lane_context[SharedValues::IPA_OUTPUT_PATH]
copy_artifacts(
   artifacts: artifacts
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `keep_original` | Set this to false if you want move, rather than copy, the found artifacts | `true`
  `target_path` | The directory in which you want your artifacts placed | `artifacts`
  `artifacts` | An array of file patterns of the files/folders you want to preserve | `[]`
  `fail_on_missing` | Fail when a source file isn't found | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action copy_artifacts
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run copy_artifacts
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run copy_artifacts parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/copy_artifacts.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
