<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# increment_version_number


Increment the version number of your project




> This action will increment the version number. 
You first have to set up your Xcode project, if you haven't done it already:
https://developer.apple.com/library/ios/qa/qa1827/_index.html


increment_version_number |
-----|----
Supported platforms | ios, mac
Author | @serluca
Returns | The new version number



## 7 Examples

```ruby
increment_version_number # Automatically increment patch version number
```

```ruby
increment_version_number(
  bump_type: "patch" # Automatically increment patch version number
)
```

```ruby
increment_version_number(
  bump_type: "minor" # Automatically increment minor version number
)
```

```ruby
increment_version_number(
  bump_type: "major" # Automatically increment major version number
)
```

```ruby
increment_version_number(
  version_number: "2.1.1" # Set a specific version number
)
```

```ruby
increment_version_number(
  version_number: "2.1.1",      # specify specific version number (optional, omitting it increments patch version number)
  xcodeproj: "./path/to/MyApp.xcodeproj"  # (optional, you must specify the path to your main Xcode project if it is not in the project root directory)
)
```

```ruby
version = increment_version_number
```





## Parameters

Key | Description | Default
----|-------------|--------
  `bump_type` | The type of this version bump. Available: patch, minor, major | `patch`
  `version_number` | Change to a specific version. This will replace the bump type value | 
  `xcodeproj` | optional, you must specify the path to your main Xcode project if it is not in the project root directory | 

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action increment_version_number
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/increment_version_number.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
