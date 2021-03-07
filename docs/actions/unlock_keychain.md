<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/unlock_keychain.rb
-->

# unlock_keychain


Unlock a keychain




> Unlocks the given keychain file and adds it to the keychain search list.<br>Keychains can be replaced with `add_to_search_list: :replace`.


unlock_keychain ||
---|---
Supported platforms | ios, android, mac
Author | @xfreebird



## 4 Examples

```ruby
unlock_keychain( # Unlock an existing keychain and add it to the keychain search list
  path: "/path/to/KeychainName.keychain",
  password: "mysecret"
)
```

```ruby
unlock_keychain( # By default the keychain is added to the existing. To replace them with the selected keychain you may use `:replace`
  path: "/path/to/KeychainName.keychain",
  password: "mysecret",
  add_to_search_list: :replace # To only add a keychain use `true` or `:add`.
)
```

```ruby
unlock_keychain( # In addition, the keychain can be selected as a default keychain
  path: "/path/to/KeychainName.keychain",
  password: "mysecret",
  set_default: true
)
```

```ruby
unlock_keychain( # If the keychain file is located in the standard location `~/Library/Keychains`, then it is sufficient to provide the keychain file name, or file name with its suffix.
  path: "KeychainName",
  password: "mysecret"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to the keychain file | `login`
  `password` | Keychain password | 
  `add_to_search_list` | Add to keychain search list | `true`
  `set_default` | Set as default keychain | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action unlock_keychain
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run unlock_keychain
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run unlock_keychain parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/unlock_keychain.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
