<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/slather.rb
-->

# slather


Use slather to generate a code coverage report




> Slather works with multiple code coverage formats, including Xcode 7 code coverage.<br>Slather is available at [https://github.com/SlatherOrg/slather](https://github.com/SlatherOrg/slather).


slather ||
---|---
Supported platforms | ios, mac
Author | @mattdelves



## 1 Example

```ruby
slather(
  build_directory: "foo",
  input_format: "bah",
  scheme: "MyScheme",
  proj: "MyProject.xcodeproj"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `build_directory` | The location of the build output | 
  `proj` | The project file that slather looks at | 
  `workspace` | The workspace that slather looks at | 
  `scheme` | Scheme to use when calling slather | 
  `configuration` | Configuration to use when calling slather (since slather-2.4.1) | 
  `input_format` | The input format that slather should look for | 
  `buildkite` | Tell slather that it is running on Buildkite | 
  `teamcity` | Tell slather that it is running on TeamCity | 
  `jenkins` | Tell slather that it is running on Jenkins | 
  `travis` | Tell slather that it is running on TravisCI | 
  `travis_pro` | Tell slather that it is running on TravisCI Pro | 
  `circleci` | Tell slather that it is running on CircleCI | 
  `coveralls` | Tell slather that it should post data to Coveralls | 
  `simple_output` | Tell slather that it should output results to the terminal | 
  `gutter_json` | Tell slather that it should output results as Gutter JSON format | 
  `cobertura_xml` | Tell slather that it should output results as Cobertura XML format | 
  `llvm_cov` | Tell slather that it should output results as llvm-cov show format | 
  `html` | Tell slather that it should output results as static HTML pages | 
  `show` | Tell slather that it should open static html pages automatically | `false`
  `source_directory` | Tell slather the location of your source files | 
  `output_directory` | Tell slather the location of for your output files | 
  `ignore` | Tell slather to ignore files matching a path or any path from an array of paths | 
  `verbose` | Tell slather to enable verbose mode | 
  `use_bundle_exec` | Use bundle exec to execute slather. Make sure it is in the Gemfile | `false`
  `binary_basename` | Basename of the binary file, this should match the name of your bundle excluding its extension (i.e. YourApp [for YourApp.app bundle]) | `false`
  `binary_file` | Binary file name to be used for code coverage | 
  `arch` | Specify which architecture the binary file is in. Needed for universal binaries | 
  `source_files` | A Dir.glob compatible pattern used to limit the lookup to specific source files. Ignored in gcov mode | `false`
  `decimals` | The amount of decimals to use for % coverage reporting | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action slather
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run slather
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run slather parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/slather.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
