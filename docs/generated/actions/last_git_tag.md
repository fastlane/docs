<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/last_git_tag.rb
-->

# last_git_tag


Get the most recent git tag




> If you are using this action on a **shallow clone**, *the default with some CI systems like Bamboo*, you need to ensure that you have also pulled all the git tags appropriately. Assuming your git repo has the correct remote set you can issue `sh('git fetch --tags')`.<br>Pattern parameter allows you to filter to a subset of tags.


last_git_tag ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx, @wedkarz



## 2 Examples

```ruby
last_git_tag
```

```ruby
last_git_tag(pattern: "release/v1.0/")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `pattern` | Pattern to filter tags when looking for last one. Limit tags to ones matching given shell glob. If pattern lacks ?, *, or [, * at the end is implied | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action last_git_tag
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run last_git_tag
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run last_git_tag parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/last_git_tag.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/generated/actions/"><b>Back to actions</b></a>
