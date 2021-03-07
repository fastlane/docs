<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/delete_keychain.rb
-->

# delete_keychain


Delete keychains and remove them from the search list




> Keychains can be deleted after being created with `create_keychain`


delete_keychain ||
---|---
Supported platforms | ios, android, mac
Author | @gin0606, @koenpunt



## 2 Examples

```ruby
delete_keychain(name: "KeychainName")
```

```ruby
delete_keychain(keychain_path: "/keychains/project.keychain")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `name` | Keychain name | 
  `keychain_path` | Keychain path | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action delete_keychain
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run delete_keychain
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run delete_keychain parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/delete_keychain.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
