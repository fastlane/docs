<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_urban_airship_configuration.rb
-->

# update_urban_airship_configuration


Set [Urban Airship](https://www.urbanairship.com/) plist configuration values




> This action updates the `AirshipConfig.plist` needed to configure the Urban Airship SDK at runtime, allowing keys and secrets to easily be set for the Enterprise and Production versions of the application.


update_urban_airship_configuration ||
---|---
Supported platforms | ios
Author | @kcharwood



## 1 Example

```ruby
update_urban_airship_configuration(
  plist_path: "AirshipConfig.plist",
  production_app_key: "PRODKEY",
  production_app_secret: "PRODSECRET"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `plist_path` | Path to Urban Airship configuration Plist | 
  `development_app_key` | The development app key | 
  `development_app_secret` | The development app secret | 
  `production_app_key` | The production app key | 
  `production_app_secret` | The production app secret | 
  `detect_provisioning_mode` | Automatically detect provisioning mode | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_urban_airship_configuration
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_urban_airship_configuration
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_urban_airship_configuration parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_urban_airship_configuration.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
