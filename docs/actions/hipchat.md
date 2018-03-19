<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# hipchat


Send a error/success message to HipChat




> Send a message to **room** (by default) or a direct message to **@username** with success (green) or failure (red) status.


hipchat |
-----|----
Supported platforms | ios, android, mac
Author | @jingx23



## 1 Example

```ruby
hipchat(
  message: "App successfully released!",
  message_format: "html", # or "text", defaults to "html"
  channel: "Room or @username",
  success: true
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `message` | The message to post on HipChat | `''`
  `channel` | The room or @username | 
  `api_token` | Hipchat API Token | 
  `custom_color` | Specify a custom color, this overrides the success boolean. Can be one of 'yellow', 'red', 'green', 'purple', 'gray', or 'random' | 
  `success` | Was this build successful? (true/false) | `true`
  `version` | Version of the Hipchat API. Must be 1 or 2 | 
  `notify_room` | Should the people in the room be notified? (true/false) | `false`
  `api_host` | The host of the HipChat-Server API | `api.hipchat.com`
  `message_format` | Format of the message to post. Must be either 'html' or 'text' | `html`
  `include_html_header` | Should html formatted messages include a preformatted header? (true/false) | `true`
  `from` | Name the message will appear to be sent from | `fastlane`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action hipchat
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/hipchat.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
