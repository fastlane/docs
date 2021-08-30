<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/jira.rb
-->

# jira


Leave a comment on a Jira ticket







jira ||
---|---
Supported platforms | ios, android, mac
Author | @iAmChrisTruman, @crazymanish
Returns | A hash containing all relevant information of the Jira comment<br>Access Jira comment 'id', 'author', 'body', and more



## 3 Examples

```ruby
jira(
  url: "https://bugs.yourdomain.com",
  username: "Your username",
  password: "Your password or API token",
  ticket_id: "IOS-123",
  comment_text: "Text to post as a comment"
)
```

```ruby
jira(
  url: "https://yourserverdomain.com",
  context_path: "/jira",
  username: "Your username",
  password: "Your password or API token",
  ticket_id: "IOS-123",
  comment_text: "Text to post as a comment"
)
```

```ruby
jira(
  ticket_id: "IOS-123",
  comment_text: "Text to post as a comment",
  fail_on_error: false
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `url` | URL for Jira instance | 
  `context_path` | Appends to the url (ex: "/jira") | `''`
  `username` | Username for Jira instance | 
  `password` | Password or API token for Jira | 
  `ticket_id` | Ticket ID for Jira, i.e. IOS-123 | 
  `comment_text` | Text to add to the ticket as a comment | 
  `fail_on_error` | Should an error adding the Jira comment cause a failure? | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `jira` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::JIRA_JSON` | The whole Jira API JSON object

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action jira
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run jira
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run jira parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/jira.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/generated/actions/"><b>Back to actions</b></a>
