<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/trainer.rb
-->

# trainer


Convert the Xcode plist log to a JUnit report







trainer ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx
Returns | A hash with the key being the path of the generated file, the value being if the tests were successful





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to the directory that should be converted | `.`
  `extension` | The extension for the newly created file. Usually .xml or .junit | `.xml`
  `output_directory` | Directoy in which the xml files should be written to. Same directory as source by default | 
  `fail_build` | Should this step stop the build if the tests fail? Set this to false if you're handling this with a test reporter | `true`
  `xcpretty_naming` | Produces class name and test name identical to xcpretty naming in junit file | `false`
  `silent` | Silences all output | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action trainer
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run trainer
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run trainer parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/trainer.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
