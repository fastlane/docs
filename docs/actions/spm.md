<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/spm.rb
-->

# spm


Runs Swift Package Manager on your project







spm ||
---|---
Supported platforms | ios, android, mac
Author | @fjcaetano, @nxtstep



## 3 Examples

```ruby
spm
```

```ruby
spm(
  command: "build",
  build_path: "./build",
  configuration: "release"
)
```

```ruby
spm(
  command: "generate-xcodeproj",
  xcconfig: "Package.xcconfig"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `command` | The swift command (one of: build, test, clean, reset, update, resolve, generate-xcodeproj, init) | `build`
  `build_path` | Specify build/cache directory [default: ./.build] | 
  `package_path` | Change working directory before any other operation | 
  `xcconfig` | Use xcconfig file to override swift package generate-xcodeproj defaults | 
  `configuration` | Build with configuration (debug\|release) [default: debug] | 
  `xcpretty_output` | Specifies the output type for xcpretty. eg. 'test', or 'simple' | 
  `verbose` | Increase verbosity of informational output | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action spm
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run spm
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run spm parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/spm.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
