<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_group_identifiers.rb
-->

# update_app_group_identifiers


This action changes the app group identifiers in the entitlements file




> Updates the App Group Identifiers in the given Entitlements file, so you can have app groups for the app store build and app groups for an enterprise build.


update_app_group_identifiers ||
---|---
Supported platforms | ios
Author | @mathiasAichinger



## 1 Example

```ruby
update_app_group_identifiers(
  entitlements_file: "/path/to/entitlements_file.entitlements",
  app_group_identifiers: ["group.your.app.group.identifier"]
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `entitlements_file` | The path to the entitlement file which contains the app group identifiers | 
  `app_group_identifiers` | An Array of unique identifiers for the app groups. Eg. ['group.com.test.testapp'] | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `update_app_group_identifiers` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::APP_GROUP_IDENTIFIERS` | The new App Group Identifiers

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_app_group_identifiers
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_app_group_identifiers
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_app_group_identifiers parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_group_identifiers.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
