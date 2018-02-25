<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# import_certificate


Import certificate from inputfile into a keychain




> Import certificates into the current default keychain. Use `create_keychain` to create a new keychain.


import_certificate |
-----|----
Supported platforms | ios, android, mac
Author | @gin0606



## 2 Examples

```ruby
import_certificate(certificate_path: "certs/AppleWWDRCA.cer")
```

```ruby
import_certificate(
  certificate_path: "certs/dist.p12",
  certificate_password: ENV["CERTIFICATE_PASSWORD"] || "default"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `keychain_name` | Keychain the items should be imported to | 
  `keychain_path` | Path to the Keychain file to which the items should be imported | 
  `keychain_password` | The password for the keychain. Note that for the login keychain this is your user's password | 
  `certificate_path` | Path to certificate | 
  `certificate_password` | Certificate password | `''`
  `log_output` | If output should be logged to the console | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action import_certificate
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_certificate.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
