<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/version_bump_podspec.rb
-->

# version_bump_podspec


Increment or set the version in a podspec file




> You can use this action to manipulate any 'version' variable contained in a ruby file.<br>For example, you can use it to bump the version of a CocoaPods' podspec file.<br>It also supports versions that are not semantic: `1.4.14.4.1`.<br>For such versions, there is an option to change the appendix (e.g. `4.1`).


version_bump_podspec ||
---|---
Supported platforms | ios, mac
Author | @Liquidsoul, @KrauseFx



## 2 Examples

```ruby
version = version_bump_podspec(path: "TSMessages.podspec", bump_type: "patch")
```

```ruby
version = version_bump_podspec(path: "TSMessages.podspec", version_number: "1.4")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | You must specify the path to the podspec file to update | [*](#parameters-legend-dynamic)
  `bump_type` | The type of this version bump. Available: patch, minor, major | `patch`
  `version_number` | Change to a specific version. This will replace the bump type value | 
  `version_appendix` | Change version appendix to a specific value. For example 1.4.14.4.1 -> 1.4.14.5 | 
  `require_variable_prefix` | true by default, this is used for non CocoaPods version bumps only | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `version_bump_podspec` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::PODSPEC_VERSION_NUMBER` | The new podspec version number

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action version_bump_podspec
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run version_bump_podspec
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run version_bump_podspec parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/version_bump_podspec.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
