<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/splunkmint.rb
-->

# splunkmint


Upload dSYM file to [Splunk MINT](https://mint.splunk.com/)







splunkmint ||
---|---
Supported platforms | ios
Author | @xfreebird



## 1 Example

```ruby
splunkmint(
  dsym: "My.app.dSYM.zip",
  api_key: "43564d3a",
  api_token: "e05456234c4869fb7e0b61"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `dsym` | dSYM.zip file to upload to Splunk MINT | 
  `api_key` | Splunk MINT App API key e.g. f57a57ca | 
  `api_token` | Splunk MINT API token e.g. e05ba40754c4869fb7e0b61 | 
  `verbose` | Make detailed output | `false`
  `upload_progress` | Show upload progress | `false`
  `proxy_username` | Proxy username | 
  `proxy_password` | Proxy password | 
  `proxy_address` | Proxy address | 
  `proxy_port` | Proxy port | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action splunkmint
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run splunkmint
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run splunkmint parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/splunkmint.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
