<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# cocoapods


Runs `pod install` for the project




> If you use [CocoaPods](http://cocoapods.org) you can use the `cocoapods` integration to run `pod install` before building your app.


cocoapods |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx, @tadpol, @birmacher, @Liquidsoul



**2 Examples**

```ruby
cocoapods
```

```ruby
cocoapods(
  clean: true,
  podfile: "./CustomPodfile"
)
```





**Parameters**

Key | Description
----|------------
  `clean` | Remove SCM directories
  `integrate` | Integrate the Pods libraries into the Xcode project(s)
  `repo_update` | Run `pod repo update` before install
  `silent` | Execute command without logging output
  `verbose` | Show more debugging information
  `ansi` | Show output with ANSI codes
  `use_bundle_exec` | Use bundle exec when there is a Gemfile presented
  `podfile` | Explicitly specify the path to the Cocoapods' Podfile. You can either set it to the Podfile's path or to the folder containing the Podfile file
  `error_callback` | A callback invoked with the command output if there is a non-zero exit status
  `try_repo_update_on_error` | Retry with --repo-update if action was finished with error




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action cocoapods
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/cocoapods.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
