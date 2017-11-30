<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# add_git_tag


This will add an annotated git tag to the current branch




> This will automatically tag your build with the following format: `<grouping>/<lane>/<prefix><build_number>`, where:
- `grouping` is just to keep your tags organised under one 'folder', defaults to 'builds'
- `lane` is the name of the current fastlane lane
- `prefix` is anything you want to stick in front of the version number, e.g. 'v'
- `build_number` is the build number, which defaults to the value emitted by the `increment_build_number` action
For example for build 1234 in the 'appstore' lane it will tag the commit with `builds/appstore/1234`


add_git_tag |
-----|----
Supported platforms | ios, android, mac
Author | @lmirosevic, @maschall



## 3 Examples

```ruby
add_git_tag # simple tag with default values
```

```ruby
add_git_tag(
  grouping: "fastlane-builds",
  prefix: "v",
  build_number: 123
)
```

```ruby
# Alternatively, you can specify your own tag. Note that if you do specify a tag, all other arguments are ignored.
add_git_tag(
  tag: "my_custom_tag"
)
```





## Parameters

Key | Description
----|------------
  `tag` | Define your own tag text. This will replace all other parameters
  `grouping` | Is used to keep your tags organised under one 'folder'. Defaults to 'builds'
  `prefix` | Anything you want to put in front of the version number (e.g. 'v')
  `build_number` | The build number. Defaults to the result of increment_build_number if you're using it
  `message` | The tag message. Defaults to the tag's name
  `commit` | The commit or object where the tag will be set. Defaults to the current HEAD
  `force` | Force adding the tag
  `sign` | Make a GPG-signed tag, using the default e-mail address's key




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action add_git_tag
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/add_git_tag.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
