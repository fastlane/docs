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

# Timestamps

To hide timestamps in each row, set the `FASTLANE_HIDE_TIMESTAMP` environment variable.

# Interacting with the user

Instead of using `puts`, `raise` and `gets`, please use the helper class `UI` across all fastlane tools:

```ruby
UI.message "Neutral message (usually white)"
UI.success "Successfully finished processing (usually green)"
UI.error "Wahaha, what's going on here! (usually red)"
UI.important "Make sure to use Windows (usually yellow)"

UI.header "Inputs" # a big box

name = UI.input("What's your name? ")
if UI.confirm("Are you '#{name}'?")
  UI.success "Oh yeah"
else
  UI.error "Wups, invalid"
end

UI.password("Your password please: ") # password inputs are hidden

###### A "Dropdown" for the user
project = UI.select("Select your project: ", ["Test Project", "Test Workspace"])

UI.success("Okay #{name}, you selected '#{project}'")

###### To run a command use
FastlaneCore::CommandExecutor.execute(command: "ls",
                                    print_all: true,
                                        error: proc do |error_output|
                                          # handle error here
                                        end)

###### or if you just want to receive a simple value use this only if the command doesn't take long
diff = Helper.backticks("git diff")

###### fastlane "crash" because of a user error everything that is caused by the user and is not unexpected
UI.user_error!("You don't have a project in the current directory")

###### an actual crash when something unexpected happened
UI.crash!("Network timeout")

###### a deprecation message
UI.deprecated("The '--key' parameter is deprecated")
```

# Run actions directly

If you just want to try an action without adding them to your `Fastfile` yet, you can use

```no-highlight
fastlane run notification message:"My Text" title:"The Title"
```

To get the available options for any action run `fastlane action [action_name]`. You might not be able to set some kind of parameters using this method.

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
import_from_git(url: 'https://github.com/fastlane/fastlane')
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

