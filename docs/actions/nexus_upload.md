<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# nexus_upload


Upload a file to Sonatype Nexus platform







nexus_upload |
-----|----
Supported platforms | ios, android, mac
Author | @xfreebird



## 1 Example

```ruby
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
  `mount_path` | Nexus mount path | `/nexus`
  `username` | Nexus username | 
  `password` | Nexus password | 
  `ssl_verify` | Verify SSL | `true`
  `verbose` | Make detailed output | `false`
  `proxy_username` | Proxy username | 
  `proxy_password` | Proxy password | 
  `proxy_address` | Proxy address | 
  `proxy_port` | Proxy port | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action nexus_upload
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/nexus_upload.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
