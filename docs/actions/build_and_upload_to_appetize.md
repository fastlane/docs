<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/build_and_upload_to_appetize.rb
-->

# build_and_upload_to_appetize


Generate and upload an ipa file to appetize.io




> This should be called from danger.<br>More information in the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md).


build_and_upload_to_appetize ||
---|---
Supported platforms | ios
Author | @KrauseFx





## Parameters

Key | Description | Default
----|-------------|--------
  `xcodebuild` | Parameters that are passed to the xcodebuild action | `{}`
  `scheme` | The scheme to build. Can also be passed using the `xcodebuild` parameter | 
  `api_token` | Appetize.io API Token | 
  `public_key` | If not provided, a new app will be created. If provided, the existing build will be overwritten | 
  `note` | Notes you wish to add to the uploaded app | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action build_and_upload_to_appetize
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run build_and_upload_to_appetize
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run build_and_upload_to_appetize parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/build_and_upload_to_appetize.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
