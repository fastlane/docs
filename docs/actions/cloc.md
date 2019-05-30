<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/cloc.rb
-->

# cloc


Generates a Code Count that can be read by Jenkins (xml format)




> This action will run cloc to generate a SLOC report that the Jenkins SLOCCount plugin can read.<br>See [https://wiki.jenkins-ci.org/display/JENKINS/SLOCCount+Plugin](https://wiki.jenkins-ci.org/display/JENKINS/SLOCCount+Plugin) and [https://github.com/AlDanial/cloc](https://github.com/AlDanial/cloc) for more information.


cloc ||
---|---
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
  `binary_path` | Where the cloc binary lives on your system (full path including 'cloc') | `/usr/local/bin/cloc`
  `exclude_dir` | Comma separated list of directories to exclude | 
  `output_directory` | Where to put the generated report file | `build`
  `source_directory` | Where to look for the source code (relative to the project root folder) | `''`
  `xml` | Should we generate an XML File (if false, it will generate a plain text file)? | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action cloc
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run cloc
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run cloc parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/cloc.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
