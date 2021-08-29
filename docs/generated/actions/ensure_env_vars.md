<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_env_vars.rb
-->

# ensure_env_vars


Raises an exception if the specified env vars are not set




> This action will check if some environment variables are set.


ensure_env_vars ||
---|---
Supported platforms | ios, android, mac
Author | @revolter



## 1 Example

```ruby
ensure_env_vars(
  env_vars: ['GITHUB_USER_NAME', 'GITHUB_API_TOKEN']
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `env_vars` | The environment variables names that should be checked | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_env_vars
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_env_vars
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_env_vars parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_env_vars.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
