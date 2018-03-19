<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# twitter


Post a tweet on Twitter.com




> Post a tweet on twitter. Requires you to setup an app on twitter.com and obtain consumer and access_token.


twitter |
-----|----
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
To show the documentation in your terminal, run
```no-highlight
fastlane action twitter
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/twitter.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
