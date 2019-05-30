<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/carthage.rb
-->

# carthage


Runs `carthage` for your project







carthage ||
---|---
Supported platforms | ios, mac
Author | @bassrock, @petester42, @jschmid, @JaviSoto, @uny, @phatblat, @bfcrampton, @antondomashnev, @gbrhaz



## 2 Examples

```ruby
carthage
```

```ruby
carthage(
  frameworks: ["MyFramework1", "MyFramework2"],   # Specify which frameworks to archive (only for the archive command)
  output: "MyFrameworkBundle.framework.zip",      # Specify the output archive name (only for the archive command)
  command: "bootstrap",       # One of: build, bootstrap, update, archive. (default: bootstrap)
  dependencies: ["Alamofire", "Notice"],# Specify which dependencies to update or build (only for update, build and bootstrap commands)
  use_ssh: false,   # Use SSH for downloading GitHub repositories.
  use_submodules: false,      # Add dependencies as Git submodules.
  use_binaries: true,         # Check out dependency repositories even when prebuilt frameworks exist
  no_build: false,  # When bootstrapping Carthage do not build
  no_skip_current: false,     # Don't skip building the current project (only for frameworks)
  verbose: false,   # Print xcodebuild output inline
  platform: "all",  # Define which platform to build for (one of ‘all’, ‘Mac’, ‘iOS’, ‘watchOS’, ‘tvOS‘, or comma-separated values of the formers except for ‘all’)
  configuration: "Release",   # Build configuration to use when building
  cache_builds: true,         # By default Carthage will rebuild a dependency regardless of whether its the same resolved version as before.
  toolchain: "com.apple.dt.toolchain.Swift_2_3",  # Specify the xcodebuild toolchain
  new_resolver: false,        # Use the new resolver to resolve depdendency graph
  log_path: "carthage.log"    # Path to the xcode build output
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `command` | Carthage command (one of: build, bootstrap, update, archive) | `bootstrap`
  `dependencies` | Carthage dependencies to update, build or bootstrap | `[]`
  `use_ssh` | Use SSH for downloading GitHub repositories | 
  `use_submodules` | Add dependencies as Git submodules | 
  `use_binaries` | Check out dependency repositories even when prebuilt frameworks exist | 
  `no_build` | When bootstrapping Carthage do not build | 
  `no_skip_current` | Don't skip building the Carthage project (in addition to its dependencies) | 
  `derived_data` | Use derived data folder at path | 
  `verbose` | Print xcodebuild output inline | 
  `platform` | Define which platform to build for | 
  `cache_builds` | By default Carthage will rebuild a dependency regardless of whether it's the same resolved version as before. Passing the --cache-builds will cause carthage to avoid rebuilding a dependency if it can | `false`
  `frameworks` | Framework name or names to archive, could be applied only along with the archive command | `[]`
  `output` | Output name for the archive, could be applied only along with the archive command. Use following format *.framework.zip | 
  `configuration` | Define which build configuration to use when building | 
  `toolchain` | Define which xcodebuild toolchain to use when building | 
  `project_directory` | Define the directory containing the Carthage project | 
  `new_resolver` | Use new resolver when resolving dependency graph | 
  `log_path` | Path to the xcode build output | 
  `executable` | Path to the `carthage` executable on your machine | `carthage`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action carthage
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run carthage
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run carthage parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/carthage.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
