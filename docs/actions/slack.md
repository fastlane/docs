<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/slack.rb
-->

# slack


Send a success/error message to your [Slack](https://slack.com) group




> Create an Incoming WebHook and export this as `SLACK_URL`. Can send a message to **#channel** (by default), a direct message to **@username** or a message to a private group **group** with success (green) or failure (red) status.


slack ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 2 Examples

```ruby
slack(message: "App successfully released!")
```

```ruby
slack(
  message: "App successfully released!",
  channel: "#channel",  # Optional, by default will post to the default channel configured for the POST URL.
  success: true,        # Optional, defaults to true.
  payload: {  # Optional, lets you specify any number of your own Slack attachments.
    "Build Date" => Time.new.to_s,
    "Built by" => "Jenkins",
  },
  default_payloads: [:git_branch, :git_author], # Optional, lets you specify a whitelist of default payloads to include. Pass an empty array to suppress all the default payloads.
        # Don't add this key, or pass nil, if you want all the default payloads. The available default payloads are: `lane`, `test_result`, `git_branch`, `git_author`, `last_git_commit`, `last_git_commit_hash`.
  attachment_properties: { # Optional, lets you specify any other properties available for attachments in the slack API (see https://api.slack.com/docs/attachments).
       # This hash is deep merged with the existing properties set using the other properties above. This allows your own fields properties to be appended to the existing fields that were created using the `payload` property for instance.
    thumb_url: "http://example.com/path/to/thumb.png",
    fields: [{
      title: "My Field",
      value: "My Value",
      short: true
    }]
  }
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `message` | The message that should be displayed on Slack. This supports the standard Slack markup language | 
  `pretext` | This is optional text that appears above the message attachment block. This supports the standard Slack markup language | 
  `channel` | #channel or @username | 
  `use_webhook_configured_username_and_icon` | Use webhook's default username and icon settings? (true/false) | `false`
  `slack_url` | Create an Incoming WebHook for your Slack group | 
  `username` | Overrides the webhook's username property if use_webhook_configured_username_and_icon is false | `fastlane`
  `icon_url` | Overrides the webhook's image property if use_webhook_configured_username_and_icon is false | `https://s3-eu-west-1.amazonaws.com/fastlane.tools/fastlane.png`
  `payload` | Add additional information to this post. payload must be a hash containing any key with any value | `{}`
  `default_payloads` | Remove some of the default payloads. More information about the available payloads on GitHub | 
  `attachment_properties` | Merge additional properties in the slack attachment, see https://api.slack.com/docs/attachments | `{}`
  `success` | Was this build successful? (true/false) | `true`
  `fail_on_error` | Should an error sending the slack notification cause a failure? (true/false) | `true`
  `link_names` | Find and link channel names and usernames (true/false) | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action slack
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run slack
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run slack parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/slack.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
