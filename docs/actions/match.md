# match


Easily sync your certificates and profiles across your team using git




> More details https://github.com/fastlane/fastlane/tree/master/match


match |
-----|----
Supported platforms | ios
Author | @KrauseFx



**3 Examples**

```ruby
match(type: "appstore", app_identifier: "tools.fastlane.app")
```

```ruby
match(type: "development", readonly: true)
```

```ruby
match(app_identifier: ["tools.fastlane.app", "tools.fastlane.sleepy"])
```





**Parameters**

Key | Description
----|------------
  `git_url` | URL to the git repo containing all the certificates
  `git_branch` | Specific git branch to use
  `type` | Define the profile type, can be appstore, adhoc, development, enterprise
  `app_identifier` | The bundle identifier(s) of your app (comma-separated)
  `username` | Your Apple ID Username
  `keychain_name` | Keychain the items should be imported to
  `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your account password
  `readonly` | Only fetch existing certificates and profiles, don't generate new ones
  `team_id` | The ID of your Developer Portal team if you're in multiple teams
  `git_full_name` | git user full name to commit
  `git_user_email` | git user email to commit
  `team_name` | The name of your Developer Portal team if you're in multiple teams
  `verbose` | Print out extra information and all commands
  `force` | Renew the provisioning profiles every time you run match
  `skip_confirmation` | Disables confirmation prompts during nuke, answering them with yes
  `shallow_clone` | Make a shallow clone of the repository (truncate the history to 1 revision)
  `clone_branch_directly` | Clone just the branch specified, instead of the whole repo. This requires that the branch already exists. Otherwise the command will fail
  `force_for_new_devices` | Renew the provisioning profiles if the device count on the developer portal has changed
  `skip_docs` | Skip generation of a README.md for the created git repository
  `platform` | Set the provisioning profile's platform to work with (i.e. ios, tvos)
  `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates, template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action match
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/match.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
