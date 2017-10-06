![img/fastlane_text.png](img/fastlane_text.png)

fastlane
============

[![Twitter: @FastlaneTools](https://img.shields.io/badge/contact-@FastlaneTools-blue.svg?style=flat)](https://twitter.com/FastlaneTools){: .badge }
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/fastlane/fastlane/blob/master/LICENSE){: .badge }
[![Gem](https://img.shields.io/gem/v/fastlane.svg?style=flat)](https://rubygems.org/gems/fastlane){: .badge }

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. 🚀 It handles all tedious tasks, like generating screenshots, dealing with code signing, and releasing your application.

You can start by creating a `Fastfile` file in your repository, here’s one that defines your beta or App Store release process:

```ruby
lane :beta do
  increment_build_number
  gym                       # Build your app
  testflight                # Upload to TestFlight
end

lane :appstore do
  snapshot                  # Generate screenshots for the App Store
  gym                       # Build your app
  deliver                   # Upload the screenshots and the binary to iTunes
  slack                     # Let your team-mates know the new version is live
end
```

You just defined 2 different lanes, one for beta deployment, one for App Store. To release your app in the App Store, all you have to do is

```no-highlight
fastlane appstore
```

## Why fastlane?

|              | fastlane
-------------- | ----------
🚀 | Save **hours** every time you push a new release to the store or beta testing service
✨ | Integrates with all your existing tools and services (170 actions currently)
📖 | 100% open source under the MIT license
🎩 | Easy setup assistant to get started in a few minutes
⚒ | Runs on **your** machine, it's your app and your data
👻 | Integrates with all major CI systems
🖥 | Supports iOS, Mac, and Android apps
🔧 | Extend and customise _fastlane_ to fit your needs, you're not dependent on anyone
💭 | Never remember any commands any more, just _fastlane_
🚢 | Deploy from any computer, including a CI server

## Getting Started

Make sure you have the latest version of the Xcode command line tools installed:

```no-highlight
xcode-select --install
```

### Choose your installation method:

<table width="100%">
<tr>
<th width="33%"><a href="http://brew.sh">Homebrew</a></td>
<th width="33%">Installer Script</td>
<th width="33%">Rubygems</td>
</tr>
<tr>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS or Linux with Ruby 2.0.0 or above</td>
</tr>
<tr> 
<td width="33%"><code>brew cask install fastlane</code></td>
<td width="33%"><a href="https://download.fastlane.tools">Download the zip file</a>. Then double click on the <code>install</code> script (or run it in a terminal window).</td>
<td width="33%"><code>sudo gem install fastlane -NV</code></td>
</tr>
</table>

Navigate to your iOS or Android app and run

```no-highlight
fastlane init
```

_fastlane_ will automatically detect your project, and ask for any missing information.

For more details about how to get up and running, check out the getting started guides:

- [fastlane Getting Started guide for iOS](getting-started/ios/setup.md)
- [fastlane Getting Started guide for Android](getting-started/android/setup.md)

### Using the Fabric app

If you're not familiar with the terminal and prefer a graphical user interface, download the [Fabric app](https://get.fabric.io/) and use the built-in _fastlane_ button.

## Questions and support

Before submitting a new GitHub issue, please make sure to

- Check out [docs.fastlane.tools](https://docs.fastlane.tools)
- Check out the README pages on [this repo](https://github.com/fastlane/fastlane)
- Search for [existing GitHub issues](https://github.com/fastlane/fastlane/issues)

If the above doesn't help, please [submit an issue](https://github.com/fastlane/fastlane/issues) on GitHub and provide information about your setup, in particular the output of the `fastlane env` command.

## System requirements

Currently, _fastlane_ is officially supported to run on macOS. Support for other operating systems is limited and untested at this point in time. _fastlane_ uses system APIs that may not be implemented on other platforms, for example, we use the Ruby `fork` method for sub-process management, which isn't available on Windows.

## Special Thanks

Thanks to all [contributors](https://github.com/fastlane/fastlane/graphs/contributors) for extending and improving `fastlane`.

## Speakers

Are you giving a talk on fastlane? Great! [Let us know](https://fastlane.tools/speaking) so we can help you give the best possible presentation. 

## Metrics

_fastlane_ tracks a few key metrics to understand how developers are using the tool and to help us know what areas need improvement. No personal/sensitive information is ever collected. Metrics that are collected include: 

* The number of successes, errors, and crashes for _fastlane_ and each action run in a Fastfile
* The running time of _fastlane_
* The method by which _fastlane_ was installed
* Whether _fastlane_ is being run on CI
* The platform (e.g. iOS, Android) for which _fastlane_ is run
* A hash of the app identifier or package name, which helps us anonymously identify unique usage of _fastlane_

We have recently changed the destination service to which these metrics are reported, as well as the format of the data, but the data that is collected has not changed.

You can easily opt-out of metrics collection by adding `opt_out_usage` at the top of your `Fastfile` or by setting the environment variable `FASTLANE_OPT_OUT_USAGE`. Participating helps us provide the best possible support for _fastlane_, so we hope you'll consider it a plus! :heavy_plus_sign:

## Crash Reporting

In order to continuously improve stability, _fastlane_ will record crash reports with sanitized stack traces. Sanitization removes personal information from the stack trace and error message (including home directories, _fastlane_ path, gem paths, environment variables, and parameters).

You can easily opt-out of crash reporting by adding `opt_out_crash_reporting` at the top of your `Fastfile` or by setting the environment variable `FASTLANE_OPT_OUT_CRASH_REPORTING`. Just like metrics mentioned above, participating helps us provide the best possible support for _fastlane_, so we hope you'll consider it a plus! :heavy_plus_sign:

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](https://github.com/fastlane/fastlane/blob/master/LICENSE) file.

> This project and all fastlane tools are in no way affiliated with Apple Inc. This project is open source under the MIT license, which means you have full access to the source code and can modify it to fit your own needs. All fastlane tools run on your own computer or server, so your credentials or other sensitive information will never leave your own computer. You are responsible for how you use fastlane tools.
