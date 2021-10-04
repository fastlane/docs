<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/dsym_zip.rb
-->

# dsym_zip


Creates a zipped dSYM in the project root from the .xcarchive




> You can manually specify the path to the xcarchive (not needed if you use `xcodebuild`/`xcarchive` to build your archive)


dsym_zip ||
---|---
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
  `archive_path` | Path to your xcarchive file. Optional if you use the `xcodebuild` action | [*](#parameters-legend-dynamic)
  `dsym_path` | Path for generated dsym. Optional, default is your apps root directory | 
  `all` | Whether or not all dSYM files are to be included. Optional, default is false in which only your app dSYM is included | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `dsym_zip` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::DSYM_ZIP_PATH` | The named of the zipped dSYM

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action dsym_zip
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run dsym_zip
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run dsym_zip parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/dsym_zip.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
