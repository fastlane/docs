# register_devices


Registers new devices to the Apple Dev Portal




> This will register iOS devices with the Developer Portal so that you can include them in your provisioning profiles.
This is an optimistic action, in that it will only ever add new devices to the member center, and never remove devices. If a device which has already been registered within the member center is not passed to this action, it will be left alone in the member center and continue to work.
The action will connect to the Apple Developer Portal using the username you specified in your `Appfile` with `apple_id`, but you can override it using the `username` option, or by setting the env variable `ENV['DELIVER_USER']`.


register_devices |
-----|----
Supported platforms | ios
Author | @lmirosevic



**3 Examples**

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
) # Alternatively provide a standard UDID export .txt file, see the Apple Sample (https://devimages.apple.com.edgekey.net/downloads/devices/Multiple-Upload-Samples.zip)
```

```ruby
register_devices(
  devices_file: "./devices.txt", # You must pass in either `devices_file` or `devices`.
  team_id: "XXXXXXXXXX",         # Optional, if you"re a member of multiple teams, then you need to pass the team ID here.
  username: "luka@goonbee.com"   # Optional, lets you override the Apple Member Center username.
)
```





**Parameters**

Key | Description
----|------------
  `devices` | A hash of devices, with the name as key and the UDID as value
  `devices_file` | Provide a path to a file with the devices to register. For the format of the file see the examples
  `team_id` | The ID of your Developer Portal team if you're in multiple teams
  `team_name` | The name of your Developer Portal team if you're in multiple teams
  `username` | Optional: Your Apple ID




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action register_devices
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/register_devices.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
