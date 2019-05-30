<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_info_plist_value.rb
-->

# get_info_plist_value


Returns value from Info.plist of your project as native Ruby data structures




> Get a value from a plist file, which can be used to fetch the app identifier and more information about your app


get_info_plist_value ||
---|---
Supported platforms | ios, mac
Author | @kohtenko



## 1 Example

```ruby
identifier = get_info_plist_value(path: "./Info.plist", key: "CFBundleIdentifier")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `key` | Name of parameter | 
  `path` | Path to plist file you want to read | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_info_plist_value` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::GET_INFO_PLIST_VALUE_CUSTOM_VALUE` | The value of the last plist file that was parsed

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action get_info_plist_value
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_info_plist_value
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_info_plist_value parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_info_plist_value.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
