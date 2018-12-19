<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/zip.rb
-->

# zip


Compress a file or folder to a zip







zip ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx
Returns | The path to the output zip file



## 4 Examples

```ruby
zip
```

```ruby
zip(
  path: "MyApp.app",
  output_path: "Latest.app.zip"
)
```

```ruby
zip(
  path: "MyApp.app",
  output_path: "Latest.app.zip",
  verbose: false
)
```

```ruby
zip(
  path: "MyApp.app",
  output_path: "Latest.app.zip",
  verbose: false,
  symlinks: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to the directory or file to be zipped | 
  `output_path` | The name of the resulting zip file | 
  `verbose` | Enable verbose output of zipped file | `true`
  `password` | Encrypt the contents of the zip archive using a password | 
  `symlinks` | Store symbolic links as such in the zip archive | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action zip
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/zip.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
