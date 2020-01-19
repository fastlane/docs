<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_add.rb
-->

# git_add


Directly add the given file or all files







git_add ||
---|---
Supported platforms | ios, android, mac
Author | @4brunu, @antondomashnev



## 7 Examples

```ruby
git_add
```

```ruby
git_add(path: "./version.txt")
```

```ruby
git_add(path: ["./version.txt", "./changelog.txt"])
```

```ruby
git_add(path: "./Frameworks/*", shell_escape: false)
```

```ruby
git_add(path: ["*.h", "*.m"], shell_escape: false)
```

```ruby
git_add(path: "./Frameworks/*", shell_escape: false)
```

```ruby
git_add(path: "*.txt", shell_escape: false)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | The file(s) and path(s) you want to add | 
  `shell_escape` | Shell escapes paths (set to false if using wildcards or manually escaping spaces in :path) | `true`
  `pathspec` | **DEPRECATED!** Use `--path` instead - The pathspec you want to add files from | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action git_add
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_add
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_add parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_add.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
