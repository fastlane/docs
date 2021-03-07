<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_no_debug_code.rb
-->

# ensure_no_debug_code


Ensures the given text is nowhere in the code base




> You don't want any debug code to slip into production.<br>This can be used to check if there is any debug code still in your codebase or if you have things like `// TO DO` or similar.


ensure_no_debug_code ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 5 Examples

```ruby
ensure_no_debug_code(text: "// TODO")
```

```ruby
ensure_no_debug_code(text: "Log.v",
      extension: "java")
```

```ruby
ensure_no_debug_code(text: "NSLog",
 path: "./lib",
      extension: "m")
```

```ruby
ensure_no_debug_code(text: "(^#define DEBUG|NSLog)",
 path: "./lib",
      extension: "m")
```

```ruby
ensure_no_debug_code(text: "<<<<<<",
     extensions: ["m", "swift", "java"])
```





## Parameters

Key | Description | Default
----|-------------|--------
  `text` | The text that must not be in the code base | 
  `path` | The directory containing all the source files | `.`
  `extension` | The extension that should be searched for | 
  `extensions` | An array of file extensions that should be searched for | 
  `exclude` | Exclude a certain pattern from the search | 
  `exclude_dirs` | An array of dirs that should not be included in the search | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_no_debug_code
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_no_debug_code
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_no_debug_code parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_no_debug_code.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
