<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# bundle_install


This action runs `bundle install` (if available)







bundle_install |
-----|----
Supported platforms | ios, android, mac
Author | @birmacher, @koglinjg





## Parameters

Key | Description
----|------------
  `binstubs` | Generate bin stubs for bundled gems to ./bin
  `clean` | Run bundle clean automatically after install
  `full_index` | Use the rubygems modern index instead of the API endpoint
  `gemfile` | Use the specified gemfile instead of Gemfile
  `jobs` | Install gems using parallel workers
  `local` | Do not attempt to fetch gems remotely and use the gem cache instead
  `deployment` | Install using defaults tuned for deployment and CI environments
  `no_cache` | Don't update the existing gem cache
  `no_prune` | Don't remove stale gems from the cache
  `path` | Specify a different path than the system default ($BUNDLE_PATH or $GEM_HOME). Bundler will remember this value for future installs on this machine
  `system` | Install to the system location ($BUNDLE_PATH or $GEM_HOME) even if the bundle was previously installed somewhere else for this application
  `quiet` | Only output warnings and errors
  `retry` | Retry network and git requests that have failed
  `shebang` | Specify a different shebang executable name than the default (usually 'ruby')
  `standalone` | Make a bundle that can work without the Bundler runtime
  `trust_policy` | Sets level of security when dealing with signed gems. Accepts `LowSecurity`, `MediumSecurity` and `HighSecurity` as values
  `without` | Exclude gems that are part of the specified named group
  `with` | Include gems that are part of the specified named group




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action bundle_install
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/bundle_install.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
