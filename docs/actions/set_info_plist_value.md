<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_info_plist_value.rb
-->

# set_info_plist_value


Sets value to Info.plist of your project as native Ruby data structures







set_info_plist_value ||
---|---
Supported platforms | ios, mac
Author | @kohtenko, @uwehollatz



## 2 Examples

```ruby
set_info_plist_value(path: "./Info.plist", key: "CFBundleIdentifier", value: "com.krausefx.app.beta")
```

```ruby
set_info_plist_value(path: "./MyApp-Info.plist", key: "NSAppTransportSecurity", subkey: "NSAllowsArbitraryLoads", value: true, output_file_name: "./Info.plist")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `key` | Name of key in plist | 
  `subkey` | Name of subkey in plist | 
  `value` | Value to setup | 
  `path` | Path to plist file you want to update | 
  `output_file_name` | Path to the output file you want to generate | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action set_info_plist_value
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_info_plist_value
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_info_plist_value parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_info_plist_value.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
