<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# notification


Display a macOS notification with custom message and title







notification |
-----|----
Supported platforms | ios, android, mac
Author | @champo, @cbowns, @KrauseFx, @amarcadet, @dusek



## 1 Example

```ruby
notification(subtitle: "Finished Building", message: "Ready to upload...")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `title` | The title to display in the notification | fastlane
  `subtitle` | A subtitle to display in the notification | -
  `message` | The message to display in the notification | -
  `sound` | The name of a sound to play when the notification appears (names are listed in Sound Preferences) | -
  `activate` | Bundle identifier of application to be opened when the notification is clicked | -
  `app_icon` | The URL of an image to display instead of the application icon (Mavericks+ only) | -
  `content_image` | The URL of an image to display attached to the notification (Mavericks+ only) | -
  `open` | URL of the resource to be opened when the notification is clicked | -
  `execute` | Shell command to run when the notification is clicked | -

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action notification
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/notification.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
