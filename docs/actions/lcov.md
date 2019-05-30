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



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action lcov
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run lcov
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run lcov parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/lcov.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
