<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/lcov.rb
-->

# lcov


Generates coverage data using lcov







lcov ||
---|---
Supported platforms | ios, mac
Author | @thiagolioy



## 1 Example

```ruby
lcov(
  project_name: "ProjectName",
  scheme: "yourScheme",
  output_dir: "cov_reports" # This value is optional. Default is coverage_reports
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `project_name` | Name of the project | 
  `scheme` | Scheme of the project | 
  `arch` | The build arch where will search .gcda files | `i386`
  `output_dir` | The output directory that coverage data will be stored. If not passed will use coverage_reports as default value | `coverage_reports`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action lcov
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/lcov.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
