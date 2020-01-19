<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/register_device.rb
-->

# register_device


Registers a new device to the Apple Dev Portal




> This will register an iOS device with the Developer Portal so that you can include it in your provisioning profiles.<br>This is an optimistic action, in that it will only ever add a device to the member center. If the device has already been registered within the member center, it will be left alone in the member center.<br>The action will connect to the Apple Developer Portal using the username you specified in your `Appfile` with `apple_id`, but you can override it using the `:username` option.


register_device ||
---|---
Supported platforms | ios
Author | @pvinis



## 2 Examples

```ruby
register_device(
  name: "Luka iPhone 6",
  udid: "1234567890123456789012345678901234567890"
) # Simply provide the name and udid of the device
```

```ruby
register_device(
  name: "Luka iPhone 6",
  udid: "1234567890123456789012345678901234567890",
  team_id: "XXXXXXXXXX",         # Optional, if you"re a member of multiple teams, then you need to pass the team ID here.
  username: "luka@goonbee.com"   # Optional, lets you override the Apple Member Center username.
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `name` | Provide the name of the device to register as | 
  `udid` | Provide the UDID of the device to register as | 
  `team_id` | The ID of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `username` | Optional: Your Apple ID | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action register_device
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run register_device
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run register_device parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/register_device.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
