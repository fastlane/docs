{!docs/includes/setup-fastlane-header.md!}

# Fastfile

The `Fastfile` stores the automation configuration that can be run with _fastlane_.

The `Fastfile` has to be inside your `./fastlane` directory.

The `Fastfile` is used to configure [_fastlane_](https://fastlane.tools). Open it in your favourite text editor, using Ruby syntax highlighting.

Defining lanes is easy. 

```rb
lane :my_lane do
  # Whatever actions you like go in here.
end
```

Make as many lanes as you like!

### `before_all` block

This block will get executed *before* running the requested lane. It supports the same actions as lanes.

```ruby
before_all do |lane|
  cocoapods
end
```

### `after_all` block

This block will get executed *after* running the requested lane. It supports the same actions as lanes.

It will only be called, if the selected lane was executed **successfully**.

```ruby
after_all do |lane|
  say("Successfully finished deployment (#{lane})!")
  slack(
    message: "Successfully submitted new App Update"
  )
  sh("./send_screenshots_to_team.sh") # Example
end
```

### `error` block

This block will get executed when an error occurs, in any of the blocks (*before_all*, the lane itself or *after_all*).
You can get more information about the error using the `error_info` property.

```ruby
error do |lane, exception|
  slack(
    message: "Something went wrong with the deployment.",
    success: false,
    payload: { "Error Info" => exception.error_info.to_s } 
  )
end
```

## Extensions

Why only use the default actions? Create your own to extend the functionality of _fastlane_.

The build step you create will behave exactly like the built in actions.

Just run `fastlane new_action`. Then enter the name of the action and edit the generated Ruby file in `fastlane/actions/[action_name].rb`.

From then on, you can just start using your action in your `Fastfile`.

If you think your extension can be used by other developers as well, let me know, and we can bundle it with _fastlane_.

To call another action from within your action, just use the same code you would use in a `Fastfile`:

```ruby
other_action.deliver(text: "Please input your password:", 
                      key: 123)
```

In general, think twice before you do this, most of the times, these action should be separate. Only call actions from within action if it makes sense.

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

## `import_from_gem`

Import from another Ruby gem, which you can use to create a single package with common `Fastfile`s and actions for all your projects.

```ruby
import_from_gem(gem_name: 'my_gem')
# or
import_from_gem(gem_name: 'my_gem',
               paths: ['fastlane/Fastfile', 'fastlane/Fastfile_*'])

lane :new_main_lane do
  # ...
end
```

This will also automatically import all the local actions from this gem.

## Note

You should import the other `Fastfile` on the top above your lane declarations. When defining a new lane _fastlane_ will make sure to not run into any name conflicts. If you want to overwrite an existing lane (from the imported one), use the `override_lane` keyword.

# Load own actions from external folder

Add this to the top of your `Fastfile`.

```ruby
actions_path '../custom_actions_folder/'
```

# Using fastlane_require

If you're using a third party gem in your `Fastfile`, it is recommended to use `fastlane_require` instead of `require`. `fastlane_require` will:

- Verify the gem is installed
- Show installation instructions if not installed
- Require the gem (like `require` does)

## Example

```rb
fastlane_require 'hike'

lane :release do
  # Do stuff with hike
end
```
