# fastlane Plugins

The instructions below require _fastlane_ 1.93.0 or higher

_fastlane_ is an open platform and we enable every developer to extend it to fit their needs. That's why we built a plugin system that allows you and your company to provide _fastlane_ plugins to other _fastlane_ users. You have the full power and responsibility of maintaining your plugin and keeping it up to date. This is useful if you maintain your own library or web service, and want to make sure the _fastlane_ plugin is always up to date.

## Local actions

<script type="text/javascript">
(function () {
    var anchorMap = {
        "local-actions": "/create-action/"
    }
    var hash = window.location.hash.substring(1);
    if (hash) {
        if (anchorMap[hash]) {
            link = anchorMap[hash] + '#' + hash;
            window.location.replace(link);
        }
    }
})();
</script>

This content was moved and now lives [here](/create-action/#local-actions).

## Find a plugin

Head over to [Available Plugins](https://docs.fastlane.tools/plugins/available-plugins) for a list of plugins you can use.

List all available plugins using

```no-highlight
fastlane search_plugins
```

To search for something specific
```no-highlight
fastlane search_plugins [query]
```

## Add a plugin to your project

```no-highlight
fastlane add_plugin [name]
```

_fastlane_ will assist you on setting up your project to start using plugins.

This will:

- Add the plugin to `fastlane/Pluginfile`
- Make sure your `fastlane/Pluginfile` is properly referenced from your `./Gemfile`
- Run `fastlane install_plugins` to make sure all required dependencies are installed on your local machine (this step might ask for your admin password to install Ruby gems)
- You'll have 3 new files, that should all be checked into version control: `Gemfile`, `Gemfile.lock` and `fastlane/Pluginfile`

### Plugin Source

Your `fastlane/Pluginfile` contains the list of all _fastlane_ plugins your project uses. The `Pluginfile` is a [Gemfile](http://bundler.io/gemfile.html) that gets imported from your main `Gemfile`.
You specify all dependencies, including the required version numbers:

```ruby
# Fetched from RubyGems.org
gem "fastlane-plugin-xcversion"

# Fetched from GitHub
gem "fastlane-plugin-xcversion", git: "https://github.com/fastlane/fastlane-plugin-xcversion"

# Fetched from a local directory
gem "fastlane-plugin-xcversion", path: "../fastlane-plugin-xcversion"

# Specify a version requirements
gem "fastlane-plugin-xcversion", "1.1.0"
gem "fastlane-plugin-xcversion", ">= 1.0"
```

[More information about a Gemfile](http://bundler.io/gemfile.html)

## Install plugins on another machine

To make sure all plugins are installed on the local machine, run

```no-highlight
fastlane install_plugins
```

## Remove a plugin

Open your `fastlane/Pluginfile` and remove the line that looks like this

```ruby
gem "fastlane-plugin-[plugin_name]"
```

## Create your own plugin

```no-highlight
cd ~/new/folder/

fastlane new_plugin [plugin_name]
```

- _fastlane_ creates the directory structure that's needed to be a valid Ruby gem
- Edit the `lib/fastlane/plugin/[plugin_name]/actions/[plugin_name].rb` and implement your action
- Easily test the plugin locally by running `fastlane add_plugin` in your project's directory and specifying the local path when asked for it

#### New plugin for existing gem

If you already have an existing gem you want to provide a _fastlane_ plugin for, you'll still have to create a new Ruby gem. The reason for that is the way plugins are imported.

The example project [xcake](https://github.com/jcampbell05/xcake) contains a folder named `fastlane-plugin-xcake`.

All you have to do if you have an existing gem:

- Navigate to your gem
- `fastlane new_plugin [plugin_name]`
- Inside the newly created folder, edit the `fastlane-plugin-[plugin_name].gemspec` and add your gem as a dependency. It is recommended to also specify a version number requirement

### Publishing your plugin

#### RubyGems

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

#### GitHub

If for some reason you don't want to use RubyGems, you can also make your plugin available on GitHub. Your users then need to add the following to the `Pluginfile`

```ruby
gem "fastlane-plugin-[plugin_name]", git: "https://github.com/[user]/[plugin_name]"
```

## Advanced

### Multiple actions in one plugin

Let's assume you work on a _fastlane_ plugin for project management software. You could call it `fastlane-plugin-pm` and it may contain any number of actions and helpers, just add them to your `actions` folder. Make sure to mention the available actions in your plugin's `README.md`.
