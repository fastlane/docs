<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# spm


Runs Swift Package Manager on your project







spm |
-----|----
Supported platforms | ios, android, mac
Author | @Flávio Caetano (@fjcaetano)



## 2 Examples

```ruby
spm
```

```ruby
spm(
  command: "build",
  build_path: "./build",
  configuration: "release"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `command` | The swift command (one of: build, test, clean, reset, update) | `build`
  `build_path` | Specify build/cache directory [default: ./.build] | 
  `package_path` | Change working directory before any other operation | 
  `configuration` | Build with configuration (debug|release) [default: debug] | 
  `verbose` | Increase verbosity of informational output | `false`

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action spm
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/spm.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
