<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/read_podspec.rb
-->

# read_podspec


Loads a CocoaPods spec as JSON




> This can be used for only specifying a version string in your podspec - and during your release process you'd read it from the podspec by running `version = read_podspec['version']` at the beginning of your lane.<br>Loads the specified (or the first found) podspec in the folder as JSON, so that you can inspect its `version`, `files` etc.<br>This can be useful when basing your release process on the version string only stored in one place - in the podspec.<br>As one of the first steps you'd read the podspec and its version and the rest of the workflow can use that version string (when e.g. creating a new git tag or a GitHub Release).


read_podspec ||
---|---
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



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `read_podspec` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::READ_PODSPEC_JSON` | Podspec JSON payload

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action read_podspec
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run read_podspec
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run read_podspec parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/read_podspec.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
