<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/dotgpg_environment.rb
-->

# dotgpg_environment


Reads in production secrets set in a dotgpg file and puts them in ENV




> More information about dotgpg can be found at [https://github.com/ConradIrwin/dotgpg](https://github.com/ConradIrwin/dotgpg).


dotgpg_environment ||
---|---
Supported platforms | ios, android, mac
Author | @simonlevy5



## 1 Example

```ruby
dotgpg_environment(dotgpg_file: './path/to/gpgfile')
```





## Parameters

Key | Description | Default
----|-------------|--------
  `dotgpg_file` | Path to your gpg file | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action dotgpg_environment
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run dotgpg_environment
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run dotgpg_environment parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/dotgpg_environment.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
