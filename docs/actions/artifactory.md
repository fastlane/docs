<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# artifactory


This action uploads an artifact to artifactory







artifactory |
-----|----
Supported platforms | ios, android, mac
Author | @koglinjg, @tommeier



## 1 Example

```ruby
artifactory(
  username: "username",
  password: "password",
  endpoint: "https://artifactory.example.com/artifactory/",
  file: "example.ipa",  # File to upload
  repo: "mobile_artifacts",       # Artifactory repo
  repo_path: "/ios/appname/example-major.minor.ipa"   # Path to place the artifact including its filename
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `file` | File to be uploaded to artifactory | 
  `repo` | Artifactory repo to put the file in | 
  `repo_path` | Path to deploy within the repo, including filename | 
  `endpoint` | Artifactory endpoint | 
  `username` | Artifactory username | 
  `password` | Artifactory password | 
  `properties` | Artifact properties hash | `{}`
  `ssl_pem_file` | Location of pem file to use for ssl verification | 
  `ssl_verify` | Verify SSL | `true`
  `proxy_username` | Proxy username | 
  `proxy_password` | Proxy password | 
  `proxy_address` | Proxy address | 
  `proxy_port` | Proxy port | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action artifactory
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/artifactory.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
