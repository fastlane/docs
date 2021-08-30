<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sourcedocs.rb
-->

# sourcedocs


Generate docs using SourceDocs







sourcedocs ||
---|---
Supported platforms | ios, mac
Author | @Kukurijek



## 2 Examples

```ruby
sourcedocs(output_folder: 'docs')
```

```ruby
sourcedocs(output_folder: 'docs', clean: true, reproducible: true, scheme: 'MyApp')
```





## Parameters

Key | Description | Default
----|-------------|--------
  `all_modules` | Generate documentation for all modules in a Swift package | 
  `spm_module` | Generate documentation for Swift Package Manager module | 
  `module_name` | Generate documentation for a Swift module | 
  `link_beginning` | The text to begin links with | 
  `link_ending` | The text to end links with (default: .md) | 
  `output_folder` | Output directory to clean (default: Documentation/Reference) | 
  `min_acl` | Access level to include in documentation [private, fileprivate, internal, public, open] (default: public) | 
  `module_name_path` | Include the module name as part of the output folder path | 
  `clean` | Delete output folder before generating documentation | 
  `collapsible` | Put methods, properties and enum cases inside collapsible blocks | 
  `table_of_contents` | Generate a table of contents with properties and methods for each type | 
  `reproducible` | Generate documentation that is reproducible: only depends on the sources | 
  `scheme` | Create documentation for specific scheme | 
  `sdk_platform` | Create documentation for specific sdk platform | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action sourcedocs
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run sourcedocs
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run sourcedocs parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sourcedocs.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/generated/actions/"><b>Back to actions</b></a>
