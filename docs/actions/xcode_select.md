<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_select.rb
-->

# xcode_select


Change the xcode-path to use. Useful for beta versions of Xcode




> Select and build with the Xcode installed at the provided path. Use the `xcversion` action if you want to select an Xcode based on a version specifier or you don't have known, stable paths as may happen in a CI environment.


xcode_select ||
---|---
Supported platforms | ios, mac
Author | @dtrenz



## 1 Example

```ruby
xcode_select("/Applications/Xcode-8.3.2.app")
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xcode_select
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcode_select
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcode_select parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_select.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
