<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# verify_build


Able to verify various settings in ipa file




> Verifies that the built app was built using the expected build resources. This is relevant for people who build on machines that are used to build apps with different profiles, certificates and/or bundle identifiers to guard against configuration mistakes.


verify_build |
-----|----
Supported platforms | ios
Author | @CodeReaper



## 1 Example

```ruby
verify_build(
  provisioning_type: "distribution",
  bundle_identifier: "com.example.myapp"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `provisioning_type` | Required type of provisioning | 
  `provisioning_uuid` | Required UUID of provisioning profile | 
  `team_identifier` | Required team identifier | 
  `team_name` | Required team name | 
  `app_name` | Required app name | 
  `bundle_identifier` | Required bundle identifier | 
  `ipa_path` | Explicitly set the ipa path | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action verify_build
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_build.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
