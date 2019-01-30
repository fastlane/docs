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

Head over to [Available Plugins](https://docs.fastlane.tools/plugins/available-plugins/) for a list of plugins you can use.

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
