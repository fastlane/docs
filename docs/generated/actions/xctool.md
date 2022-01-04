<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xctool.rb
-->

# xctool


Run tests using xctool




> You can run any `xctool` action. This will require having [xctool](https://github.com/facebook/xctool) installed through [Homebrew](http://brew.sh).<br>It is recommended to store the build configuration in the `.xctool-args` file.<br>More information: [https://docs.fastlane.tools/actions/xctool/](https://docs.fastlane.tools/actions/xctool/).


xctool ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx



## 2 Examples

```ruby
xctool(:test)
```

```ruby
# If you prefer to have the build configuration stored in the `Fastfile`:
xctool(:test, [
  "--workspace", "'AwesomeApp.xcworkspace'",
  "--scheme", "'Schema Name'",
  "--configuration", "Debug",
  "--sdk", "iphonesimulator",
  "--arch", "i386"
].join(" "))
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xctool
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xctool
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xctool parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xctool.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
