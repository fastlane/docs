<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_pull.rb
-->

# git_pull


Executes a simple git pull command







git_pull ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx, @JaviSoto



## 2 Examples

```ruby
git_pull
```

```ruby
git_pull(only_tags: true) # only the tags, no commits
```





## Parameters

Key | Description | Default
----|-------------|--------
  `only_tags` | Simply pull the tags, and not bring new commits to the current branch from the remote | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action git_pull
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run git_pull
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run git_pull parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_pull.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
