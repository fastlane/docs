<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/bundle_install.rb
-->

# bundle_install


This action runs `bundle install` (if available)







bundle_install ||
---|---
Supported platforms | ios, android, mac
Author | @birmacher, @koglinjg





## Parameters

Key | Description | Default
----|-------------|--------
  `binstubs` | Generate bin stubs for bundled gems to ./bin | 
  `clean` | Run bundle clean automatically after install | `false`
  `full_index` | Use the rubygems modern index instead of the API endpoint | `false`
  `gemfile` | Use the specified gemfile instead of Gemfile | 
  `jobs` | Install gems using parallel workers | 
  `local` | Do not attempt to fetch gems remotely and use the gem cache instead | `false`
  `deployment` | Install using defaults tuned for deployment and CI environments | `false`
  `no_cache` | Don't update the existing gem cache | `false`
  `no_prune` | Don't remove stale gems from the cache | `false`
  `path` | Specify a different path than the system default ($BUNDLE_PATH or $GEM_HOME). Bundler will remember this value for future installs on this machine | 
  `system` | Install to the system location ($BUNDLE_PATH or $GEM_HOME) even if the bundle was previously installed somewhere else for this application | `false`
  `quiet` | Only output warnings and errors | `false`
  `retry` | Retry network and git requests that have failed | 
  `shebang` | Specify a different shebang executable name than the default (usually 'ruby') | 
  `standalone` | Make a bundle that can work without the Bundler runtime | 
  `trust_policy` | Sets level of security when dealing with signed gems. Accepts `LowSecurity`, `MediumSecurity` and `HighSecurity` as values | 
  `without` | Exclude gems that are part of the specified named group | 
  `with` | Include gems that are part of the specified named group | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action bundle_install
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run bundle_install
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run bundle_install parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/bundle_install.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
