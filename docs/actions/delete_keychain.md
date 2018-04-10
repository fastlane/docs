<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/delete_keychain.rb
-->

# delete_keychain


Delete keychains and remove them from the search list




> Keychains can be deleted after being creating with `create_keychain`


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
To show the documentation in your terminal, run
```no-highlight
fastlane action delete_keychain
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/delete_keychain.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
