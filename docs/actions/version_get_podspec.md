<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# version_get_podspec


Receive the version number from a podspec file







version_get_podspec |
-----|----
Supported platforms | ios, mac
Author | @Liquidsoul, @KrauseFx



## 1 Example

```ruby
version = version_get_podspec(path: "TSMessages.podspec")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | You must specify the path to the podspec file | [*](#parameters-legend-dynamic)
  `require_variable_prefix` | true by default, this is used for non CocoaPods version bumps only | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action version_get_podspec
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/version_get_podspec.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
