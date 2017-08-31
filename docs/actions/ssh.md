# ssh


Allows remote command execution using ssh




> Lets you execute remote commands via ssh using username/password or ssh-agent. If one of the commands in command-array returns non 0 - it fails.


ssh |
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



**1 Example**

```ruby
ssh(
  host: "dev.januschka.com",
  username: "root",
  commands: [
    "date",
    "echo 1 > /tmp/file1"
  ]
)
```





**Parameters**

Key | Description
----|------------
  `username` | Username
  `password` | Password
  `host` | Hostname
  `port` | Port
  `commands` | Commands
  `log` | Log commands and output




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action ssh
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ssh.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
