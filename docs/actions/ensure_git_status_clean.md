<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_git_status_clean.rb
-->

# ensure_git_status_clean


Raises an exception if there are uncommitted git changes




> A sanity check to make sure you are working in a repo that is clean.<br>Especially useful to put at the beginning of your Fastfile in the `before_all` block, if some of your other actions will touch your filesystem, do things to your git repo, or just as a general reminder to save your work.<br>Also needed as a prerequisite for some other actions like `reset_git_repo`.


ensure_git_status_clean ||
---|---
Supported platforms | ios, android, mac
Author | @lmirosevic, @antondomashnev



## 1 Example

```ruby
ensure_git_status_clean
```





## Parameters

Key | Description | Default
----|-------------|--------
  `show_uncommitted_changes` | The flag whether to show uncommitted changes if the repo is dirty | `false`
  `show_diff` | The flag whether to show the git diff if the repo is dirty | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />

## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action ensure_git_status_clean
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ensure_git_status_clean
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ensure_git_status_clean parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primative types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ensure_git_status_clean.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
