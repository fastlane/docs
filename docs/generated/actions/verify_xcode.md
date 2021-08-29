<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_xcode.rb
-->

# verify_xcode


Verifies that the Xcode installation is properly signed by Apple




> This action was implemented after the recent Xcode attack to make sure you're not using a [hacked Xcode installation](http://researchcenter.paloaltonetworks.com/2015/09/novel-malware-xcodeghost-modifies-xcode-infects-apple-ios-apps-and-hits-app-store/).


verify_xcode ||
---|---
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



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action verify_xcode
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run verify_xcode
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run verify_xcode parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_xcode.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
