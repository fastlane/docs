<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/backup_xcarchive.rb
-->

# backup_xcarchive


Save your [zipped] xcarchive elsewhere from default path







backup_xcarchive ||
---|---
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



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `backup_xcarchive` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::BACKUP_XCARCHIVE_FILE` | Path to your saved xcarchive (compressed) file

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action backup_xcarchive
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run backup_xcarchive
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run backup_xcarchive parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/backup_xcarchive.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
