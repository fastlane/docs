# Create your own fastlane plugin

```no-highlight
cd ~/new/folder/

fastlane new_plugin [plugin_name]
```

- _fastlane_ creates the directory structure that's needed to be a valid Ruby gem
- Edit the `lib/fastlane/plugin/[plugin_name]/actions/[plugin_name].rb` and implement your action
- Easily test the plugin locally by running `fastlane add_plugin` in your project's directory and specifying the local path when asked for it

## New plugin for existing gem

If you already have an existing gem you want to provide a _fastlane_ plugin for, you'll still have to create a new Ruby gem. The reason for that is the way plugins are imported.

The example project [xcake](https://github.com/jcampbell05/xcake) contains a folder named `fastlane-plugin-xcake`.

All you have to do if you have an existing gem:

- Navigate to your gem
- `fastlane new_plugin [plugin_name]`
- Inside the newly created folder, edit the `fastlane-plugin-[plugin_name].gemspec` and add your gem as a dependency. It is recommended to also specify a version number requirement

## Publishing your plugin

### RubyGems

The recommended way to publish your plugin is to publish it on [RubyGems.org](https://rubygems.org). Follow the steps below to publish your plugin.

1. Create an account at [RubyGems.org](https://rubygems.org)
2. Publish your plugin to a [GitHub](https://github.com) repo
3. Update the `fastlane-plugin-[plugin_name].gemspec` file so that the `spec.homepage` points to your github repo.
4. Publish the first release of your plugin:
```sh
bundle install
rake install
rake release
```

Now all your users can run `fastlane add_plugin [plugin_name]` to install and use your plugin.

### GitHub

If for some reason you don't want to use RubyGems, you can also make your plugin available on GitHub. Your users then need to add the following to the `Pluginfile`

```ruby
gem "fastlane-plugin-[plugin_name]", git: "https://github.com/[user]/[plugin_name]"
```

## Advanced

### Multiple actions in one plugin

Let's assume you work on a _fastlane_ plugin for project management software. You could call it `fastlane-plugin-pm` and it may contain any number of actions and helpers, just add them to your `actions` folder. Make sure to mention the available actions in your plugin's `README.md`.
