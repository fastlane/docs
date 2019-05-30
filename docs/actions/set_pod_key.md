<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_pod_key.rb
-->

# set_pod_key


Sets a value for a key with cocoapods-keys




> Adds a key to [cocoapods-keys](https://github.com/orta/cocoapods-keys)


set_pod_key ||
---|---
Supported platforms | ios, mac
Author | @marcelofabri



## 1 Example

```ruby
set_pod_key(
  key: "APIToken",
  value: "1234",
  project: "MyProject"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true`
  `key` | The key to be saved with cocoapods-keys | 
  `value` | The value to be saved with cocoapods-keys | 
  `project` | The project name | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action set_pod_key
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run set_pod_key
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run set_pod_key parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/set_pod_key.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
