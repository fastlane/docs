<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_no_debug_code.rb
-->

# ensure_no_debug_code


Ensures the given text is nowhere in the code base




> You don't want any debug code to slip into production. This can be used
to check if there is any debug code still in your code base or if you have
things like // TO DO or similar


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
To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_no_debug_code
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_no_debug_code.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
