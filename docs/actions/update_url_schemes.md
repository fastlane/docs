<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# update_url_schemes


Updates the URL schemes in the given Info.plist




> This action allows you to update the URL schemes of the app before building it.
For example, you can use this to set a different url scheme for the alpha
or beta version of the app.


update_url_schemes |
-----|----
Supported platforms | ios, mac
Author | @kmikael



## 1 Example

```ruby
update_url_schemes(
  path: "path/to/Info.plist",
  url_schemes: ["com.myapp"]
)
```





## Parameters

Key | Description
----|------------
  `path` | The Plist file's path
  `url_schemes` | The new URL schemes




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_url_schemes
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_url_schemes.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
