<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/reset_simulator_contents.rb
-->

# reset_simulator_contents


Shutdown and reset running simulators







reset_simulator_contents ||
---|---
Supported platforms | ios
Author | @danramteke



## 2 Examples

```ruby
reset_simulator_contents
```

```ruby
reset_simulator_contents(os_versions: ["10.3.1","12.2"])
```





## Parameters

Key | Description | Default
----|-------------|--------
  `ios` | **DEPRECATED!** Use `:os_versions` instead - Which OS versions of Simulators you want to reset content and settings, this does not remove/recreate the simulators | 
  `os_versions` | Which OS versions of Simulators you want to reset content and settings, this does not remove/recreate the simulators | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action reset_simulator_contents
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run reset_simulator_contents
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run reset_simulator_contents parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/reset_simulator_contents.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
