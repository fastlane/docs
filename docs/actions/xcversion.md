<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcversion.rb
-->

# xcversion


Select an Xcode to use by version specifier




> Finds and selects a version of an installed Xcode that best matches the provided [`Gem::Version` requirement specifier](http://www.rubydoc.info/github/rubygems/rubygems/Gem/Version)


xcversion ||
---|---
Supported platforms | ios, mac
Author | @oysta



## 2 Examples

```ruby
xcversion(version: "8.1") # Selects Xcode 8.1.0
```

```ruby
xcversion(version: "~> 8.1.0") # Selects the latest installed version from the 8.1.x set
```





## Parameters

Key | Description | Default
----|-------------|--------
  `version` | The version of Xcode to select specified as a Gem::Version requirement string (e.g. '~> 7.1.0') | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xcversion
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcversion
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcversion parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcversion.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
