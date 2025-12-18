<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcov.rb
-->

# xcov


Nice code coverage reports without hassle




> Create nice code coverage reports and post coverage summaries on Slack *(xcov gem is required)*.<br>More information: [https://github.com/fastlane-community/xcov](https://github.com/fastlane-community/xcov).


xcov ||
---|---
Supported platforms | ios, mac
Author | @nakiostudio



## 1 Example

```ruby
xcov(
  workspace: "YourWorkspace.xcworkspace",
  scheme: "YourScheme",
  output_directory: "xcov_output"
)
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xcov
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcov
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcov parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcov.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
