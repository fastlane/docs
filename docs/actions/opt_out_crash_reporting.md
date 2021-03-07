<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/opt_out_crash_reporting.rb
-->

# opt_out_crash_reporting


This will prevent reports from being uploaded when _fastlane_ crashes




> _fastlane_ doesn't have crash reporting any more. Feel free to remove `opt_out_crash_reporting` from your Fastfile.


opt_out_crash_reporting ||
---|---
Supported platforms | ios, android, mac
Author | @mpirri, @ohayon





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action opt_out_crash_reporting
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run opt_out_crash_reporting
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run opt_out_crash_reporting parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/opt_out_crash_reporting.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
