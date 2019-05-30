<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_version_number.rb
-->

# get_version_number


Get the version number of your project




> This action will return the current version number set on your project.


get_version_number ||
---|---
Supported platforms | ios, mac
Author | @Liquidsoul, @joshdholtz



## 2 Examples

```ruby
version = get_version_number(xcodeproj: "Project.xcodeproj")
```

```ruby
version = get_version_number(
  xcodeproj: "Project.xcodeproj",
  target: "App"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcodeproj` | Path to the main Xcode project to read version number from, optional. By default will use the first Xcode project found within the project root directory | 
  `target` | Target name, optional. Will be needed if you have more than one non-test target to avoid being prompted to select one | 
  `configuration` | Configuration name, optional. Will be needed if you have altered the configurations from the default or your version number depends on the configuration selected | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_version_number` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::VERSION_NUMBER` | The version number

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action get_version_number
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_version_number
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_version_number parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_version_number.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
