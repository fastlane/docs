<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# pod_lib_lint


Pod lib lint




> Test the syntax of your Podfile by linting the pod against the files of its directory


pod_lib_lint |
-----|----
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
  `verbose` | Allow output detail in console | 
  `allow_warnings` | Allow warnings during pod lint | 
  `sources` | The sources of repos you want the pod spec to lint with, separated by commas | 
  `use_libraries` | Lint uses static libraries to install the spec | `false`
  `fail_fast` | Lint stops on the first failing platform or subspec | `false`
  `private` | Lint skips checks that apply only to public specs | `false`
  `quick` | Lint skips checks that would require to download and build the spec | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action pod_lib_lint
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/pod_lib_lint.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
