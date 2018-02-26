<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# read_podspec


Loads a CocoaPods spec as JSON




> This can be used for only specifying a version string in your podspec
- and during your release process you'd read it from the podspec by running
`version = read_podspec['version']` at the beginning of your lane
Loads the specified (or the first found) podspec in the folder as JSON, so that you can inspect its `version`, `files` etc. 
This can be useful when basing your release process on the version string only stored in one place - in the podspec. As one of 
the first steps you'd read the podspec and its version and the rest of the workflow can use that version string (when e.g. creating a new git tag or a GitHub Release).


read_podspec |
-----|----
Supported platforms | ios, mac
Author | @czechboy0



## 2 Examples

```ruby
spec = read_podspec
version = spec["version"]
puts "Using Version #{version}"
```

```ruby
spec = read_podspec(path: "./XcodeServerSDK.podspec")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to the podspec to be read | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action read_podspec
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/read_podspec.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
