<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/notification.rb
-->

# notification


Display a macOS notification with custom message and title







notification ||
---|---
Supported platforms | ios, android, mac
Author | @champo, @cbowns, @KrauseFx, @amarcadet, @dusek



## 1 Example

```ruby
notification(subtitle: "Finished Building", message: "Ready to upload...")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `title` | The title to display in the notification | `fastlane`
  `subtitle` | A subtitle to display in the notification | 
  `message` | The message to display in the notification | 
  `sound` | The name of a sound to play when the notification appears (names are listed in Sound Preferences) | 
  `activate` | Bundle identifier of application to be opened when the notification is clicked | 
  `app_icon` | The URL of an image to display instead of the application icon (Mavericks+ only) | 
  `content_image` | The URL of an image to display attached to the notification (Mavericks+ only) | 
  `open` | URL of the resource to be opened when the notification is clicked | 
  `execute` | Shell command to run when the notification is clicked | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action notification
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run notification
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run notification parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/notification.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
