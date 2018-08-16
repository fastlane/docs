<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_keychain.rb
-->

# create_keychain


Create a new Keychain







create_keychain ||
---|---
Supported platforms | ios, android, mac
Author | @gin0606



## 1 Example

```ruby
create_keychain(
  name: "KeychainName",
  default_keychain: true,
  unlock: true,
  timeout: 3600,
  lock_when_sleeps: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `name` | Keychain name | 
  `path` | Path to keychain | 
  `password` | Password for the keychain | 
  `default_keychain` | Should the newly created Keychain be the new system default keychain | `false`
  `unlock` | Unlock keychain after create | `false`
  `timeout` | timeout interval in seconds. Set `false` if you want to specify "no time-out" | `300`
  `lock_when_sleeps` | Lock keychain when the system sleeps | `false`
  `lock_after_timeout` | Lock keychain after timeout interval | `false`
  `add_to_search_list` | Add keychain to search list | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action create_keychain
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_keychain.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
