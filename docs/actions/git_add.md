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
  `pathspec` | [DEPRECATED!] Use --path instead - The pathspec you want to add files from | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action git_add
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_add.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
