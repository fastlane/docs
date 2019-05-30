<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_certificate.rb
-->

# import_certificate


Import certificate from inputfile into a keychain




> Import certificates (and private keys) into the current default keychain. Use the `create_keychain` action to create a new keychain.


import_certificate ||
---|---
Supported platforms | ios, android, mac
Author | @gin0606



## 3 Examples

```ruby
import_certificate(certificate_path: "certs/AppleWWDRCA.cer")
```

```ruby
import_certificate(
  certificate_path: "certs/dist.p12",
  certificate_password: ENV["CERTIFICATE_PASSWORD"] || "default"
)
```

```ruby
import_certificate(
  certificate_path: "certs/development.cer"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `certificate_path` | Path to certificate | 
  `certificate_password` | Certificate password | `''`
  `keychain_name` | Keychain the items should be imported to | 
  `keychain_path` | Path to the Keychain file to which the items should be imported | 
  `keychain_password` | The password for the keychain. Note that for the login keychain this is your user's password | 
  `log_output` | If output should be logged to the console | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action import_certificate
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run import_certificate
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run import_certificate parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_certificate.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
