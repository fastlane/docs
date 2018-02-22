<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# jira


Leave a comment on JIRA tickets







jira |
-----|----
Supported platforms | ios, android, mac
Author | @iAmChrisTruman



## 1 Example

```ruby
jira(
  url: "https://bugs.yourdomain.com",
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
  `username` | Username for JIRA instance | 
  `password` | Password for Jira | 
  `ticket_id` | Ticket ID for Jira, i.e. IOS-123 | 
  `comment_text` | Text to add to the ticket as a comment | 

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action jira
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/jira.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
