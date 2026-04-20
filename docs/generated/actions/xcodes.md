<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcodes.rb
-->

# xcodes


Make sure a certain version of Xcode is installed, installing it only if needed




> Makes sure a specific version of Xcode is installed. If that's not the case, it will automatically be downloaded by [xcodes](https://github.com/RobotsAndPencils/xcodes).<br>This will make sure to use the correct Xcode version for later actions.<br>Note that this action depends on [xcodes](https://github.com/RobotsAndPencils/xcodes) CLI, so make sure you have it installed in your environment. For the installation guide, see: https://github.com/RobotsAndPencils/xcodes#installation


xcodes ||
---|---
Supported platforms | ios, mac
Author | @rogerluan
Returns | The path to the newly installed Xcode version



## 2 Examples

```ruby
xcodes(version: "14.1")
```

```ruby
xcodes # When missing, the version value defaults to the value specified in the .xcode-version file
```





## Parameters

Key | Description | Default
----|-------------|--------
  `version` | The version number of the version of Xcode to install. Defaults to the value specified in the .xcode-version file | [*](#parameters-legend-dynamic)
  `update_list` | Whether the list of available Xcode versions should be updated before running the install command | `true`
  `select_for_current_build_only` | When true, it won't attempt to install an Xcode version, just find the installed Xcode version that best matches the passed version argument, and select it for the current build steps. It doesn't change the global Xcode version (e.g. via 'xcrun xcode-select'), which would require sudo permissions — when this option is true, this action doesn't require sudo permissions | `false`
  `binary_path` | Where the xcodes binary lives on your system (full path) | [*](#parameters-legend-dynamic)
  `xcodes_args` | Pass in xcodes command line arguments directly. When present, other parameters are ignored and only this parameter is used to build the command to be executed | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `xcodes` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::XCODES_XCODE_PATH` | The path to the newly installed Xcode version

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xcodes
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcodes
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcodes parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcodes.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
