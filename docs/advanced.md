# Advanced fastlane

# Passing Parameters

To pass parameters from the command line to your lane, use the following syntax:

```no-highlight
fastlane [lane] key:value key2:value2

fastlane deploy submit:false build_number:24
```

To access those values, change your lane declaration to also include `|options|`

```ruby
before_all do |lane, options|
  # ...
end

before_each do |lane, options|
  # ...
end

lane :deploy do |options|
  # ...
  if options[:submit]
    # Only when submit is true
  end
  # ...
  increment_build_number(build_number: options[:build_number])
  # ...
end

after_all do |lane, options|
  # ...
end

after_each do |lane, options|
  # ...
end

error do |lane, exception, options|
  if options[:debug]
    puts "Hi :)"
  end
end
```

# Switching lanes

To switch lanes while executing a lane, use the following code:

```ruby
lane :deploy do |options|
  # ...
  build(release: true) # that's the important bit
  hockey
  # ...
end

lane :staging do |options|
  # ...
  build # it also works when you don't pass parameters
  hockey
  # ...
end

lane :build do |options|
  scheme = (options[:release] ? "Release" : "Staging")
  ipa(scheme: scheme)
end
```

_fastlane_ takes care of all the magic for you. You can call lanes of the same platform or a general lane outside of the `platform` definition.

Passing parameters is optional.

## Returning values
Additionally, you can retrieve the return value. In Ruby, the last line of the `lane` definition is the return value. Here is an example:

```ruby
lane :deploy do |options|
  value = calculate(value: 3)
  puts value # => 5
end

lane :calculate do |options|
  # ...
  2 + options[:value] # the last line will always be the return value
end
```

## Stop executing a lane early

The `next` keyword can be used to stop executing a `lane` before it reaches the end.

```ruby
lane :build do |options|
  if cached_build_available?
    UI.important 'Skipping build because a cached build is available!'
    next # skip doing the rest of this lane
  end
  match
  gym
end

private_lane :cached_build_available? do |options|
  # ...
  true
end
```

When `next` is used during a `lane` switch, control returns to the previous `lane` that was executing.

```ruby
lane :first_lane do |options|
  puts "If you run: `fastlane first_lane`"
  puts "You'll see this!"
  second_lane
  puts "As well as this!"
end

private_lane :second_lane do |options|
  next
  puts "This won't be shown"
end
```

When you stop executing a lane early with `next`, any `after_each` and `after_all` blocks you have will still trigger as usual :+1:

## `before_each` and `after_each` blocks

`before_each` blocks are called before any lane is called. This would include being called before each lane you've switched to.
```ruby
before_each do |lane, options|
  # ...
end
```

`after_each` blocks are called after any lane is called. This would include being called after each lane you've switched to.
Just like `after_all`, `after_each` is not called if an error occurs. The `error` block should be used in this case.
```ruby
after_each do |lane, options|
  # ...
end
```

e.g. With this scenario, `before_each` and `after_each` would be called 4 times: before the `deploy` lane, before the switch to `archive`, `sign`, and `upload`, and after each of these lanes as well.

```ruby
lane :deploy do
  archive
  sign
  upload
end

lane :archive do
  # ...
end

lane :sign do
  # ...
end

lane :upload do
  # ...
end
```

# Run actions directly

If you just want to try an action without adding them to your `Fastfile` yet, you can use

```no-highlight
fastlane run notification message:"My Text" title:"The Title"
```

To get the avaiable options for any action run `fastlane action [action_name]`. You might not be able to set some kind of parameters using this method.

# Shell values
You can get value from shell commands:
```ruby
output = sh("pod update")
```

# Priorities of parameters and options

The order in which _fastlane_ tools take their values from

1. CLI parameter (e.g. `gym --scheme Example`) or Fastfile (e.g. `gym(scheme: 'Example')`)
1. Environment variable (e.g. `GYM_SCHEME`)
1. Tool specific config file (e.g. `Gymfile` containing `scheme 'Example'`)
1. Default value (which might be taken from the `Appfile`, e.g. `app_identifier` from the `Appfile`)
1. If this value is required, you'll be asked for it (e.g. you have multiple schemes, you'll be asked for it)

# Importing another Fastfile

Within your `Fastfile` you can import another `Fastfile` using 2 methods:

## `import`

