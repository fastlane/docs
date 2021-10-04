<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/fastlane_version.rb
-->

# fastlane_version


Alias for the `min_fastlane_version` action




> Add this to your `Fastfile` to require a certain version of _fastlane_.<br>Use it if you use an action that just recently came out and you need it.


fastlane_version ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 1 Example

```ruby
min_fastlane_version("1.50.0")
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action fastlane_version
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run fastlane_version
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run fastlane_version parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/fastlane_version.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
