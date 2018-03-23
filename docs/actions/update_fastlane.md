<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_fastlane.rb
-->

# update_fastlane


Makes sure fastlane-tools are up-to-date when running fastlane




> This action will update fastlane to the most recent version - major version updates will not be performed automatically, as they might include breaking changes. If an update was performed, fastlane will be restarted before the run continues.
If you are using rbenv or rvm, everything should be good to go. However, if you are using the system's default ruby, some additional setup is needed for this action to work correctly. In short, fastlane needs to be able to access your gem library without running in `sudo` mode.
The simplest possible fix for this is putting the following lines into your `~/.bashrc` or `~/.zshrc` file:
```bash
export GEM_HOME=~/.gems
export PATH=$PATH:~/.gems/bin
```
After the above changes, restart your terminal, then run `mkdir $GEM_HOME` to create the new gem directory. After this, you're good to go!
Recommended usage of the `update_fastlane` action is at the top inside of the `before_all` block, before running any other action


update_fastlane |
-----|----
Supported platforms | ios, android, mac
Author | @milch, @KrauseFx



## 1 Example

```ruby
before_all do
  update_fastlane
  # ...
end
```





## Parameters

Key | Description | Default
----|-------------|--------
  `nightly` | Opt-in to install and use nightly fastlane builds | `false`
  `no_update` | Don't update during this run. This is used internally | `false`
  `tools` | [DEPRECATED!] true - Comma separated list of fastlane tools to update (e.g. fastlane,deliver,sigh) | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_fastlane
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_fastlane.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
