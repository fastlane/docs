<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/increment_build_number.rb
-->

# increment_build_number


Increment the build number of your project







increment_build_number ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx
Returns | The new build number



## 4 Examples

```ruby
increment_build_number # automatically increment by one
```

```ruby
increment_build_number(
  build_number: "75" # set a specific number
)
```

```ruby
increment_build_number(
  build_number: 75, # specify specific build number (optional, omitting it increments by one)
  xcodeproj: "./path/to/MyApp.xcodeproj" # (optional, you must specify the path to your main Xcode project if it is not in the project root directory)
)
```

```ruby
build_number = increment_build_number
```





## Parameters

Key | Description | Default
----|-------------|--------
  `build_number` | Change to a specific version. When you provide this parameter, Apple Generic Versioning does not have to be enabled | 
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `increment_build_number` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::BUILD_NUMBER` | The new build number

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action increment_build_number
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run increment_build_number
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run increment_build_number parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/increment_build_number.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
