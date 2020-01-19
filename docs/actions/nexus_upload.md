<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/nexus_upload.rb
-->

# nexus_upload


Upload a file to [Sonatype Nexus platform](https://www.sonatype.com)







nexus_upload ||
---|---
Supported platforms | ios, android, mac
Author | @xfreebird, @mdio



## 2 Examples

```ruby
# for Nexus 2
nexus_upload(
  file: "/path/to/file.ipa",
  repo_id: "artefacts",
  repo_group_id: "com.fastlane",
  repo_project_name: "ipa",
  repo_project_version: "1.13",
  repo_classifier: "dSYM", # Optional
  endpoint: "http://localhost:8081",
  username: "admin",
  password: "admin123"
)
```

```ruby
# for Nexus 3
nexus_upload(
  nexus_version: 3,
  mount_path: "",
  file: "/path/to/file.ipa",
  repo_id: "artefacts",
  repo_group_id: "com.fastlane",
  repo_project_name: "ipa",
  repo_project_version: "1.13",
  repo_classifier: "dSYM", # Optional
  endpoint: "http://localhost:8081",
  username: "admin",
  password: "admin123"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `file` | File to be uploaded to Nexus | 
  `repo_id` | Nexus repository id e.g. artefacts | 
  `repo_group_id` | Nexus repository group id e.g. com.company | 
  `repo_project_name` | Nexus repository commandect name. Only letters, digits, underscores(_), hyphens(-), and dots(.) are allowed | 
  `repo_project_version` | Nexus repository commandect version | 
  `repo_classifier` | Nexus repository artifact classifier (optional) | 
  `endpoint` | Nexus endpoint e.g. http://nexus:8081 | 
  `mount_path` | Nexus mount path (Nexus 3 instances have this configured as empty by default) | `/nexus`
  `username` | Nexus username | 
  `password` | Nexus password | 
  `ssl_verify` | Verify SSL | `true`
  `nexus_version` | Nexus major version | `2`
  `verbose` | Make detailed output | `false`
  `proxy_username` | Proxy username | 
  `proxy_password` | Proxy password | 
  `proxy_address` | Proxy address | 
  `proxy_port` | Proxy port | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action nexus_upload
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run nexus_upload
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run nexus_upload parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/nexus_upload.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
