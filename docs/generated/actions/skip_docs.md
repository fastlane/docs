<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/skip_docs.rb
-->

# skip_docs


Skip the creation of the fastlane/README.md file when running fastlane




> Tell _fastlane_ to not automatically create a `fastlane/README.md` when running _fastlane_. You can always trigger the creation of this file manually by running `fastlane docs`.


skip_docs ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 1 Example

```ruby
skip_docs
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action skip_docs
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run skip_docs
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run skip_docs parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/skip_docs.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
