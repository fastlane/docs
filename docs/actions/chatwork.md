# chatwork


Send a success/error message to ChatWork




> Information on how to obtain an API token: http://developer.chatwork.com/ja/authenticate.html


chatwork |
-----|----
Supported platforms | ios, android, mac
Author | @astronaughts



**1 Example**

```ruby
chatwork(
  message: "App successfully released!",
  roomid: 12345,
  success: true,
  api_token: "Your Token"
)
```





**Parameters**

Key | Description
----|------------
  `api_token` | ChatWork API Token
  `message` | The message to post on ChatWork
  `roomid` | The room ID
  `success` | Was this build successful? (true/false)




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action chatwork
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/chatwork.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
