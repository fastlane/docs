<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/reset_git_repo.rb
-->

# reset_git_repo


Resets git repo to a clean state by discarding uncommitted changes




> This action will reset your git repo to a clean state, discarding any uncommitted and untracked changes. Useful in case you need to revert the repo back to a clean state, e.g. after running _fastlane_.<br>Untracked files like `.env` will also be deleted, unless `:skip_clean` is true.<br>It's a pretty drastic action so it comes with a sort of safety latch. It will only proceed with the reset if this condition is met:

>- You have called the `ensure_git_status_clean` action prior to calling this action. This ensures that your repo started off in a clean state, so the only things that will get destroyed by this action are files that are created as a byproduct of the fastlane run.
>


reset_git_repo ||
---|---
Supported platforms | ios, android, mac
Author | @lmirosevic



## 4 Examples

```ruby
reset_git_repo
```

```ruby
reset_git_repo(force: true) # If you don't care about warnings and are absolutely sure that you want to discard all changes. This will reset the repo even if you have valuable uncommitted changes, so use with care!
```

```ruby
reset_git_repo(skip_clean: true) # If you want "git clean" to be skipped, thus NOT deleting untracked files like ".env". Optional, defaults to false.
```

```ruby
reset_git_repo(
  force: true,
  files: [
    "./file.txt"
  ]
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `files` | Array of files the changes should be discarded. If not given, all files will be discarded | 
  `force` | Skip verifying of previously clean state of repo. Only recommended in combination with `files` option | `false`
  `skip_clean` | Skip 'git clean' to avoid removing untracked files like `.env` | `false`
  `disregard_gitignore` | Setting this to true will clean the whole repository, ignoring anything in your local .gitignore. Set this to true if you want the equivalent of a fresh clone, and for all untracked and ignore files to also be removed | `true`
  `exclude` | You can pass a string, or array of, file pattern(s) here which you want to have survive the cleaning process, and remain on disk, e.g. to leave the `artifacts` directory you would specify `exclude: 'artifacts'`. Make sure this pattern is also in your gitignore! See the gitignore documentation for info on patterns | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action reset_git_repo
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run reset_git_repo
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run reset_git_repo parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/reset_git_repo.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
