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
To show the documentation in your terminal, run
```no-highlight
fastlane action update_plist
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_plist.rb" target="_blank">View source code</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
