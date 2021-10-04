<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/spaceship_logs.rb
-->

# spaceship_logs


Find, print, and copy Spaceship logs







spaceship_logs ||
---|---
Supported platforms | ios, android, mac
Author | @joshdholtz
Returns | The array of Spaceship logs



## 5 Examples

```ruby
spaceship_logs
```

```ruby
spaceship_logs(
  copy_to_path: "/tmp/artifacts"
)
```

```ruby
spaceship_logs(
  copy_to_clipboard: true
)
```

```ruby
spaceship_logs(
  print_contents: true,
  print_paths: true
)
```

```ruby
spaceship_logs(
  latest: false,
  print_contents: true,
  print_paths: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `latest` | Finds only the latest Spaceshop log file if set to true, otherwise returns all | `true`
  `print_contents` | Prints the contents of the found Spaceship log file(s) | `false`
  `print_paths` | Prints the paths of the found Spaceship log file(s) | `false`
  `copy_to_path` | Copies the found Spaceship log file(s) to a directory | 
  `copy_to_clipboard` | Copies the contents of the found Spaceship log file(s) to the clipboard | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action spaceship_logs
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run spaceship_logs
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run spaceship_logs parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/spaceship_logs.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
