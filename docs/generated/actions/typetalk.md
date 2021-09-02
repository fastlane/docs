<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/typetalk.rb
-->

# typetalk


Post a message to [Typetalk](https://www.typetalk.com/)







typetalk ||
---|---
Supported platforms | ios, android, mac
Author | @Nulab Inc.



## 1 Example

```ruby
typetalk(
  message: "App successfully released!",
  note_path: "ChangeLog.md",
  topicId: 1,
  success: true,
  typetalk_token: "Your Typetalk Token"
)
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action typetalk
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run typetalk
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run typetalk parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/typetalk.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
