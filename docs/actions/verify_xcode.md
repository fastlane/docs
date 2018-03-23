<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_xcode.rb
-->

# verify_xcode


Verifies that the Xcode installation is properly signed by Apple




> This action was implemented after the recent Xcode attack to make sure
you're not using a hacked Xcode installation.
http://researchcenter.paloaltonetworks.com/2015/09/novel-malware-xcodeghost-modifies-xcode-infects-apple-ios-apps-and-hits-app-store/


verify_xcode |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



## 2 Examples

```ruby
verify_xcode
```

```ruby
verify_xcode(xcode_path: "/Applications/Xcode.app")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcode_path` | The path to the Xcode installation to test | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action verify_xcode
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_xcode.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
