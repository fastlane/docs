<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_build_number.rb
-->

# get_build_number


Get the build number of your project




> This action will return the current build number set on your project.<br>You first have to set up your Xcode project, if you haven't done it already: [https://developer.apple.com/library/ios/qa/qa1827/_index.html](https://developer.apple.com/library/ios/qa/qa1827/_index.html).


get_build_number ||
---|---
Supported platforms | ios, mac
Author | @Liquidsoul



## 1 Example

```ruby
build_number = get_build_number(xcodeproj: "Project.xcodeproj")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | 
  `hide_error_when_versioning_disabled` | Used during `fastlane init` to hide the error message | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_build_number` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::BUILD_NUMBER` | The build number

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action get_build_number
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_build_number
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_build_number parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_build_number.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
