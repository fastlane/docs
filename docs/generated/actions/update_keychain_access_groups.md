<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_keychain_access_groups.rb
-->

# update_keychain_access_groups


This action changes the keychain access groups in the entitlements file




> Updates the Keychain Group Access Groups in the given Entitlements file, so you can have keychain access groups for the app store build and keychain access groups for an enterprise build.


update_keychain_access_groups ||
---|---
Supported platforms | ios
Author | @yutae



## 1 Example

```ruby
update_keychain_access_groups(
  entitlements_file: "/path/to/entitlements_file.entitlements",
  identifiers: ["your.keychain.access.groups.identifiers"]
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `entitlements_file` | The path to the entitlement file which contains the keychain access groups | 
  `identifiers` | An Array of unique identifiers for the keychain access groups. Eg. ['your.keychain.access.groups.identifiers'] | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `update_keychain_access_groups` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::KEYCHAIN_ACCESS_GROUPS` | The new Keychain Access Groups

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_keychain_access_groups
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_keychain_access_groups
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_keychain_access_groups parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_keychain_access_groups.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/generated/actions/"><b>Back to actions</b></a>
