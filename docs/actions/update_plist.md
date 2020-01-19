<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_plist.rb
-->

# update_plist


Update a plist file




> This action allows you to modify any `plist` file.


update_plist ||
---|---
Supported platforms | ios
Author | @rishabhtayal



## 1 Example

```ruby
update_plist( # Advanced processing: find URL scheme for particular key and replace value
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
  `plist_path` | Path to plist file | 
  `block` | A block to process plist with custom logic | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_plist
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_plist
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_plist parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_plist.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
