<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# version_bump_podspec


Increment or set the version in a podspec file




> You can use this action to manipulate any 'version' variable contained in a ruby file.
For example, you can use it to bump the version of a cocoapods' podspec file.
It also supports versions that are not semantic: 1.4.14.4.1
For such versions there is an option to change appendix (4.1)


version_bump_podspec |
-----|----
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
  `path` | You must specify the path to the podspec file to update | [*](#dynamic)
  `bump_type` | The type of this version bump. Available: patch, minor, major | `patch`
  `version_number` | Change to a specific version. This will replace the bump type value | 
  `version_appendix` | Change version appendix to a specific value. For example 1.4.14.4.1 -> 1.4.14.5 | 
  `require_variable_prefix` | true by default, this is used for non CocoaPods version bumps only | `true`

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action version_bump_podspec
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/version_bump_podspec.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
