<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/pod_lib_lint.rb
-->

# pod_lib_lint


Pod lib lint




> Test the syntax of your Podfile by linting the pod against the files of its directory


pod_lib_lint ||
---|---
Supported platforms | ios, mac
Author | @thierryxing



## 4 Examples

```ruby
pod_lib_lint
```

```ruby
# Allow output detail in console
pod_lib_lint(verbose: true)
```

```ruby
# Allow warnings during pod lint
pod_lib_lint(allow_warnings: true)
```

```ruby
# If the podspec has a dependency on another private pod, then you will have to supply the sources
pod_lib_lint(sources: ["https://github.com/username/Specs", "https://github.com/CocoaPods/Specs"])
```





## Parameters

Key | Description | Default
----|-------------|--------
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true`
  `podspec` | Path of spec to lint | 
  `verbose` | Allow output detail in console | 
  `allow_warnings` | Allow warnings during pod lint | 
  `sources` | The sources of repos you want the pod spec to lint with, separated by commas | 
  `subspec` | A specific subspec to lint instead of the entire spec | 
  `include_podspecs` | A Glob of additional ancillary podspecs which are used for linting via :path (available since cocoapods >= 1.7) | 
  `external_podspecs` | A Glob of additional ancillary podspecs which are used for linting via :podspec. If there are --include-podspecs, then these are removed from them (available since cocoapods >= 1.7) | 
  `swift_version` | The SWIFT_VERSION that should be used to lint the spec. This takes precedence over a .swift-version file | 
  `use_libraries` | Lint uses static libraries to install the spec | `false`
  `use_modular_headers` | Lint using modular libraries (available since cocoapods >= 1.6) | `false`
  `fail_fast` | Lint stops on the first failing platform or subspec | `false`
  `private` | Lint skips checks that apply only to public specs | `false`
  `quick` | Lint skips checks that would require to download and build the spec | `false`
  `no_clean` | Lint leaves the build directory intact for inspection | `false`
  `no_subspecs` | Lint skips validation of subspecs | `false`
  `platforms` | Lint against specific platforms (defaults to all platforms supported by the podspec). Multiple platforms must be comma-delimited (available since cocoapods >= 1.6) | 
  `skip_import_validation` | Lint skips validating that the pod can be imported (available since cocoapods >= 1.3) | `false`
  `skip_tests` | Lint skips building and running tests during validation (available since cocoapods >= 1.3) | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action pod_lib_lint
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run pod_lib_lint
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run pod_lib_lint parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/pod_lib_lint.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
