# backup_xcarchive


Save your [zipped] xcarchive elsewhere from default path







backup_xcarchive |
-----|----
Supported platforms | ios, mac
Author | @dral3x



**1 Example**

```ruby
backup_xcarchive(
  xcarchive: "/path/to/file.xcarchive", # Optional if you use the `xcodebuild` action
  destination: "/somewhere/else/file.xcarchive", # Where the backup should be created
  zip: false, # Enable compression of the archive. Defaults to `true`.
  versioned: true # Create a versioned (date and app version) subfolder where to put the archive. Default value `true`
)
```





**Parameters**

Key | Description
----|------------
  `xcarchive` | Path to your xcarchive file. Optional if you use the `xcodebuild` action
  `destination` | Where your archive will be placed
  `zip` | Enable compression of the archive. Default value `true`
  `versioned` | Create a versioned (date and app version) subfolder where to put the archive. Default value `true`




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action backup_xcarchive
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/backup_xcarchive.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
