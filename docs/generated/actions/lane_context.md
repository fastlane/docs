<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/lane_context.rb
-->

# lane_context


Access lane context values




> Access the fastlane lane context values.<br>More information about how the lane context works: [https://docs.fastlane.tools/advanced/#lane-context](https://docs.fastlane.tools/advanced/#lane-context).


lane_context ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 2 Examples

```ruby
lane_context[SharedValues::BUILD_NUMBER]
```

```ruby
lane_context[SharedValues::IPA_OUTPUT_PATH]
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action lane_context
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run lane_context
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run lane_context parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/lane_context.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
