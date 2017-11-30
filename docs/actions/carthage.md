<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# carthage


Runs `carthage` for your project







carthage |
-----|----
Supported platforms | ios, mac
Author | @bassrock, @petester42, @jschmid, @JaviSoto, @uny, @phatblat, @bfcrampton, @antondomashnev



## 2 Examples

```ruby
carthage
```

```ruby
carthage(
  frameworks: ["MyFramework1", "MyFramework2"],   # Specify which frameworks to archive (only for the archive command)
  output: "MyFrameworkBundle.framework.zip",      # Specify the output archive name (only for the archive command)
  command: "bootstrap",       # One of: build, bootstrap, update, archive. (default: bootstrap)
  dependencies: ["Alamofire", "Notice"],# Specify which dependencies to update or build (only for update and build commands)
  use_ssh: false,   # Use SSH for downloading GitHub repositories.
  use_submodules: false,      # Add dependencies as Git submodules.
  use_binaries: true,         # Check out dependency repositories even when prebuilt frameworks exist
  no_build: false,  # When bootstrapping Carthage do not build
  no_skip_current: false,     # Don't skip building the current project (only for frameworks)
  verbose: false,   # Print xcodebuild output inline
  platform: "all",  # Define which platform to build for (one of ‘all’, ‘Mac’, ‘iOS’, ‘watchOS’, ‘tvOS‘, or comma-separated values of the formers except for ‘all’)
  configuration: "Release",   # Build configuration to use when building
  cache_builds: true,         # By default Carthage will rebuild a dependency regardless of whether its the same resolved version as before.
  toolchain: "com.apple.dt.toolchain.Swift_2_3"   # Specify the xcodebuild toolchain
)
```





## Parameters

Key | Description
----|------------
  `command` | Carthage command (one of: build, bootstrap, update, archive)
  `dependencies` | Carthage dependencies to update or build
  `use_ssh` | Use SSH for downloading GitHub repositories
  `use_submodules` | Add dependencies as Git submodules
  `use_binaries` | Check out dependency repositories even when prebuilt frameworks exist
  `no_build` | When bootstrapping Carthage do not build
  `no_skip_current` | Don't skip building the Carthage project (in addition to its dependencies)
  `derived_data` | Use derived data folder at path
  `verbose` | Print xcodebuild output inline
  `platform` | Define which platform to build for
  `cache_builds` | By default Carthage will rebuild a dependency regardless of whether it's the same resolved version as before. Passing the --cache-builds will cause carthage to avoid rebuilding a dependency if it can
  `frameworks` | Framework name or names to archive, could be applied only along with the archive command
  `output` | Output name for the archive, could be applied only along with the archive command. Use following format *.framework.zip
  `configuration` | Define which build configuration to use when building
  `toolchain` | Define which xcodebuild toolchain to use when building
  `project_directory` | Define the directory containing the Carthage project




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action carthage
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/carthage.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
