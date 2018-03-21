<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# sh


Runs a shell command




> Allows running an arbitrary shell command.
Be aware of a specific behavior of 'sh' action with regard to the working directory. For details refer to Advanced.md


sh |
-----|----
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
To show the documentation in your terminal, run
```no-highlight
fastlane action sh
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sh.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
