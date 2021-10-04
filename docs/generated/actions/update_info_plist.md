<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_info_plist.rb
-->

# update_info_plist


Update a Info.plist file with bundle identifier and display name




> This action allows you to modify your `Info.plist` file before building. This may be useful if you want a separate build for alpha, beta or nightly builds, but don't want a separate target.


update_info_plist ||
---|---
Supported platforms | ios
Author | @tobiasstrebitzer



## 4 Examples

```ruby
update_info_plist( # update app identifier string
  plist_path: "path/to/Info.plist",
  app_identifier: "com.example.newappidentifier"
)
```

```ruby
update_info_plist( # Change the Display Name of your app
  plist_path: "path/to/Info.plist",
  display_name: "MyApp-Beta"
)
```

```ruby
update_info_plist( # Target a specific `xcodeproj` rather than finding the first available one
  xcodeproj: "path/to/Example.proj",
  plist_path: "path/to/Info.plist",
  display_name: "MyApp-Beta"
)
```

```ruby
update_info_plist( # Advanced processing: find URL scheme for particular key and replace value
  xcodeproj: "path/to/Example.proj",
  plist_path: "path/to/Info.plist",
  block: proc do |plist|
    urlScheme = plist["CFBundleURLTypes"].find{|scheme| scheme["CFBundleURLName"] == "com.acme.default-url-handler"}
    urlScheme[:CFBundleURLSchemes] = ["acme-production"]
  end
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `xcodeproj` | Path to your Xcode project | 
  `plist_path` | Path to info plist | 
  `scheme` | Scheme of info plist | 
  `app_identifier` | The App Identifier of your app | [*](#parameters-legend-dynamic)
  `display_name` | The Display Name of your app | 
  `block` | A block to process plist with custom logic | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_info_plist
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_info_plist
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_info_plist parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_info_plist.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
