<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_remote_branch.rb
-->

# git_remote_branch


Returns the name of the current git remote default branch




> If no default remote branch could be found, this action will return nil. This is a wrapper for the internal action Actions.git_default_remote_branch_name


git_remote_branch ||
---|---
Supported platforms | ios, android, mac
Author | @SeanMcNeil



## 2 Examples

```ruby
git_remote_branch # Query git for first available remote name
```

```ruby
git_remote_branch(remote_name:"upstream") # Provide a remote name
```





## Parameters

Key | Description | Default
----|-------------|--------
  `remote_name` | The remote repository to check | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action git_remote_branch
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_remote_branch
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_remote_branch parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_remote_branch.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/generated/actions/"><b>Back to actions</b></a>
