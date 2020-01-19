<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/install_xcode_plugin.rb
-->

# install_xcode_plugin


Install an Xcode plugin for the current user







install_xcode_plugin ||
---|---
Supported platforms | ios, mac
Author | @NeoNachoSoto, @tommeier



## 2 Examples

```ruby
install_xcode_plugin(url: "https://example.com/clubmate/plugin.zip")
```

```ruby
install_xcode_plugin(github: "https://github.com/contentful/ContentfulXcodePlugin")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `url` | URL for Xcode plugin ZIP file | 
  `github` | GitHub repository URL for Xcode plugin | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action install_xcode_plugin
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run install_xcode_plugin
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run install_xcode_plugin parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/install_xcode_plugin.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
