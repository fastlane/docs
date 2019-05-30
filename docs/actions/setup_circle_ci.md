<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/setup_circle_ci.rb
-->

# setup_circle_ci


Setup the keychain and match to work with CircleCI




> - Creates a new temporary keychain for use with match
- Switches match to `readonly` mode to not create new profiles/cert on CI
- Sets up log and test result paths to be easily collectible
>
This action helps with CircleCI integration. Add this to the top of your Fastfile if you use CircleCI.


setup_circle_ci ||
---|---
Supported platforms | ios, mac
Author | @dantoml



## 1 Example

```ruby
setup_circle_ci
```





## Parameters

Key | Description | Default
----|-------------|--------
  `force` | Force setup, even if not executed by CircleCI | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action setup_circle_ci
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run setup_circle_ci
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run setup_circle_ci parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/setup_circle_ci.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
