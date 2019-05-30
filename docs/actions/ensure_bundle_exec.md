<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_bundle_exec.rb
-->

# ensure_bundle_exec


Raises an exception if not using `bundle exec` to run fastlane




> This action will check if you are using bundle exec to run fastlane.<br>You can put it into `before_all` and make sure that fastlane is run using `bundle exec fastlane` command.


ensure_bundle_exec ||
---|---
Supported platforms | ios, android, mac
Author | @rishabhtayal



## 1 Example

```ruby
ensure_bundle_exec
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_bundle_exec
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_bundle_exec
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_bundle_exec parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_bundle_exec.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
