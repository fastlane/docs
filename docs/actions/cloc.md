<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# cloc


Generates a Code Count that can be read by Jenkins (xml format)




> This action will run cloc to generate a SLOC report that the Jenkins SLOCCount plugin can read.
See https://wiki.jenkins-ci.org/display/JENKINS/SLOCCount+Plugin and https://github.com/AlDanial/cloc for more information.


cloc |
-----|----
Supported platforms | ios, mac
Author | @intere



## 1 Example

```ruby
cloc(
   exclude_dir: "ThirdParty,Resources",
   output_directory: "reports",
   source_directory: "MyCoolApp"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `binary_path` | Where the cloc binary lives on your system (full path including 'cloc') | /usr/local/bin/cloc
  `exclude_dir` | Comma separated list of directories to exclude | -
  `output_directory` | Where to put the generated report file | build
  `source_directory` | Where to look for the source code (relative to the project root folder) | 
  `xml` | Should we generate an XML File (if false, it will generate a plain text file)? | true

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action cloc
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/cloc.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
