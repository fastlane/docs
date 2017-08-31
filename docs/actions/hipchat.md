# hipchat


Send a error/success message to HipChat




> Send a message to **room** (by default) or a direct message to **@username** with success (green) or failure (red) status.


hipchat |
-----|----
Supported platforms | ios, android, mac
Author | @jingx23



**1 Example**

```ruby
hipchat(
  message: "App successfully released!",
  message_format: "html", # or "text", defaults to "html"
  channel: "Room or @username",
  success: true
)
```





**Parameters**

Key | Description
----|------------
  `message` | The message to post on HipChat
  `channel` | The room or @username
  `api_token` | Hipchat API Token
  `custom_color` | Specify a custom color, this overrides the success boolean. Can be one of 'yellow', 'red', 'green', 'purple', 'gray', or 'random'
  `success` | Was this build successful? (true/false)
  `version` | Version of the Hipchat API. Must be 1 or 2
  `notify_room` | Should the people in the room be notified? (true/false)
  `api_host` | The host of the HipChat-Server API
  `message_format` | Format of the message to post. Must be either 'html' or 'text'
  `include_html_header` | Should html formatted messages include a preformatted header? (true/false)
  `from` | Name the message will appear to be sent from




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action hipchat
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hipchat.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
