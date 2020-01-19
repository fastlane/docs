<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_push.rb
-->

# hg_push


This will push changes to the remote hg repository




> The mercurial equivalent of [push_to_git_remote](https://docs.fastlane.tools/actions/push_to_git_remote/). Pushes your local commits to a remote mercurial repo. Useful when local changes such as adding a version bump commit or adding a tag are part of your lane’s actions.


hg_push ||
---|---
Supported platforms | ios, android, mac
Author | @sjrmanning



## 2 Examples

```ruby
hg_push
```

```ruby
hg_push(
  destination: "ssh://hg@repohost.com/owner/repo",
  force: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `force` | Force push to remote | `false`
  `destination` | The destination to push to | `''`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action hg_push
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hg_push
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hg_push parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_push.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
