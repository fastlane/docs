<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clean_cocoapods_cache.rb
-->

# clean_cocoapods_cache


Remove the cache for pods







clean_cocoapods_cache ||
---|---
Supported platforms | ios, mac
Author | @alexmx



## 2 Examples

```ruby
clean_cocoapods_cache
```

```ruby
clean_cocoapods_cache(name: "CACHED_POD")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `name` | Pod name to be removed from cache | 
  `no_ansi` | Show output without ANSI codes | `false`
  `verbose` | Show more debugging information | `false`
  `silent` | Show nothing | `false`
  `allow_root` | Allows CocoaPods to run as root | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action clean_cocoapods_cache
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run clean_cocoapods_cache
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run clean_cocoapods_cache parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clean_cocoapods_cache.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
