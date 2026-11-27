<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_from_gem.rb
-->

# import_from_gem


Import Fastfiles from an installed gem to use their lanes




> Like `import_from_git`, this is useful if you share lanes across multiple apps, here by packaging the Fastfiles in a gem. The project's `Gemfile.lock` then pins the version of the shared lanes and of what they depend on, and the fastlane plugins the gem depends on are loaded when its Fastfiles are imported.<br>The gem must be in the project's Gemfile. By default every `fastlane/Fastfile*` in the gem is imported, so lanes can be split into files by purpose; an `actions` folder next to them is imported too.


import_from_gem ||
---|---
Supported platforms | ios, android, mac
Author | @lacostej



## 2 Examples

```ruby
import_from_gem(
  gem_name: "my_company_lanes" # The gem to import the Fastfiles from, listed in your Gemfile
)
```

```ruby
import_from_gem(
  gem_name: "my_company_lanes",
  paths: ["fastlane/Fastfile", "fastlane/Fastfile.release"] # The Fastfiles to import, relative to the gem
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `gem_name` | The gem to import the Fastfiles and actions from | 
  `paths` | The path(s) of the Fastfiles in the gem, as glob patterns | `["fastlane/Fastfile*"]`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action import_from_gem
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run import_from_gem
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run import_from_gem parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/import_from_gem.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
