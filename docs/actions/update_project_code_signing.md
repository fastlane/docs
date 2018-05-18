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
To show the documentation in your terminal, run
```no-highlight
fastlane action update_project_code_signing
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_code_signing.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
