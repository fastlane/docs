<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/cocoapods.rb
-->

# cocoapods


Runs `pod install` for the project




> If you use [CocoaPods](http://cocoapods.org) you can use the `cocoapods` integration to run `pod install` before building your app.


cocoapods ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx, @tadpol, @birmacher, @Liquidsoul



## 2 Examples

```ruby
cocoapods
```

```ruby
cocoapods(
  clean: true,
  podfile: "./CustomPodfile"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `repo_update` | Add `--repo-update` flag to `pod install` command | `false`
  `silent` | Execute command without logging output | `false`
  `verbose` | Show more debugging information | `false`
  `ansi` | Show output with ANSI codes | `true`
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented | `true`
  `podfile` | Explicitly specify the path to the Cocoapods' Podfile. You can either set it to the Podfile's path or to the folder containing the Podfile file | 
  `error_callback` | A callback invoked with the command output if there is a non-zero exit status | 
  `try_repo_update_on_error` | Retry with --repo-update if action was finished with error | `false`
  `clean` | **DEPRECATED!** (Option removed from cocoapods) Remove SCM directories | `true`
  `integrate` | **DEPRECATED!** (Option removed from cocoapods) Integrate the Pods libraries into the Xcode project(s) | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action cocoapods
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run cocoapods
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run cocoapods parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/cocoapods.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
