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



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `xcode_install` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::XCODE_INSTALL_XCODE_PATH` | The path to the newly installed Xcode

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xcode_install
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcode_install
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcode_install parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_install.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
