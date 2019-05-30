<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_commit.rb
-->

# git_commit


Directly commit the given file with the given message







git_commit ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 4 Examples

```ruby
git_commit(path: "./version.txt", message: "Version Bump")
```

```ruby
git_commit(path: ["./version.txt", "./changelog.txt"], message: "Version Bump")
```

```ruby
git_commit(path: ["./*.txt", "./*.md"], message: "Update documentation")
```

```ruby
git_commit(path: ["./*.txt", "./*.md"], message: "Update documentation", skip_git_hooks: true)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | The file you want to commit | 
  `message` | The commit message that should be used | 
  `skip_git_hooks` | Set to true to pass --no-verify to git | 
  `allow_nothing_to_commit` | Set to true to allow commit without any git changes | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action git_commit
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_commit
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_commit parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_commit.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
