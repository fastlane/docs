# create_keychain


Create a new Keychain







create_keychain |
-----|----
Supported platforms | ios, android, mac
Author | @gin0606



**1 Example**

```ruby
create_keychain(
  name: "KeychainName",
  default_keychain: true,
  unlock: true,
  timeout: 3600,
  lock_when_sleeps: true
)
```





**Parameters**

Key | Description
----|------------
  `name` | Keychain name
  `path` | Path to keychain
  `password` | Password for the keychain
  `default_keychain` | Should the newly created Keychain be the new system default keychain
  `unlock` | Unlock keychain after create
  `timeout` | timeout interval in seconds. Set `false` if you want to specify "no time-out"
  `lock_when_sleeps` | Lock keychain when the system sleeps
  `lock_after_timeout` | Lock keychain after timeout interval
  `add_to_search_list` | Add keychain to search list




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action create_keychain
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_keychain.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
