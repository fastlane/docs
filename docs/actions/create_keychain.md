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
  `require_create` | Fail the action if the Keychain already exists | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_keychain` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::ORIGINAL_DEFAULT_KEYCHAIN` | The path to the default keychain

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action create_keychain
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_keychain
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_keychain parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_keychain.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
