<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/chatwork.rb
-->

# chatwork


Send a success/error message to [ChatWork](https://go.chatwork.com/)




> Information on how to obtain an API token: [http://developer.chatwork.com/ja/authenticate.html](http://developer.chatwork.com/ja/authenticate.html)


chatwork ||
---|---
Supported platforms | ios, android, mac
Author | @astronaughts



## 1 Example

```ruby
chatwork(
  message: "App successfully released!",
  roomid: 12345,
  success: true,
  api_token: "Your Token"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_token` | ChatWork API Token | 
  `message` | The message to post on ChatWork | 
  `roomid` | The room ID | 
  `success` | Was this build successful? (true/false) | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action chatwork
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run chatwork
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run chatwork parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/chatwork.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
