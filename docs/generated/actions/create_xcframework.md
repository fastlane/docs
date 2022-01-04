<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/create_xcframework.rb
-->

# create_xcframework


Package multiple build configs of a library/framework into a single xcframework




> Utility for packaging multiple build configurations of a given library<br>or framework into a single xcframework.<br><br>If you want to package several frameworks just provide one of:<br><br>  * An array containing the list of frameworks using the :frameworks parameter<br>    (if they have no associated dSYMs):<br>      ['FrameworkA.framework', 'FrameworkB.framework']<br><br>  * A hash containing the list of frameworks with their dSYMs using the<br>    :frameworks_with_dsyms parameter:<br>      {<br>        'FrameworkA.framework' => {},<br>        'FrameworkB.framework' => { dsyms: 'FrameworkB.framework.dSYM' }<br>      }<br><br>If you want to package several libraries just provide one of:<br><br>  * An array containing the list of libraries using the :libraries parameter<br>    (if they have no associated headers or dSYMs):<br>      ['LibraryA.so', 'LibraryB.so']<br><br>  * A hash containing the list of libraries with their headers and dSYMs<br>    using the :libraries_with_headers_or_dsyms parameter:<br>      {<br>        'LibraryA.so' => { dsyms: 'libraryA.so.dSYM' },<br>        'LibraryB.so' => { headers: 'headers' }<br>      }<br><br>Finally specify the location of the xcframework to be generated using the :output<br>parameter.<br>


create_xcframework ||
---|---
Supported platforms | ios, mac
Author | @jgongo



## 4 Examples

```ruby
create_xcframework(frameworks: ['FrameworkA.framework', 'FrameworkB.framework'], output: 'UniversalFramework.xcframework')
```

```ruby
create_xcframework(frameworks_with_dsyms: {'FrameworkA.framework' => {}, 'FrameworkB.framework' => { dsyms: 'FrameworkB.framework.dSYM' } }, output: 'UniversalFramework.xcframework')
```

```ruby
create_xcframework(libraries: ['LibraryA.so', 'LibraryB.so'], output: 'UniversalFramework.xcframework')
```

```ruby
create_xcframework(libraries_with_headers_or_dsyms: { 'LibraryA.so' => { dsyms: 'libraryA.so.dSYM' }, 'LibraryB.so' => { headers: 'LibraryBHeaders' } }, output: 'UniversalFramework.xcframework')
```





## Parameters

Key | Description | Default
----|-------------|--------
  `frameworks` | Frameworks (without dSYMs) to add to the target xcframework | 
  `frameworks_with_dsyms` | Frameworks (with dSYMs) to add to the target xcframework | 
  `libraries` | Libraries (without headers or dSYMs) to add to the target xcframework | 
  `libraries_with_headers_or_dsyms` | Libraries (with headers or dSYMs) to add to the target xcframework | 
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
