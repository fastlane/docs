<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_install.rb
-->

# xcode_install


Make sure a certain version of Xcode is installed




> Makes sure a specific version of Xcode is installed. If that's not the case, it will automatically be downloaded by the [xcode_install](https://github.com/neonichu/xcode-install) gem. This will make sure to use the correct Xcode for later actions.


xcode_install ||
---|---
Supported platforms | ios, mac
Author | @Krausefx
Returns | The path to the newly installed Xcode version



## 1 Example

```ruby
xcode_install(version: "7.1")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `version` | The version number of the version of Xcode to install | 
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `team_id` | The ID of your team if you're in multiple teams | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action xcode_install
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_install.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
