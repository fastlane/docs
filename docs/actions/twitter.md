# twitter


Post a tweet on Twitter.com




> Post a tweet on twitter. Requires you to setup an app on twitter.com and obtain consumer and access_token.


twitter |
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



**1 Example**

```ruby
twitter(
  access_token: "XXXX",
  access_token_secret: "xxx",
  consumer_key: "xxx",
  consumer_secret: "xxx",
  message: "You rock!"
)
```





**Parameters**

Key | Description
----|------------
  `consumer_key` | Consumer Key
  `consumer_secret` | Consumer Secret
  `access_token` | Access Token
  `access_token_secret` | Access Token Secret
  `message` | The tweet




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action twitter
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/twitter.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
