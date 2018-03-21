<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# update_urban_airship_configuration


Set the Urban Airship plist configuration values




> This action updates the AirshipConfig.plist need to configure the Urban Airship SDK at runtime, allowing keys and secrets to easily be set for Enterprise and Production versions of the application.


update_urban_airship_configuration |
-----|----
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
To show the documentation in your terminal, run
```no-highlight
fastlane action update_urban_airship_configuration
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_urban_airship_configuration.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
