<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# backup_xcarchive


Save your [zipped] xcarchive elsewhere from default path







backup_xcarchive |
-----|----
Supported platforms | ios, mac
Author | @dral3x



## 1 Example

```ruby
backup_xcarchive(
  xcarchive: "/path/to/file.xcarchive", # Optional if you use the `xcodebuild` action
  destination: "/somewhere/else/", # Where the backup should be created
  zip_filename: "file.xcarchive", # The name of the backup file
  zip: false, # Enable compression of the archive. Defaults to `true`.
  versioned: true # Create a versioned (date and app version) subfolder where to put the archive
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcarchive` | Path to your xcarchive file. Optional if you use the `xcodebuild` action | [*](#parameters-legend-dynamic)
  `destination` | Where your archive will be placed | 
  `zip` | Enable compression of the archive | `true`
  `zip_filename` | Filename of the compressed archive. Will be appended by `.xcarchive.zip`. Default value is the output xcarchive filename | [*](#parameters-legend-dynamic)
  `versioned` | Create a versioned (date and app version) subfolder where to put the archive | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action backup_xcarchive
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/backup_xcarchive.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
