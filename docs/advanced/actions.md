{!docs/includes/setup-fastlane-header.md!}

# Actions

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

If the command to be executed is not found, system will return `nil`, and
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

You can also use the built-in `sh` method:

```ruby
sh "pwd"
```

This is called the same way in an action as in a Fastfile. This provides consistent
logging of command output. All output to stdout and stderr is logged via `UI`.

The `sh` method can accept a block, which will receive the `Process::Status`
returned by the command, the complete output of the command, and an equivalent
shell command upon completion of the command.

```ruby
sh "ls", "-la" do |status, result, command|
  unless status.success?
    UI.error "Command #{command} (pid #{status.pid}) failed with status #{status.exitstatus}"
  end
  UI.message "Output is #{result.inspect}"
end
```

To be notified only when an error occurs, use the `error_callback` parameter
(a Proc):

```ruby
success = true
sh("pwd", error_callback: ->(result) { success = false })
UI.user_error "Command failed" unless success
```

The `result` argument to the `error_callback` is the entire string output
of the command.

If the command to be executed is not found, `Errno::ENOENT` is raised without
calling the block or `error_callback`.

If an `error_callback` or block is not provided, and the command executes and
returns an error, an exception is raised, and lane execution is terminated
unless the exception is rescued. The exit status of the command will be available in `$?`. It is also available
as the first argument to a block.

The return value of the method is the output of the command, unless a block is
given. Then the output is available within the block, and the return value of
`sh` is the return value of the block. This enables usage like:

```ruby
if sh command { |s| s.success? }
  UI.success "Command succeeded"
else
  UI.error "Command failed"
end
```

Anywhere other than an action or a Fastfile (e.g. in helper code), you can
invoke this method as `Actions.sh`.

### Escaping in shell commands

Use `shellwords` to escape arguments to shell commands.

```Ruby
`git commit -aqm #{Shellwords.escape commit_message}`
```

```Ruby
system "cat #{path.shellescape}"
```

When using `system` or `sh`, pass a list of arguments instead of shell-escaping
individual arguments.

```Ruby
sh "git", "commit", "-aqm", commit_message
system "cat", path
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