<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ruby_version.rb
-->

# ruby_version


Verifies the minimum ruby version required




> Add this to your `Fastfile` to require a certain version of _ruby_.<br>Put it at the top of your `Fastfile to ensure that _fastlane_ is executed appropriately.


ruby_version ||
---|---
Supported platforms | ios, android, mac
Author | @sebastianvarela



## 1 Example

```ruby
ruby_version("2.4.0")
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action ruby_version
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ruby_version
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ruby_version parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ruby_version.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
