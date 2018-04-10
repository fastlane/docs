<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/register_devices.rb
-->

# register_devices


Registers new devices to the Apple Dev Portal




> This will register iOS/Mac devices with the Developer Portal so that you can include them in your provisioning profiles.
This is an optimistic action, in that it will only ever add new devices to the member center, and never remove devices. If a device which has already been registered within the member center is not passed to this action, it will be left alone in the member center and continue to work.
The action will connect to the Apple Developer Portal using the username you specified in your `Appfile` with `apple_id`, but you can override it using the `username` option, or by setting the env variable `ENV['DELIVER_USER']`.


register_devices ||
---|---
Supported platforms | ios, mac
Author | @lmirosevic



## 4 Examples

```ruby
register_devices(
  devices: {
    "Luka iPhone 6" => "1234567890123456789012345678901234567890",
    "Felix iPad Air 2" => "abcdefghijklmnopqrstvuwxyzabcdefghijklmn"
  }
) # Simply provide a list of devices as a Hash
```

```ruby
register_devices(
  devices_file: "./devices.txt"
) # Alternatively provide a standard UDID export .txt file, see the Apple Sample (http://devimages.apple.com/downloads/devices/Multiple-Upload-Samples.zip)
```

```ruby
register_devices(
  devices_file: "./devices.txt", # You must pass in either `devices_file` or `devices`.
  team_id: "XXXXXXXXXX",         # Optional, if you"re a member of multiple teams, then you need to pass the team ID here.
  username: "luka@goonbee.com"   # Optional, lets you override the Apple Member Center username.
)
```

```ruby
register_devices(
  devices: {
    "Luka MacBook" => "12345678-1234-1234-1234-123456789012",
    "Felix MacBook Pro" => "ABCDEFGH-ABCD-ABCD-ABCD-ABCDEFGHIJKL"
  },
  platform: "mac"
) # Register devices for Mac
```





## Parameters

Key | Description | Default
----|-------------|--------
  `devices` | A hash of devices, with the name as key and the UDID as value | 
  `devices_file` | Provide a path to a file with the devices to register. For the format of the file see the examples | 
  `team_id` | The ID of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `username` | Optional: Your Apple ID | [*](#parameters-legend-dynamic)
  `platform` | The platform to use (optional) | `ios`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action register_devices
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/register_devices.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