You can define environment variables in a `.env` or `.env.default` file in the same directory as your `Fastfile`. Environment variables are loaded using [dotenv](https://github.com/bkeepers/dotenv). Here's an example:

```no-highlight
WORKSPACE=YourApp.xcworkspace
HOCKEYAPP_API_TOKEN=your-hockey-api-token
```

_fastlane_ also has a `--env` option that allows loading of environment specific `dotenv` files. `.env` and `.env.default` will be loaded before environment specific `dotenv` files are loaded. The naming convention for environment specific `dotenv` files is `.env.<environment>`

For example, `fastlane <lane-name> --env development` will load `.env`, `.env.default`, and `.env.development`

Alternatively, as environment variables are not a fastlane specific thing, you can also use standard methods to set them:

```
DELIVER_USER="felix@krausefx.com" fastlane test
```

or

```
export DELIVER_USER="felix@krausefx.com";
fastlane test
```

Although it kind of defeats the purpose of using them in the first place (not to have their content in any files), you can also set them in your `Fastfile`:

```
ENV["DELIVER_USER"] = "felix@krausefx.com"
```

# Lane Properties

It can be useful to dynamically access properties of the current lane. These are available in `lane_context`:

```ruby
lane_context[SharedValues::PLATFORM_NAME]        # Platform name, e.g. `ios`, `android` or empty (for root level lanes)
lane_context[SharedValues::LANE_NAME]            # The name of the current lane preceded by the platform name (stays the same when switching lanes)
lane_context[SharedValues::DEFAULT_PLATFORM]     # Default platform
```

and environment variables:

```ruby
ENV["FASTLANE_PLATFORM_NAME"]
ENV["FASTLANE_LANE_NAME"]
```

# Lane Context

The different actions can *communicate* with each other using a shared hash. You can access this in your lanes with the following code:

```ruby
lane_context[SharedValues::VARIABLE_NAME_HERE]
```

Here are some examples:

```ruby
lane_context[SharedValues::BUILD_NUMBER]                # Generated by `increment_build_number`
lane_context[SharedValues::VERSION_NUMBER]              # Generated by `increment_version_number`
lane_context[SharedValues::SNAPSHOT_SCREENSHOTS_PATH]   # Generated by _snapshot_
lane_context[SharedValues::PRODUCE_APPLE_ID]            # The Apple ID of the newly created app
lane_context[SharedValues::IPA_OUTPUT_PATH]             # Generated by _gym_
lane_context[SharedValues::DSYM_OUTPUT_PATH]            # Generated by _gym_
lane_context[SharedValues::SIGH_PROFILE_PATH]           # Generated by _sigh_
lane_context[SharedValues::SIGH_UDID]                   # The UDID of the generated provisioning profile
lane_context[SharedValues::HOCKEY_DOWNLOAD_LINK]        # Generated by `hockey`
lane_context[SharedValues::GRADLE_APK_OUTPUT_PATH]      # Generated by `gradle`
lane_context[SharedValues::GRADLE_ALL_APK_OUTPUT_PATHS] # Generated by `gradle`
lane_context[SharedValues::GRADLE_FLAVOR]               # Generated by `gradle`
lane_context[SharedValues::GRADLE_BUILD_TYPE]           # Generated by `gradle`
```

To get information about available lane variables, run `fastlane action [action_name]`.

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

# Hide changelog information at the end of running _fastlane_

You can set the environment variable `FASTLANE_HIDE_CHANGELOG` to hide the detailed changelog information when new _fastlane_ versions are available.

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

Most users can benefit from _match_'s automatic management of the repo that stores certificates and provisioning profiles. From time to time, it may be necessary to manually change the files in this repo.

For example, _fastlane_ requires admin access to the Apple Developer account to generate the appropriate files. If you are provided with an updated certificate or profile but do not have admin access, you can manually edit the repo.

> **Warning:** Manually editing your _match_ repo can introduce unexpected behavior and is not recommended. Proceed with caution.

<details>
<summary>Instructions</summary>



### Overview

Because:

1. _fastlane_ encrypts the repo, and
2. _fastlane_ doesn't support manual edits to the repo

it's necessary to manually decrypt, then modify, then encrypt, the repo to make any changes.

> These instructions presuppose you already have _fastlane_ _match_ configured correctly.

### 🔓 Decryption Instructions

The easiest way to decrypt the repo is to use the _fastlane_ _match_ `GitHelper` class. You can do this from an interactive Ruby console:

```bash
$ bundle console
irb(main):001:0>
```

Then, require _match_ and set the appropriate parameters:

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

If you are updating a `.p12` file, ensure it's exported from the keychain without a password, since _match_ doesn't support importing private keys with a password.

> **Warning:** Do *not* commit your changes. Allow _fastlane_ to do that for you.

Once your changes are made, we'll need to encrypt the repo and push it.

### 🔒 Encryption Instructions

In the Ruby console, call `GitHelper.commit_changes`, passing in the commit message you want. For example:

```ruby
irb(main):006:0> Match::GitHelper.commit_changes(workspace, "remove password from p12 file", git_url)
```

Your changes will be encrypted, committed, and pushed.

> **Note:** If your keychain doesn't include the encryption passcode, you may be prompted for it. If so, just enter the same password you used to decrypt it.

</details>

# Directory behavior

_fastlane_ was designed in a way that you can run _fastlane_ from both the root directory of the project, and from the `./fastlane` sub-folder.

Take this example `Fastfile` on the path `fastlane/Fastfile`
```ruby
sh "pwd" # => "[root]/fastlane"
puts Dir.pwd # => "[root]/fastlane"

lane :something do
  sh "pwd" # => "[root]/fastlane"
  puts Dir.pwd # => "[root]/fastlane"

  my_action
end
```

The implementation of `my_action` looks like this:
```ruby
def run(params)
  puts Dir.pwd # => "[root]"
end
```

Notice how every action and every plugin's code runs in the root of the project, while all user code from the `Fastfile` runs inside the `./fastlane` directory. This is important to consider when migrating existing code from your `Fastfile` into your own action or plugin. To change the directory manually you can use standard Ruby blocks:

```ruby
Dir.chdir("..") do
  # code here runs in the parent directory
end
```

This behavior isn't great, and has been like this since the very early days of _fastlane_. As much as we'd like to change it, there is no good way to do so, without breaking thousands of production setups, so we decided to keep it as is for now.

# Appfile

The `Appfile` stores useful information that are used across all _fastlane_ tools like your *Apple ID* or the application *Bundle Identifier*, to deploy your lanes faster and tailored on your project needs.

The `Appfile` has to be inside your `./fastlane` directory.

By default an `Appfile` looks like:

```ruby
app_identifier "net.sunapps.1" # The bundle identifier of your app
apple_id "felix@krausefx.com"  # Your Apple email address

# You can uncomment the lines below and add your own
# team selection in case you're in multiple teams
# team_name "Felix Krause"
# team_id "Q2CBPJ58CA"

# To select a team for iTunes Connect use
# itc_team_name "Company Name"
# itc_team_id "18742801"
```

If you have different credentials for iTunes Connect and the Apple Developer Portal use the following code:

```ruby
app_identifier "tools.fastlane.app"       # The bundle identifier of your app

apple_dev_portal_id "portal@company.com"  # Apple Developer Account
itunes_connect_id "tunes@company.com"     # iTunes Connect Account

team_id "Q2CBPJ58CA" # Developer Portal Team ID
itc_team_id "18742801" # iTunes Connect Team ID
```

If your project has different bundle identifiers per environment (i.e. beta, app store), you can define that by using `for_platform` and/or `for_lane` block declaration.

```ruby
app_identifier "net.sunapps.1"
apple_id "felix@krausefx.com"
team_id "Q2CBPJ58CC"

for_platform :ios do
  team_id '123' # for all iOS related things
  for_lane :test do
    app_identifier 'com.app.test'
  end
end
```

You only have to use `for_platform` if you're using `platform [platform_name] do` in your `Fastfile`.

_fastlane_ will always use the lane specific value if given, otherwise fall back to the value on the top of the file. Therefore, while driving the `:test` lane, this configuration is loaded:

```ruby
app_identifier "com.app.test"
apple_id "felix@krausefx.com"
team_id "123"
```

## Accessing from fastlane

If you want to access those values from within your `Fastfile` use

```ruby
identifier = CredentialsManager::AppfileConfig.try_fetch_value(:app_identifier)
team_id = CredentialsManager::AppfileConfig.try_fetch_value(:team_id)
```

# Building Actions

## Using FastlaneCore::Configuration

Most actions accept one or more parameters to customize their behavior. Actions define their
parameters in an `available_options` method. This method returns an array of `FastlaneCore::ConfigItem`
objects to describe supported options. Each option is declared by creating a new
`ConfigItem`, e.g.:

```ruby
FastlaneCore::ConfigItem.new(
  key: :file,
  env_name: "MY_NEW_ACTION_FILE",
  description: "A file to operate on",
  type: String,
  optional: false
)
```

This declares a `file` option for use with the action in a Fastfile, e.g.:

```ruby
my_new_action(file: "file.txt")
```

If the optional `env_name` is present, an environment variable with the specified
name may also be used in place of an option in the Fastfile:

```bash
MY_NEW_ACTION_FILE=file.txt fastlane run my_new_action
```

The `type` argument to the `FastlaneCore::ConfigItem` initializer specifies the
name of a Ruby class representing a standard
data type. Supplied arguments will be coerced to the specified type. Some standard types
support default conversions.

### Boolean parameters

Ruby does not have a single class to represent a Boolean type. When specifying
Boolean parameters, use `is_string: false`, without specifying a `type`, e.g.:

```ruby
FastlaneCore::ConfigItem.new(
  key: :commit,
  env_name: "MY_NEW_ACTION_COMMIT",
  description: "Commit the results if true",
  optional: true,
  default_value: false,
  is_string: false
)
```

When passing a string value, e.g. from an environment variable, certain set
string values are recognized:

```bash
MY_NEW_ACTION_COMMIT=true
MY_NEW_ACTION_COMMIT=false
MY_NEW_ACTION_COMMIT=yes
MY_NEW_ACTION_COMMIT=no
```

These values may also be passed in all caps, e.g. `MY_NEW_ACTION_COMMIT=YES`.

### Array parameters

If a parameter is declared with `type: Array` and a `String` argument is passed,
an array will be produced by splitting the string using the comma character
as a delimiter:

```ruby
FastlaneCore::ConfigItem.new(
  key: :files,
  env_name: "MY_NEW_ACTION_FILES",
  description: "One or more files to operate on",
  type: Array,
  optional: false
)
```

```ruby
my_new_action(files: "file1.txt,file2.txt")
```

This is received by the action as `["file1.txt", "file2.txt"]`.

This also means a parameter that accepts an array may take a single string as an
argument:

```ruby
my_new_action(files: "file.txt")
```

This is received by the action as `["file.txt"]`.

Comma-separated lists are particularly useful when using environment variables:

```bash
export MY_NEW_ACTION_FILES=file1.txt,file2.txt
```

### Polymorphic parameters

To allow for different types to be passed to a parameter (beyond what is
provided above), specify `is_string: false` without a `type` field. Use
an optional `verify_block` argument (see below) or verify the argument within
your action. If the block does not raise, the option is considered verified.
The `UI.user_error!` method is a convenient way to handle verification failure.

```Ruby
FastlaneCore::ConfigItem.new(
  key: :polymorphic_option,
  is_string: false,
  verify_block: ->(value) { verify_option(value) }
)

def verify_option(value)
  case value
  when String
    @polymorphic_option = value
  when Array
    @polymorphic_option = value.join(" ")
  when Hash
    @polymorphic_option = value.to_s
  else
    UI.user_error! "Invalid option: #{value.inspect}"
  end
end
```

### Callback parameters

If your action needs to provide a callback, specify `Proc` for the `type` field.

```Ruby
FastlaneCore::ConfigItem.new(
  key: :callback,
  description: "Optional callback argument",
  optional: true,
  type: Proc
)
```

To invoke the callback in your action, use the `Proc#call` method and pass
any arguments:

```Ruby
params[:callback].call(result) if params[:callback]
```

To notify the user of success or failure, it's usually best just to return a
value such as `true` or `false` from your action. Use a callback for contextual
error handling. For example, the built-in `sh` action passes the entire command
output to an optional `error_callback`:

```Ruby
callback = lambda do |result|
  handle_missing_file if result =~ /file not found/i
  handle_auth_failure if result =~ /login failed/i
end

sh "some_cmd", error_callback: callback
```

### Note on Procs

When passing a block as a parameter to an action or ConfigItem, use
a Proc object. There are three ways to create an instance of Proc in Ruby.

Using the `lambda` operator:
```Ruby
verify_block = lambda do |value|
  ...
end
```

Using `Proc.new`:
```Ruby
verify_block = Proc.new do |value|
  ...
end
```

Using the `Proc` literal notation:
```Ruby
verify_block = ->(value) { ... }
```

Note that you cannot pass a block literal as a `Proc`.

### Verify blocks

Use a `verify_block` argument with your `ConfigItem` to provide special
argument verification:

```Ruby
verify_block = lambda do |value|
  # Has to be a String to get this far
  uri = URI(value)
  UI.error "Invalid scheme #{uri.scheme}" unless uri.scheme == "http" || uri.scheme == "https"
end

FastlaneCore::ConfigItem.new(
  key: :url,
  type: String,
  verify_block: verify_block
)
```

The `verify_block` requires a `Proc` argument (see above).

### Conflicting options

If your action includes multiple conflicting options, use `conflicting_options`
in the `ConfigItem` for each. Make sure conflicting options are optional.

```Ruby
FastlaneCore::ConfigItem.new(
  key: :text,
  type: String,
  optional: true,
  conflicting_options: [:text_file]
),
FastlaneCore::ConfigItem.new(
  key: :text_file,
  type: String,
  optional: true,
  conflicting_options: [:text]
)
```

You can also pass a `conflict_block` (a `Proc`, see above) if you want to
implement special handling of conflicting options:

```Ruby
conflict_block = Proc.new do |other|
  UI.user_error! "Unexpected conflict with option #{other}" unless [:text, :text_file].include?(other)
  UI.message "Ignoring :text_file in favor of :text"
end

FastlaneCore::ConfigItem.new(
  key: :text,
  type: String,
  optional: true,
  conflicting_options: [:text_file],
  conflict_block: conflict_block
),
FastlaneCore::ConfigItem.new(
  key: :text_file,
  type: String,
  optional: true,
  conflicting_options: [:text],
  conflict_block: conflict_block
)
```

### Optional parameters

Parameters with `optional: true` will be `nil` unless a `default_value` field
is present. Make sure the `default_value` is reasonable unless it's acceptable
for the key to be absent.

```Ruby
FastlaneCore::ConfigItem.new(
  key: :build_configuration,
  description: "Which build configuration to use",
  type: String,
  optional: true,
  default_value: "Release"
),
FastlaneCore::ConfigItem.new(
  key: :offset,
  description: "Offset to start from",
  type: Integer,
  optional: true,
  default_value: 0
),
FastlaneCore::ConfigItem.new(
  key: :workspace,
  description: "Optional workspace path",
  type: String,
  optional: true
  # Not every project has a workspace, so nil is a good default value here.
)
```

Within the action `params[:build_configuration]` will never be nil. Specifying
the `default_value` is preferable to something in code like:

```Ruby
config = params[:build_configuration] || "Release"
```

Default values are included in the documentation for action parameters.

### Configuration files

Many built-in actions such as _deliver_, _gym_ and _scan_ support configuration files
(`Deliverfile`, `Gymfile`, `Scanfile`). This is useful for actions with many options.
To add support for a configuration file to a custom action, call `load_configuration_file`
early, usually as the first line of `run`:

```ruby
def self.run(params)
  params.load_configuration_file("MyNewActionfile")
  # ...
```

This will load any parameters specified in `MyNewActionfile`. This method looks for
the specified file in `./fastlane`, `./.fastlane` and `.`, in that order. The
file is evaluated by the Ruby interpreter.
You may specify they `key` from any `FastlaneCore::ConfigItem` as a method call in the
configuration file:

```ruby
command "ls -la"
files %w{file1.txt file2.txt}
```

### Resolution order

Parameters are resolved from different sources in the following order:

1. A parameter directly passed to an action using the `key`, usually from the
    `Fastfile`.
2. An environment variable, if the `env_name` is set.
3. A configuration file used in `load_configuration_file`.
4. The `default_value` of the `ConfigItem`. If not explicitly set, this will be
    `nil`.

## User input and output

The `FastlaneCore::UI` utility may be used to display output to the user and also
request input from an action.
`UI` includes a number of methods to customize the output for different purposes:

```ruby
UI.message "Hello from my_new_action."
UI.important "Warning: This is a new action."
UI.error "Something unexpected happened in my_new_action. Attempting to continue."
```

|method|description|
|------|-----------|
|error|Displays an error message in red|
|important|Displays a warning or other important message in yellow|
|success|Displays a success message in green|
|message|Displays a message in the default output color|
|deprecated|Displays a deprecation message in bold blue|
|command|Displays a command being executed in cyan|
|command_output|Displays command output in magenta|
|verbose|Displays verbose output in the default output color|
|header|Displays a message in a box for emphasis|

Methods ending in an exclamation point (`!`) terminate execution of the current
lane and report an error:

```ruby
UI.user_error! "Could not open file #{file_path}"
```

|method|description|
|------|-----------|
|crash!|Report a catastrophic error|
|user_error!|Rescue an exception in your action and report a nice message to the user|
|shell_error!|Report failure of a shell command|
|build_failure!|Report a build failure|
|test_failure!|Report a test failure|
|abort_with_message!|Report a failure condition that prevents continuing|

Note that these methods raise exceptions that are rescued in the runner context for
the lane. This terminates further lane execution, so it is not necessary to return.

```ruby
# No need for "and return" here
UI.user_error!("Could not open file #{file_path}") and return if file.nil?
```

The following methods may be used to prompt the user for input.

```ruby
if UI.interactive?
  name = UI.input "Please enter your name: "
  is_correct = UI.confirm "Is this correct? "
  choice = UI.select "Please choose from the following list:", %w{alpha beta gamma}
  password = UI.password "Please enter your password: "
end
```

|method|description|
|------|-----------|
|interactive?|Indicates whether interactive input is possible|
|input|Prompt the user for string input|
|confirm|Ask the user a binary question|
|select|Prompt the user to select from a list of options|
|password|Prompt the user for a password (masks output)|

## Invoking shell commands

If your action needs to run a shell command, there are several methods. You can
easily determine the exit status of the command and capture all terminal output
from the command.

### Using Kernel#system

Use the Ruby `system` method call to invoke a command string. This does not
redirect stdin, stdout or stderr, so output formatting will be unaffected. It executes
the command in a subshell.

```ruby
system "cat fastlane/Fastfile"
```

Upon command completion, the method returns true or false to indicate completion
status. The `$?` global variable will also indicate the exit status of the
command.

```ruby
system "cat fastlane/Fastfile"
UI.user_error! "Could not execute command" unless $?.exitstatus == 0
```

If the command to be executed is not found,
`$?.exitstatus` will be nonzero.

### Using backticks

To capture the output of a command, enclose the command in backticks:

```ruby
pod_cmd = `which pod`
UI.important "'pod' command not found" if pod_cmd.empty?
```

Because you are capturing stdout, the command output will not appear at
the terminal unless you log it using `UI`. Formatting may be lost when
capturing command output. The entire output to stdout will be captured after the
command returns. Output to stderr is not captured or redirected. The `$?`
global variable will indicate the completion status of the command.

If the command to be executed is not found, `Errno::ENOENT` is raised.

### Using the sh method

You can also use the built-in `Actions.sh` method:

```ruby
sh "pwd"
```

This is called the same way as in a Fastfile. This provides consistent
logging of command output. All output to stdout and stderr is logged via `UI`.

To be notified when an error occurs, use the `error_callback` parameter:

```ruby
success = true
sh("pwd", error_callback: ->(result) { success = false })
UI.user_error "Command failed" unless success
```

The `result` argument to the `error_callback` is the entire string output
of the command. The exit status of the command will be available in `$?`.
The return value of the method is the output of the command.

If the command to be executed is not found, `Errno::ENOENT` is raised.

### Escaping in shell commands

Use `shellwords` to escape arguments to shell commands.

```Ruby
`git commit -aqm #{Shellwords.escape commit_message}`
```

```Ruby
system "cat #{path.shellescape}"
```

When using `sh`, pass a list of arguments. Each argument will be
converted to a string, shell-escaped, and the resulting array joined to form
the command.

```Ruby
sh "git", "commit", "-aqm", commit_message
sh "cat", path
```

Arguments need not be strings. Each element will be converted to a string
using `#to_s` before shell-escaping. This is convenient when working with
utility classes such as `Pathname`.

## Calling other actions

Some built-in utility actions, such as `sh`, may be used in custom actions (e.g., in
plugins). It's not generally a good idea to call a complex action from another action.
In particular:

- If you're calling one plugin action from another plugin action, you should
  probably refactor your plugin helper to be more easily called from all actions
  in the plugin.
- Avoid wrapping complex built-in actions like _deliver_ and _gym_.
- There can be issues with one plugin depending on another plugin.
- Certain simple built-in utility actions may be used with `other_action` in your
  action, such as: `other_action.git_add`, `other_action.git_commit`.
- Think twice before calling an action from another action. There is often a better
  solution.
