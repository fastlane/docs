<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# rsync


Rsync files from :source to :destination




> A wrapper around rsync, rsync is a tool that lets you synchronize files, including permissions and so on for a more detailed information about rsync please see rsync(1) manpage.


rsync |
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



**1 Example**

```ruby
rsync(
  source: "root@host:/tmp/1.txt",
  destination: "/tmp/local_file.txt"
)
```





**Parameters**

Key | Description
----|------------
  `extra` | Port
  `source` | source file/folder
  `destination` | destination file/folder




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action rsync
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/rsync.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
