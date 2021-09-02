<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clear_derived_data.rb
-->

# clear_derived_data


Deletes the Xcode Derived Data




> Deletes the Derived Data from path set on Xcode or a supplied path


clear_derived_data ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx



## 2 Examples

```ruby
clear_derived_data
```

```ruby
clear_derived_data(derived_data_path: "/custom/")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `derived_data_path` | Custom path for derivedData | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action clear_derived_data
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run clear_derived_data
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run clear_derived_data parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clear_derived_data.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
