<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_icloud_container_identifiers.rb
-->

# update_icloud_container_identifiers


This action changes the iCloud container identifiers in the entitlements file




> Updates the iCloud Container Identifiers in the given Entitlements file, so you can use different iCloud containers for different builds like Adhoc, App Store, etc.


update_icloud_container_identifiers |
-----|----
Supported platforms | ios
Author | @JamesKuang



## 1 Example

```ruby
update_icloud_container_identifiers(
  entitlements_file: "/path/to/entitlements_file.entitlements",
  icloud_container_identifiers: ["iCloud.com.companyname.appname"]
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `entitlements_file` | The path to the entitlement file which contains the iCloud container identifiers | 
  `icloud_container_identifiers` | An Array of unique identifiers for the iCloud containers. Eg. ['iCloud.com.test.testapp'] | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_icloud_container_identifiers
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_icloud_container_identifiers.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
