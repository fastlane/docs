![img/fastlane_text.png](img/fastlane_text.png)

fastlane
============

[![Twitter: @FastlaneTools](https://img.shields.io/badge/contact-@FastlaneTools-blue.svg?style=flat)](https://twitter.com/FastlaneTools){: .badge }
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/fastlane/fastlane/blob/master/LICENSE){: .badge }
[![Gem](https://img.shields.io/gem/v/fastlane.svg?style=flat)](https://rubygems.org/gems/fastlane){: .badge }
[![Platforms](https://img.shields.io/badge/os-macos%20--%20linux%20--%20windows-blue?style=flat)](#){: .badge }
[![OpenCollective](https://opencollective.com/fastlane/tiers/badge.svg)](https://opencollective.com/fastlane){: .badge }

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. 🚀 It handles all tedious tasks, like generating screenshots, dealing with code signing, and releasing your application.

You can start by creating a `Fastfile` file in your repository, here’s one that defines your beta or App Store release process:

```ruby
lane :beta do
  increment_build_number
  build_app
  upload_to_testflight
end

lane :release do
  capture_screenshots
  build_app
  upload_to_app_store       # Upload the screenshots and the binary to iTunes
  slack                     # Let your team-mates know the new version is live
end
```

You just defined 2 different lanes, one for beta deployment, one for App Store. To release your app in the App Store, all you have to do is

```no-highlight
fastlane release
```

## Why fastlane?

|              | fastlane
-------------- | ----------
🚀 | Save **hours** every time you push a new release to the store or beta testing service
✨ | Integrates with all your existing tools and services (more than 400 integrations)
📖 | 100% open source under the MIT license
🎩 | Easy setup assistant to get started in a few minutes
⚒ | Runs on **your** machine, it's your app and your data
👻 | Integrates with all major CI systems
🖥 | Supports iOS, Mac, and Android apps
🔧 | Extend and customise _fastlane_ to fit your needs, you're not dependent on anyone
💭 | Never remember any commands anymore, just _fastlane_
🚢 | Deploy from any computer, including a CI server

## Getting Started

### Installing _fastlane_

{!docs/includes/installing-fastlane.md!}

### Setting up _fastlane_

Navigate to your iOS or Android app and run

```no-highlight
fastlane init
```

_fastlane_ will automatically detect your project, and ask for any missing information.

For more details about how to get up and running, check out the getting started guides:

- [fastlane Getting Started guide for iOS](getting-started/ios/setup.md)
- [fastlane Getting Started guide for Android](getting-started/android/setup.md)

## Questions and support

Before submitting a new GitHub issue, please make sure to search for [existing GitHub issues](https://github.com/fastlane/fastlane/issues).

If that doesn't help, please [submit an issue](https://github.com/fastlane/fastlane/issues) on GitHub and provide information about your setup, in particular the output of the `fastlane env` command.

## System requirements

_fastlane_ is officially supported to run on macOS.

🐧 Linux and 🖥️ Windows are partially supported. Some underlying software like Xcode are only available on macOS, but many other tools, actions, and the `spaceship` module can work on other platforms.

## _fastlane_ team

{!docs/generated/team-table.md!}

Special thanks to all [contributors](https://github.com/fastlane/fastlane/graphs/contributors) for extending and improving _fastlane_.

## Metrics
 
_fastlane_ tracks a few key metrics to understand how developers are using the tool and to help us know what areas need improvement. No personal/sensitive information is ever collected. Metrics that are collected include: 
 
* The number of _fastlane_ runs
* A salted hash of the app identifier or package name, which helps us anonymously identify unique usage of _fastlane_
* How _fastlane_ is executed (Swift vs Ruby)
* The _fastlane_ version
* How _fastlane_ was installed (Homebrew, gem, bundler, etc)
* The Ruby version
* The Operating System in use
* The Xcode version
* Whether it was run in non-interactively or interactively
 
You can easily opt-out of metrics collection by adding `opt_out_usage` at the top of your `Fastfile` or by setting the environment variable `FASTLANE_OPT_OUT_USAGE`. [Check out the metrics code on GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane_core/lib/fastlane_core/analytics)

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](https://github.com/fastlane/fastlane/blob/master/LICENSE) file.

> This project and all fastlane tools are in no way affiliated with Apple Inc. This project is open source under the MIT license, which means you have full access to the source code and can modify it to fit your own needs. All fastlane tools run on your own computer or server, so your credentials or other sensitive information will never leave your own computer. You are responsible for how you use fastlane tools.

----
### Where to go from here?
- [fastlane Getting Started guide for iOS](getting-started/ios/setup.md)
- [fastlane Getting Started guide for Android](getting-started/android/setup.md)
