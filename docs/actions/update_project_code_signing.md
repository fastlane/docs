# update_project_code_signing


Updated code signing settings from 'Automatic' to a specific profile

> You shouldn't use update_project_code_signing.
Have you considered using the recommended way to do code signing?
https://docs.fastlane.tools/codesigning/getting-started/





update_project_code_signing |
-----|----
Supported platforms | ios
Author | @KrauseFx





**Parameters**

Key | Description
----|------------
  `path` | Path to your Xcode project
  `udid` | DEPRECATED: see :uuid
  `uuid` | The UUID of the provisioning profile you want to use




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_project_code_signing
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_code_signing.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
