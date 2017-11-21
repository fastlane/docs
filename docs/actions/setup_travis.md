<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# setup_travis


Setup the keychain and match to work with Travis CI




> - Creates a new temporary keychain for use with match
- Switches match to `readonly` mode to not create new profiles/cert on CI
This action helps with Travis integration, add this to the top of your Fastfile if you use Travis


setup_travis |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



**1 Example**

```ruby
setup_travis
```





**Parameters**

Key | Description
----|------------
  `force` | Force setup, even if not executed by travis




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action setup_travis
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/setup_travis.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
