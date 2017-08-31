# changelog_from_git_commits


Collect git commit messages into a changelog




> By default, messages will be collected back to the last tag, but the range can be controlled


changelog_from_git_commits |
-----|----
Supported platforms | ios, android, mac
Author | @mfurtak, @asfalcone, @SiarheiFedartsou, @allewun
Returns | Returns a String containing your formatted git commits



**2 Examples**

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





**Parameters**

Key | Description
----|------------
  `between` | Array containing two Git revision values between which to collect messages, you mustn't use it with :commits_count key at the same time
  `commits_count` | Number of commits to include in changelog, you mustn't use it with :between key at the same time
  `pretty` | The format applied to each commit while generating the collected value
  `date_format` | The date format applied to each commit while generating the collected value
  `ancestry_path` | Whether or not to use ancestry-path param
  `tag_match_pattern` | A glob(7) pattern to match against when finding the last git tag
  `match_lightweight_tag` | Whether or not to match a lightweight tag when searching for the last one
  `include_merges` | Whether or not to include any commits that are merges
[31m(DEPRECATED - use :merge_commit_filtering)[0m
  `merge_commit_filtering` | Controls inclusion of merge commits when collecting the changelog.
Valid values: 'include_merges', 'exclude_merges', 'only_include_merges'




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action changelog_from_git_commits
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/changelog_from_git_commits.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
