<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/notarize.rb
-->

# notarize


Notarizes a macOS app







notarize ||
---|---
Supported platforms | mac
Author | @zeplin





## Parameters

Key | Description | Default
----|-------------|--------
  `package` | Path to package to notarize, e.g. .app bundle or disk image | 
  `use_notarytool` | Whether to `xcrun notarytool` or `xcrun altool` | [*](#parameters-legend-dynamic)
  `try_early_stapling` | Whether to try early stapling while the notarization request is in progress | `false`
  `skip_stapling` | Do not staple the notarization ticket to the artifact; useful for single file executables and ZIP archives | `false`
  `bundle_id` | Bundle identifier to uniquely identify the package | 
  `username` | Apple ID username | [*](#parameters-legend-dynamic)
  `asc_provider` | Provider short name for accounts associated with multiple providers | 
  `print_log` | Whether to print notarization log file, listing issues on failure and warnings on success | `false`
  `verbose` | Whether to log requests | `false`
  `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | 
  `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action notarize
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run notarize
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run notarize parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/notarize.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
