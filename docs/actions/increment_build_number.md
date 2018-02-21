<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# increment_build_number


Increment the build number of your project







increment_build_number |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx
Returns | The new build number



## 4 Examples

```ruby
increment_build_number # automatically increment by one
```

```ruby
increment_build_number(
  build_number: "75" # set a specific number
)
```

```ruby
increment_build_number(
  build_number: 75, # specify specific build number (optional, omitting it increments by one)
  xcodeproj: "./path/to/MyApp.xcodeproj" # (optional, you must specify the path to your main Xcode project if it is not in the project root directory)
)
```

```ruby
build_number = increment_build_number
```





## Parameters

Key | Description | Default
----|-------------|--------
  `build_number` | Change to a specific version | -
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | -

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action increment_build_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/increment_build_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
