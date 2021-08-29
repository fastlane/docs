<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sh.rb
-->

# sh


Runs a shell command




> Allows running an arbitrary shell command.<br>Be aware of a specific behavior of `sh` action with regard to the working directory. For details, refer to [Advanced](https://docs.fastlane.tools/advanced/#directory-behavior).


sh ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx
Returns | Outputs the string and executes it. When running in tests, it returns the actual command instead of executing it



## 2 Examples

```ruby
sh("ls")
```

```ruby
sh("git", "commit", "-m", "My message")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `command` | Shell command to be executed | 
  `log` | Determines whether fastlane should print out the executed command itself and output of the executed command. If command line option --troubleshoot is used, then it overrides this option to true | `true`
  `error_callback` | A callback invoked with the command output if there is a non-zero exit status | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action sh
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run sh
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run sh parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sh.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
