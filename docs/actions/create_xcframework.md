<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_xcframework.rb
-->

# create_xcframework


Package multiple build configs of a library/framework into a single xcframework




> Utility for packaging multiple build configurations of a given library<br>or framework into a single xcframework.<br><br>If you want to package several frameworks just provide an array containing<br>the list of frameworks to be packaged using the :frameworks parameter.<br><br>If you want to package several libraries with their corresponding headers<br>provide a hash containing the library as the key and the directory containing<br>its headers as the value (or an empty string if there are no headers associated<br>with the provided library).<br><br>Finally specify the location of the xcframework to be generated using the :output<br>parameter.<br>


create_xcframework ||
---|---
Supported platforms | ios, mac
Author | @jgongo



## 2 Examples

```ruby
create_xcframework(frameworks: ['FrameworkA.framework', 'FrameworkB.framework'], output: 'UniversalFramework.xcframework')
```

```ruby
create_xcframework(libraries: { 'LibraryA.so' => '', 'LibraryB.so' => 'LibraryBHeaders'}, output: 'UniversalFramework.xcframework')
```





## Parameters

Key | Description | Default
----|-------------|--------
  `frameworks` | Frameworks to add to the target xcframework | 
  `libraries` | Libraries to add to the target xcframework, with their corresponding headers | 
  `output` | The path to write the xcframework to | 
  `allow_internal_distribution` | Specifies that the created xcframework contains information not suitable for public distribution | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `create_xcframework` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::XCFRAMEWORK_PATH` | Location of the generated xcframework

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action create_xcframework
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run create_xcframework
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run create_xcframework parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_xcframework.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
