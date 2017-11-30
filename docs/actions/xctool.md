<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# xctool


Run tests using xctool




> You can run any `xctool` action. This will require having [xctool](https://github.com/facebook/xctool) installed through [homebrew](http://brew.sh/). It is recommended to store the build configuration in the `.xctool-args` file. More information available on GitHub: https://docs.fastlane.tools/actions#xctool


xctool |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



## 2 Examples

```ruby
xctool :test
```

```ruby
# If you prefer to have the build configuration stored in the `Fastfile`:
xctool :test, [
  "--workspace", "'AwesomeApp.xcworkspace'",
  "--scheme", "'Schema Name'",
  "--configuration", "Debug",
  "--sdk", "iphonesimulator",
  "--arch", "i386"
].join(" ")
```





<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action xctool
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xctool.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
