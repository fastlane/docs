<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# setup_circle_ci


Setup the keychain and match to work with CircleCI




> - Creates a new temporary keychain for use with match
- Switches match to `readonly` mode to not create new profiles/cert on CI
- Sets up log and test result paths to be easily collectible
This action helps with CircleCI integration, add this to the top of your Fastfile if you use CircleCI


setup_circle_ci |
-----|----
Supported platforms | ios, mac
Author | @dantoml



## 1 Example

```ruby
setup_circle_ci
```





## Parameters

Key | Description | Default
----|-------------|--------
  `force` | Force setup, even if not executed by CircleCI | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action setup_circle_ci
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/setup_circle_ci.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
