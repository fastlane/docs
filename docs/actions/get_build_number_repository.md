<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_build_number_repository.rb
-->

# get_build_number_repository


Get the build number from the current repository




> This action will get the **build number** according to what the SCM HEAD reports.<br>Currently supported SCMs are svn (uses root revision), git-svn (uses svn revision), git (uses short hash) and mercurial (uses short hash or revision number).<br>There is an option, `:use_hg_revision_number`, which allows to use mercurial revision number instead of hash.


get_build_number_repository ||
---|---
Supported platforms | ios, mac
Author | @bartoszj, @pbrooks, @armadsen
Returns | The build number from the current repository



## 1 Example

```ruby
get_build_number_repository
```





## Parameters

Key | Description | Default
----|-------------|--------
  `use_hg_revision_number` | Use hg revision number instead of hash (ignored for non-hg repos) | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `get_build_number_repository` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::BUILD_NUMBER_REPOSITORY` | The build number from the current repository

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action get_build_number_repository
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_build_number_repository
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_build_number_repository parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_build_number_repository.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
