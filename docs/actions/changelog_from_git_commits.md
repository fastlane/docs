<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/changelog_from_git_commits.rb
-->

# changelog_from_git_commits


Collect git commit messages into a changelog




> By default, messages will be collected back to the last tag, but the range can be controlled


changelog_from_git_commits ||
---|---
Supported platforms | ios, android, mac
Author | @mfurtak, @asfalcone, @SiarheiFedartsou, @allewun
Returns | Returns a String containing your formatted git commits



## 2 Examples

```ruby
changelog_from_git_commits
```

```ruby
changelog_from_git_commits(
  between: ["7b092b3", "HEAD"],  # Optional, lets you specify a revision/tag range between which to collect commit info
  pretty: "- (%ae) %s",# Optional, lets you provide a custom format to apply to each commit when generating the changelog text
  date_format: "short",# Optional, lets you provide an additional date format to dates within the pretty-formatted string
  match_lightweight_tag: false,  # Optional, lets you ignore lightweight (non-annotated) tags when searching for the last tag
  merge_commit_filtering: "exclude_merges" # Optional, lets you filter out merge commits
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `between` | Array containing two Git revision values between which to collect messages, you mustn't use it with :commits_count key at the same time | 
  `commits_count` | Number of commits to include in changelog, you mustn't use it with :between key at the same time | 
  `path` | Path of the git repository | `./`
  `pretty` | The format applied to each commit while generating the collected value | `%B`
  `date_format` | The date format applied to each commit while generating the collected value | 
  `ancestry_path` | Whether or not to use ancestry-path param | `false`
  `tag_match_pattern` | A glob(7) pattern to match against when finding the last git tag | 
  `match_lightweight_tag` | Whether or not to match a lightweight tag when searching for the last one | `true`
  `quiet` | Whether or not to disable changelog output | `false`
  `include_merges` | **DEPRECATED!** Use `:merge_commit_filtering` instead - Whether or not to include any commits that are merges | 
  `merge_commit_filtering` | Controls inclusion of merge commits when collecting the changelog. Valid values: `:include_merges`, `:exclude_merges`, `:only_include_merges` | `include_merges`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `changelog_from_git_commits` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::FL_CHANGELOG` | The changelog string generated from the collected git commit messages

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action changelog_from_git_commits
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run changelog_from_git_commits
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run changelog_from_git_commits parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/changelog_from_git_commits.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
