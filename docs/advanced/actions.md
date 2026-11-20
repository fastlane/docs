{!docs/includes/setup-fastlane-header.md!}

# Actions

# Naming actions

You can specify a _"step name"_ for all actions (starting with `fastlane 2.120.0`) to disambiguate the use of some action several times, in different context.
To do so, add the `:step_name` property to your arguments.

For instance with the [fastlane-plugin-yarn](https://github.com/joshrlesch/fastlane-plugin-yarn) and the native sh:
```ruby
yarn(step_name: 'install_dependencies')
yarn(command: 'build', step_name: 'building_project')
yarn(command: 'test', step_name: 'testing_project')
yarn(command: 'publish-coverage', step_name: 'publishing_project')
```
These name will appear as the step description instead of generic `yarn` as you can see in the following output:
```
[08:13:37]: --- Step: install_dependencies ---
[08:13:37]: ----------------------------------
[08:13:37]: $ yarn
[08:13:37]: ▸ yarn install v1.12.3
[08:13:37]: ▸ [1/4] Resolving packages...
[08:13:37]: ▸ success Already up-to-date.
[08:13:37]: ▸ Done in 0.04s.
[08:13:37]: ------------------------------
[08:13:37]: --- Step: building_project ---
[08:13:37]: ------------------------------
[08:13:37]: $ yarn build
[08:13:37]: ▸ yarn run v1.12.3
[08:13:38]: ▸ $ sleep 22 && echo build the project
[08:14:00]: ▸ build the project
[08:14:00]: ▸ Done in 22.09s.
[08:14:00]: -----------------------------
[08:14:00]: --- Step: testing_project ---
[08:14:00]: -----------------------------
[08:14:00]: $ yarn test
[08:14:00]: ▸ yarn run v1.12.3
[08:14:00]: ▸ $ sleep 30 && echo test all the things
[08:14:30]: ▸ test all the things
[08:14:30]: ▸ Done in 30.09s.
[08:14:30]: ------------------
[08:14:30]: --- Step: yarn ---
[08:14:30]: ------------------
[08:14:30]: $ yarn publish-coverage
[08:14:30]: ▸ yarn run v1.12.3
[08:14:31]: ▸ $ sleep 12 && echo Covered all the things
[08:14:43]: ▸ Covered all the things
[08:14:43]: ▸ Done in 12.10s.

+------+----------------------------+-------------+
|                fastlane summary                 |
+------+----------------------------+-------------+
| Step | Action                     | Time (in s) |
+------+----------------------------+-------------+
| 1    | install_dependencies       | 0           |
| 2    | building_project           | 22          |
| 3    | testing_project            | 30          |
| 4    | yarn                       | 12          |
+------+----------------------------+-------------+
```


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
  UI.error "Whoops, invalid"
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

###### or, for a value you parse
diff = sh("git", "diff", separate_stderr: true)

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

1. A parameter directly passed to an action using the `key`, usually from the `Fastfile`.
2. An environment variable, if the `env_name` is set.
3. A configuration file used in `load_configuration_file`.
4. The `default_value` of the `ConfigItem`. If not explicitly set, this will be `nil`.

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

Use `sh` to run a command from an action, a plugin or a Fastfile. It logs the
command and its output, and fails the lane when the command fails. The sections
after it cover the few cases where `system` or
`FastlaneCore::CommandExecutor.execute` fit better, and why to avoid backticks.

### Using the sh method

```ruby
sh("git", "commit", "-m", message)
```

This is called the same way in an action as in a Fastfile. Anywhere else (e.g.
in helper code), call it as `Actions.sh`.

Pass the command as a list of arguments, as above: it runs without a shell, so a
value with a space or `;` in it stays one argument. A single string goes through
the shell, which you need for a glob, `~`, `$VAR`, a pipe or a redirection:

```ruby
sh("ls *.ipa | wc -l")
```

`sh` returns the command's output, stdout and stderr merged, and prints it line by
line as it comes. If the command exits with a nonzero status, `sh` raises and the
lane stops, unless the exception is rescued. If the command is not found,
`Errno::ENOENT` is raised.

To handle the result yourself, pass a block. It receives the `Process::Status`,
the output and the command as printed, and `sh` returns the block's value instead
of raising:

```ruby
sh("ls", "-la") do |status, result, command|
  unless status.success?
    UI.error("Command #{command} (pid #{status.pid}) failed with status #{status.exitstatus}")
  end
  UI.message("Output is #{result.inspect}")
end

if sh(command) { |status| status.success? }
  UI.success("Command succeeded")
end
```

Read the exit status from the block, not from `$?`: after `sh`, `$?` still holds
the status of an earlier command.

To be notified only when an error occurs, use `error_callback` (a Proc). It
receives the output, and `sh` does not raise:

```ruby
success = true
sh("pwd", error_callback: ->(result) { success = false })
UI.user_error!("Command failed") unless success
```

The block and `error_callback` are not called when the command is not found.

`sh` also takes these options:

|option|description|
|------|-----------|
|`log`|`false` prints neither the command nor its output (`--troubleshoot` prints them anyway)|
|`separate_stderr`|`true` returns stdout only, for output you parse; stderr is still printed, and goes to the error message and `error_callback`|
|`stdin`|Data written to the command's standard input. fastlane never prints it, though the command's own output may show it|
|`chdir`|Directory the command runs in; fastlane's own directory stays as it is|

```ruby
version = sh("xcodebuild", "-version", separate_stderr: true)
sh("gh", "auth", "login", "--with-token", stdin: ENV["GH_TOKEN"])
sh("./gradlew", "assemble", chdir: "android")
```

Without `stdin`, the command reads an empty input, so a command that asks a
question gets end-of-file instead of waiting.

A Fastfile's `sh` runs in the `fastlane` directory, unlike actions; see
[Directory behavior](fastlane.md#directory-behavior).

In a plugin's specs, `Actions.sh` returns the command string instead of running
it, so a spec can check the command it builds.

### Keeping secrets out of the log

`sh` prints the command, including its environment variables and arguments:
`sh({ "TOKEN" => token }, "tool")` prints `$ TOKEN=<the token> tool`. To pass a
secret, prefer `stdin` for a tool that reads it from its input. Otherwise pass
`log: false`.

### Commands that ask the user something

`sh` gives the command a pipe for input, not the terminal, and prints its output
a line at a time, so a prompt such as `Name: ` is not shown until it is answered.
Give the tool a flag such as `--non-interactive` if it has one. Otherwise use
`system`, which connects the command to the terminal:

```ruby
UI.user_error!("Could not log in") unless system("tool", "login")
```

`system` returns `true` or `false`, or `nil` if the command is not found. It does
not fail the lane, so check the result.

### Using backticks and Helper.backticks

Ruby's backticks and `FastlaneCore::Helper.backticks` both run a string through
the shell and return stdout only:

```ruby
version = `xcodebuild -version`
version = Helper.backticks("xcodebuild -version", print: false)
```

Neither checks the exit status: a failing command returns what it printed and the
lane goes on, so check `$?` yourself. Backticks log nothing, and stderr goes
straight to the terminal. `Helper.backticks` prints the command, then the output
once the command has finished, unless `print: false`.

Prefer `sh` with `separate_stderr: true`: it also returns stdout only, prints the
output as it comes and fails the lane when the command fails.

### Using FastlaneCore::CommandExecutor.execute

Some tools print their progress only to a terminal. `execute` runs the command on
a pseudo-terminal:

```ruby
FastlaneCore::CommandExecutor.execute(command: "xcodebuild -list",
                                    print_all: true,
                                        error: proc do |output, status|
                                          # handle error here
                                        end)
```

The command is always a string run through the shell. It returns stdout and
stderr merged, without the final newline. It prints the command, and the output
only with `print_all: true` or `--verbose`. It takes `chdir:`, and `env:`, which
it never prints. Nothing writes to the command's input, so a command that reads it
waits forever.

### Timeouts

None of these methods has a timeout. Wrapping one in `Timeout.timeout` leaves the
command running after the exception. Use the tool's own timeout option if it has
one.

### Escaping in shell commands

Prefer a list of arguments, which needs no escaping:

```Ruby
sh "git", "commit", "-aqm", commit_message
```

When a command string goes through the shell, use `shellwords` to escape the
values in it:

```Ruby
sh "git commit -aqm #{commit_message.shellescape} && git push"
FastlaneCore::CommandExecutor.execute(command: "cat #{path.shellescape}")
```

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
