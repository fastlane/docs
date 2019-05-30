<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/number_of_commits.rb
-->

# number_of_commits


Return the number of commits in current git branch




> You can use this action to get the number of commits of this branch. This is useful if you want to set the build number to the number of commits. See `fastlane actions number_of_commits` for more details.


number_of_commits ||
---|---
Supported platforms | ios, android, mac
Author | @onevcat, @samuelbeek
Returns | The total number of all commits in current git branch



## 2 Examples

```ruby
increment_build_number(build_number: number_of_commits)
```

```ruby
build_number = number_of_commits(all: true)
increment_build_number(build_number: number_of_commits)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `all` | Returns number of all commits instead of current branch | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action number_of_commits
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run number_of_commits
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run number_of_commits parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/number_of_commits.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
