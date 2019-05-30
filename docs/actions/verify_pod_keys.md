<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_pod_keys.rb
-->

# verify_pod_keys


Verifies all keys referenced from the Podfile are non-empty




> Runs a check against all keys specified in your Podfile to make sure they're more than a single character long. This is to ensure you don't deploy with stubbed keys.


verify_pod_keys ||
---|---
Supported platforms | ios, mac
Author | @ashfurrow



## 1 Example

```ruby
verify_pod_keys
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action verify_pod_keys
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run verify_pod_keys
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run verify_pod_keys parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/verify_pod_keys.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
