<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# splunkmint


Upload dSYM file to Splunk MINT







splunkmint |
-----|----
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
To show the documentation in your terminal, run
```no-highlight
fastlane action splunkmint
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/splunkmint.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
