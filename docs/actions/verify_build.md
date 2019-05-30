<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_build.rb
-->

# verify_build


Able to verify various settings in ipa file




> Verifies that the built app was built using the expected build resources. This is relevant for people who build on machines that are used to build apps with different profiles, certificates and/or bundle identifiers to guard against configuration mistakes.


verify_build ||
---|---
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
  `build_path` | Explicitly set the ipa, app or xcarchive path | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action verify_build
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run verify_build
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run verify_build parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_build.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
