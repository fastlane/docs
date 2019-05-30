<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_from_git.rb
-->

# import_from_git


Import another Fastfile from a remote git repository to use its lanes




> This is useful if you have shared lanes across multiple apps and you want to store the Fastfile in a remote git repository.


import_from_git ||
---|---
Supported platforms | ios, android, mac
Author | @fabiomassimo, @KrauseFx, @Liquidsoul



## 2 Examples

```ruby
import_from_git(
  url: "git@github.com:fastlane/fastlane.git", # The URL of the repository to import the Fastfile from.
  branch: "HEAD", # The branch to checkout on the repository
  path: "fastlane/Fastfile", # The path of the Fastfile in the repository
  version: "~> 1.0.0" # The version to checkout on the repository. Optimistic match operator can be used to select the latest version within constraints.
)
```

```ruby
import_from_git(
  url: "git@github.com:fastlane/fastlane.git", # The URL of the repository to import the Fastfile from.
  branch: "HEAD", # The branch to checkout on the repository
  path: "fastlane/Fastfile", # The path of the Fastfile in the repository
  version: [">= 1.1.0", "< 2.0.0"] # The version to checkout on the repository. Multiple conditions can be used to select the latest version within constraints.
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `url` | The URL of the repository to import the Fastfile from | 
  `branch` | The branch or tag to check-out on the repository | `HEAD`
  `path` | The path of the Fastfile in the repository | `fastlane/Fastfile`
  `version` | The version to checkout on the respository. Optimistic match operator or multiple conditions can be used to select the latest version within constraints | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action import_from_git
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run import_from_git
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run import_from_git parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_from_git.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
