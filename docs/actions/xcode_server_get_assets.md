<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_server_get_assets.rb
-->

# xcode_server_get_assets


Downloads Xcode Bot assets like the `.xcarchive` and logs




> This action downloads assets from your Xcode Server Bot (works with Xcode Server using Xcode 6 and 7. By default, this action downloads all assets, unzips them and deletes everything except for the `.xcarchive`.<br>If you'd like to keep all downloaded assets, pass `keep_all_assets: true`.<br>This action returns the path to the downloaded assets folder and puts into shared values the paths to the asset folder and to the `.xcarchive` inside it.


xcode_server_get_assets ||
---|---
Supported platforms | ios, mac
Author | @czechboy0



## 1 Example

```ruby
xcode_server_get_assets(
  host: "10.99.0.59", # Specify Xcode Server's Host or IP Address
  bot_name: "release-1.3.4" # Specify the particular Bot
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `host` | IP Address/Hostname of Xcode Server | 
  `bot_name` | Name of the Bot to pull assets from | 
  `integration_number` | Optionally you can override which integration's assets should be downloaded. If not provided, the latest integration is used | 
  `username` | Username for your Xcode Server | `''`
  `password` | Password for your Xcode Server | `''`
  `target_folder` | Relative path to a folder into which to download assets | `./xcs_assets`
  `keep_all_assets` | Whether to keep all assets or let the script delete everything except for the .xcarchive | `false`
  `trust_self_signed_certs` | Whether to trust self-signed certs on your Xcode Server | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `xcode_server_get_assets` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::XCODE_SERVER_GET_ASSETS_PATH` | Absolute path to the downloaded assets folder
  `SharedValues::XCODE_SERVER_GET_ASSETS_ARCHIVE_PATH` | Absolute path to the downloaded xcarchive file

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xcode_server_get_assets
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcode_server_get_assets
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcode_server_get_assets parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_server_get_assets.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
