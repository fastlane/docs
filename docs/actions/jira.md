<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/jira.rb
-->

# jira


Leave a comment on JIRA tickets







jira ||
---|---
Supported platforms | ios, android, mac
Author | @iAmChrisTruman



## 2 Examples

```ruby
jira(
  url: "https://bugs.yourdomain.com",
  username: "Your username",
  password: "Your password",
  ticket_id: "Ticket ID, i.e. IOS-123",
  comment_text: "Text to post as a comment"
)
```

```ruby
jira(
  url: "https://yourserverdomain.com",
  context_path: "/jira",
  username: "Your username",
  password: "Your password",
  ticket_id: "Ticket ID, i.e. IOS-123",
  comment_text: "Text to post as a comment"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `url` | URL for Jira instance | 
  `context_path` | Appends to the url (ex: "/jira") | `''`
  `username` | Username for JIRA instance | 
  `password` | Password for Jira | 
  `ticket_id` | Ticket ID for Jira, i.e. IOS-123 | 
  `comment_text` | Text to add to the ticket as a comment | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


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

<a href="/actions/"><b>Back to actions</b></a>
