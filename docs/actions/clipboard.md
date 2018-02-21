<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# clipboard


Copies a given string into the clipboard. Works only on macOS







clipboard |
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



## 2 Examples

```ruby
clipboard(value: "https://docs.fastlane.tools/")
```

```ruby
clipboard(value: lane_context[SharedValues::HOCKEY_DOWNLOAD_LINK] || "")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `value` | The string that should be copied into the clipboard | -

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action clipboard
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clipboard.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