Import a `Fastfile` from a local path

```ruby
import "../GeneralFastfile"

override_lane :from_general do
  # ...
end
```

## `import_from_git`

Import from another git repository, which you can use to have one git repo with a default `Fastfile` for all your project


```ruby
import_from_git(url: 'https://github.com/fastlane/fastlane/tree/master/fastlane')
# or
import_from_git(url: 'git@github.com:MyAwesomeRepo/MyAwesomeFastlaneStandardSetup.git',
               path: 'fastlane/Fastfile')

lane :new_main_lane do
  # ...
end
```

This will also automatically import all the local actions from this repo.

## Note

You should import the other `Fastfile` on the top above your lane declarations. When defining a new lane _fastlane_ will make sure to not run into any name conflicts. If you want to overwrite an existing lane (from the imported one), use the `override_lane` keyword.


# Environment Variables
You can define environment variables in a `.env` or `.env.default` file in the same directory as your `Fastfile`. Environment variables are loading using [dotenv](https://github.com/bkeepers/dotenv). Here's an example.

```no-highlight
WORKSPACE=YourApp.xcworkspace
HOCKEYAPP_API_TOKEN=your-hockey-api-token
```

_fastlane_ also has a `--env` option that allows loading of environment specific `dotenv` files. `.env` and `.env.default` will be loaded before environment specific `dotenv` files are loaded. The naming convention for environment specific `dotenv` files is `.env.<environment>`

For example, `fastlane <lane-name> --env development` will load `.env`, `.env.default`, and `.env.development`

# Lane Context

The different actions can *communicate* with each other using a shared hash. You can access them in your lanes with the following code.

Replace `VARIABLE_NAME_HERE` with any of the following.

```ruby
lane_context[SharedValues::LANE_NAME]                 # The name of the current lane (stays the same when switching lanes)
lane_context[SharedValues::BUILD_NUMBER]              # Generated by `increment_build_number`
lane_context[SharedValues::VERSION_NUMBER]            # Generated by `increment_version_number`
lane_context[SharedValues::SNAPSHOT_SCREENSHOTS_PATH] # Generated by _snapshot_
lane_context[SharedValues::PRODUCE_APPLE_ID]          # The Apple ID of the newly created app
lane_context[SharedValues::IPA_OUTPUT_PATH]           # Generated by _gym_
lane_context[SharedValues::DSYM_OUTPUT_PATH]          # Generated by _gym_
lane_context[SharedValues::SIGH_PROFILE_PATH]         # Generated by _sigh_
lane_context[SharedValues::SIGH_UDID]                 # The UDID of the generated provisioning profile
lane_context[SharedValues::HOCKEY_DOWNLOAD_LINK]      # Generated by `hockey`
```

To get information about the available lane variables, run `fastlane action [action_name]`.

# Private lanes

Sometimes you might have a lane that is used from different lanes, for example:

```ruby
lane :production do
  # ...
  build(release: true)
  appstore # Deploy to the AppStore
  # ...
end

lane :beta do
  # ...
  build(release: false)
  crashlytics # Distribute to testers
  # ...
end

lane :build do |options|
  # ...
  ipa
  # ...
end
```

It probably doesn't make sense to execute the `build` lane directly using `fastlane build`. You can hide this lane using

```ruby
private_lane :build do |options|
  # ...
end
```

This will hide the lane from:

- `fastlane lanes`
- `fastlane list`
- `fastlane docs`

And also, you can't call the private lane using `fastlane build`.

The resulting private lane can only be called from another lane using the lane switching technology.

# Load own actions from external folder

Add this to the top of your `Fastfile`.

```ruby
actions_path '../custom_actions_folder/'
```

# Skip update check when launching _fastlane_

You can set the environment variable `FASTLANE_SKIP_UPDATE_CHECK` to skip the update check.

# Adding Credentials

You can add credentials for use by _fastlane_ to your keychain using the [CredentialsManager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) command line interface. This is useful for situations like CI environments.

**Adding a Credential**
```no-highlight
fastlane-credentials add --username felix@krausefx.com
Password: *********
Credential felix@krausefx.com:********* added to keychain.
```

**Removing a Credential**
```no-highlight
fastlane-credentials remove --username felix@krausefx.com
password has been deleted.
```

# Control configuration by lane and by platform

In general, configuration files take only the first value given for a particular configuration item. That means that for an `Appfile` like the following:

```ruby
app_identifier "com.used.id"
app_identifier "com.ignored.id"
```

the `app_identfier` will be `"com.used.id"` and the second value will be ignored. The `for_lane` and `for_platform` configuration blocks provide a limited exception to this rule.

All configuration files (Appfile, Matchfile, Screengrabfile, etc.) can use `for_lane` and `for_platform` blocks to control (and override) configuration values for those circumstances.

`for_lane` blocks will be called when the name of lane invoked on the command line matches the one specified by the block. So, given a `Screengrabfile` like:

```ruby
locales ['en-US', 'fr-FR', 'ja-JP']

for_lane :screenshots_english_only do
  locales ['en-US']
end

for_lane :screenshots_french_only do
  locales ['fr-FR']
end
```

`locales` will have the values `['en-US', 'fr-FR', 'ja-JP']` by default, but will only have one value when running the `fastlane screenshots_english_only` or `fastlane screenshots_french_only`.

`for_platform` gives you similar control based on the platform for which you have invoked _fastlane_. So, for an `Appfile` configured like:

```ruby
app_identifier "com.default.id"

for_lane :enterprise do
  app_identifier "com.forlane.enterprise"
end

for_platform :mac do
  app_identifier "com.forplatform.mac"

  for_lane :release do
    app_identifier "com.forplatform.mac.forlane.release"
  end
end
```

you can expect the `app_identifier` to equal `"com.forplatform.mac.forlane.release"` when invoking `fastlane mac release`.

# Manually Manage the fastlane match Repo

Most users can benefit from *match*'s automatic management of the repo that stores certificates and provisioning profiles. From time to time, it may be necessary to manually change the files in this repo.

For example, fastlane requires admin access to the Apple Developer account to generate the appropriate files. If you are provided with an updated certificate or profile but do not have admin access, you can manually edit the repo.

> **Warning:** Manually editing your *match* repo can introduce unexpected behavior and is not recommended. Proceed with caution.

<details>
<summary>Instructions</summary>



### Overview

Because:

1. fastlane encrypts the repo, and
2. fastlane doesn't support manual edits to the repo

it's necessary to manually decrypt, then modify, then encrypt, the repo to make any changes.

> These instructions presuppose you already have fastlane match configured correctly.

### 🔓 Decryption Instructions

The easiest way to decrypt the repo is to use the fastlane *match* `GitHelper` class. You can do this from an interactive Ruby console:

```bash
$ bundle console
irb(main):001:0>
```

Then, require *match* and set the appropriate parameters:

```ruby
irb(main):001:0> require 'match'
irb(main):002:0> git_url = 'https://github.com/fastlane/example-certificate-repo'
=> "https://github.com/fastlane/example-certificate-repo"
irb(main):003:0> shallow_clone = false
=> false
irb(main):004:0> manual_password = 'example-password'
=> "example-password"
```

Now call `GitHelper.clone`, which will clone and decrypt the repo for you. Assign the return value to `workspace`, which we'll need later when we re-encrypt:

```ruby
irb(main):005:0> workspace = Match::GitHelper.clone(git_url, shallow_clone, manual_password: manual_password)
[14:49:30]: Cloning remote git repo...
[14:49:31]: 🔓  Successfully decrypted certificates repo
=> "/var/folders/0j/29ytx6wx0fg86sznfb4mqdph0000gn/T/d20170314-14350-11hmdro"
```

The directory beginning with `/var/folders` contains the decrypted git repo. Modify it as needed.

If you are updating a `.p12` file, ensure it's exported from the keychain without a password, since *match* doesn't support importing private keys with a password.

> **Warning:** Do *not* commit your changes. Allow the fastlane script to do that for you.

Once your changes are made, we'll need to encrypt the repo and push it.

### 🔒 Encryption Instructions

In the Ruby console, call `GitHelper.commit_changes`, passing in the commit message you want. For example:

```ruby
irb(main):006:0> Match::GitHelper.commit_changes(workspace, "remove password from p12 file", git_url)
```

Your changes will be encrypted, committed, and pushed.

> **Note:** If your keychain doesn't include the encryption passcode, you may be prompted for it. If so, just enter the same password you used to decrypt it.

</details>
