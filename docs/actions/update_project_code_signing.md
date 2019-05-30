<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_code_signing.rb
-->

# update_project_code_signing


Updated code signing settings from 'Automatic' to a specific profile

> You shouldn't use `update_project_code_signing`.<br>Have you considered using the recommended way to do code signing: [https://docs.fastlane.tools/codesigning/getting-started/](https://docs.fastlane.tools/codesigning/getting-started/)?





update_project_code_signing ||
---|---
Supported platforms | ios
Author | @KrauseFx





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to your Xcode project | 
  `udid` | **DEPRECATED!** Use `:uuid` instead | [*](#parameters-legend-dynamic)
  `uuid` | The UUID of the provisioning profile you want to use | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_project_code_signing
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_project_code_signing
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_project_code_signing parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_code_signing.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
