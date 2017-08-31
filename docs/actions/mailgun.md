# mailgun


Send a success/error message to an email group







mailgun |
-----|----
Supported platforms | ios, android, mac
Author | @thiagolioy



**2 Examples**

```ruby
mailgun(
  to: "fastlane@krausefx.com",
  success: true,
  message: "This is the mail's content"
)
```

```ruby
mailgun(
  postmaster: "MY_POSTMASTER",
  apikey: "MY_API_KEY",
  to: "DESTINATION_EMAIL",
  from: "EMAIL_FROM_NAME",
  reply_to: "EMAIL_REPLY_TO",
  success: true,
  message: "Mail Body",
  app_link: "http://www.myapplink.com",
  ci_build_link: "http://www.mycibuildlink.com",
  template_path: "HTML_TEMPLATE_PATH",
  attachment: "dirname/filename.ext"
)
```





**Parameters**

Key | Description
----|------------
  `mailgun_sandbox_domain` | Mailgun sandbox domain postmaster for your mail. Please use postmaster instead
  `mailgun_sandbox_postmaster` | Mailgun sandbox domain postmaster for your mail. Please use postmaster instead
  `mailgun_apikey` | Mailgun apikey for your mail. Please use postmaster instead
  `postmaster` | Mailgun sandbox domain postmaster for your mail
  `apikey` | Mailgun apikey for your mail
  `to` | Destination of your mail
  `from` | Mailgun sender name
  `message` | Message of your mail
  `subject` | Subject of your mail
  `success` | Was this build successful? (true/false)
  `app_link` | App Release link
  `ci_build_link` | CI Build Link
  `template_path` | Mail HTML template
  `reply_to` | Mail Reply to
  `attachment` | Mail Attachment filenames, either an array or just one string




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action mailgun
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/mailgun.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
