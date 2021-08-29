<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/spaceship_stats.rb
-->

# spaceship_stats


Print out Spaceship stats from this session (number of request to each domain)







spaceship_stats ||
---|---
Supported platforms | ios, android, mac
Author | @joshdholtz



## 1 Example

```ruby
spaceship_stats
```





## Parameters

Key | Description | Default
----|-------------|--------
  `print_request_logs` | Print all URLs requested | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action spaceship_stats
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run spaceship_stats
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run spaceship_stats parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/spaceship_stats.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
