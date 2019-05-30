<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clipboard.rb
-->

# clipboard


Copies a given string into the clipboard. Works only on macOS







clipboard ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx, @joshdholtz



## 2 Examples

```ruby
clipboard(value: "https://docs.fastlane.tools/")
```

```ruby
clipboard(value: lane_context[SharedValues::HOCKEY_DOWNLOAD_LINK] || "")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `value` | The string that should be copied into the clipboard | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action clipboard
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run clipboard
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run clipboard parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clipboard.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
