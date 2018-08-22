{!docs/includes/setup-fastlane-header.md!}

# Fastfile

The `Fastfile` stores the automation configuration that can be run with _fastlane_.

The `Fastfile` has to be inside your `./fastlane` directory.

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