<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_url_schemes.rb
-->

# update_url_schemes


Updates the URL schemes in the given Info.plist




> This action allows you to update the URL schemes of the app before building it.<br>For example, you can use this to set a different URL scheme for the alpha or beta version of the app.


update_url_schemes ||
---|---
Supported platforms | ios, mac
Author | @kmikael



## 2 Examples

```ruby
update_url_schemes(
  path: "path/to/Info.plist",
  url_schemes: ["com.myapp"]
)
```

```ruby
update_url_schemes(
  path: "path/to/Info.plist",
  update_url_schemes: proc do |schemes|
    schemes + ["anotherscheme"]
  end
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | The Plist file's path | 
  `url_schemes` | The new URL schemes | 
  `update_url_schemes` | Block that is called to update schemes with current schemes passed in as parameter | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_url_schemes
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_url_schemes
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_url_schemes parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_url_schemes.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
