# adb


Run ADB Actions




> see adb --help for more details


adb |
-----|----
Supported platforms | android
Author | @hjanuschka
Returns | The output of the adb command



**1 Example**

```ruby
adb(
  command: "shell ls"
)
```





**Parameters**

Key | Description
----|------------
  `serial` | Android serial of the device to use for this command
  `command` | All commands you want to pass to the adb command, e.g. `kill-server`
  `adb_path` | The path to your `adb` binary




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action adb
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/adb.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
