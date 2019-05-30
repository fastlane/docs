<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/increment_version_number.rb
-->

# increment_version_number


Increment the version number of your project




> This action will increment the version number.<br>You first have to set up your Xcode project, if you haven't done it already: [https://developer.apple.com/library/ios/qa/qa1827/_index.html](https://developer.apple.com/library/ios/qa/qa1827/_index.html).


increment_version_number ||
---|---
Supported platforms | ios, mac
Author | @serluca
Returns | The new version number



## 7 Examples

```ruby
increment_version_number # Automatically increment patch version number
```

```ruby
increment_version_number(
  bump_type: "patch" # Automatically increment patch version number
)
```

```ruby
increment_version_number(
  bump_type: "minor" # Automatically increment minor version number
)
```

```ruby
increment_version_number(
  bump_type: "major" # Automatically increment major version number
)
```

```ruby
increment_version_number(
  version_number: "2.1.1" # Set a specific version number
)
```

```ruby
increment_version_number(
  version_number: "2.1.1",      # specify specific version number (optional, omitting it increments patch version number)
  xcodeproj: "./path/to/MyApp.xcodeproj"  # (optional, you must specify the path to your main Xcode project if it is not in the project root directory)
)
```

```ruby
version = increment_version_number
```





## Parameters

Key | Description | Default
----|-------------|--------
  `bump_type` | The type of this version bump. Available: patch, minor, major | `patch`
  `version_number` | Change to a specific version. This will replace the bump type value | 
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `increment_version_number` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::VERSION_NUMBER` | The new version number

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action increment_version_number
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run increment_version_number
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run increment_version_number parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/increment_version_number.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
