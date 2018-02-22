<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# set_info_plist_value


Sets value to Info.plist of your project as native Ruby data structures







set_info_plist_value |
-----|----
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

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action set_info_plist_value
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_info_plist_value.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
