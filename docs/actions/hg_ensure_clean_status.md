<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_ensure_clean_status.rb
-->

# hg_ensure_clean_status


Raises an exception if there are uncommitted hg changes




> Along the same lines as the [ensure_git_status_clean](https://docs.fastlane.tools/actions/ensure_git_status_clean/) action, this is a sanity check to ensure the working mercurial repo is clean. Especially useful to put at the beginning of your Fastfile in the `before_all` block.


hg_ensure_clean_status ||
---|---
Supported platforms | ios, android, mac
Author | @sjrmanning



## 1 Example

```ruby
hg_ensure_clean_status
```





<hr />

## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action hg_ensure_clean_status
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run hg_ensure_clean_status
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run hg_ensure_clean_status parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hg_ensure_clean_status.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
