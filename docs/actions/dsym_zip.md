<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# dsym_zip


Creates a zipped dSYM in the project root from the .xcarchive




> You can manually specify the path to the xcarchive (not needed if you use `xcodebuild`/`xcarchive` to build your archive)


dsym_zip |
-----|----
Supported platforms | ios, mac
Author | @lmirosevic



## 2 Examples

```ruby
dsym_zip
```

```ruby
dsym_zip(
  archive_path: "MyApp.xcarchive"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `archive_path` | Path to your xcarchive file. Optional if you use the `xcodebuild` action | -
  `dsym_path` | Path for generated dsym. Optional, default is your apps root directory | -
  `all` | Whether or not all dSYM files are to be included. Optional, default is false in which only your app dSYM is included | false

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action dsym_zip
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/dsym_zip.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
