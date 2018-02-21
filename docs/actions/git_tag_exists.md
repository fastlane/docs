<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# git_tag_exists


Checks if the git tag with the given name exists in the current repo







git_tag_exists |
-----|----
Supported platforms | ios, android, mac
Author | @antondomashnev
Returns | Boolean value whether the tag exists or not



## 1 Example

```ruby
if git_tag_exists(tag: "1.1.0")
  UI.message("Found it 🚀")
end
```





## Parameters

Key | Description | Default
----|-------------|--------
  `tag` | The tag name that should be checked | -

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action git_tag_exists
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/git_tag_exists.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
