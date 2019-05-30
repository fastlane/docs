<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/twitter.rb
-->

# twitter


Post a tweet on [Twitter.com](https://twitter.com)




> Post a tweet on Twitter. Requires you to setup an app on [twitter.com](https://twitter.com) and obtain `consumer` and `access_token`.


twitter ||
---|---
Supported platforms | ios, android, mac
Author | @hjanuschka



## 1 Example

```ruby
twitter(
  access_token: "XXXX",
  access_token_secret: "xxx",
  consumer_key: "xxx",
  consumer_secret: "xxx",
  message: "You rock!"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `consumer_key` | Consumer Key | 
  `consumer_secret` | Consumer Secret | 
  `access_token` | Access Token | 
  `access_token_secret` | Access Token Secret | 
  `message` | The tweet | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action twitter
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run twitter
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run twitter parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/twitter.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
