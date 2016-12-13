![img/fastlane_text.png](img/fastlane_text.png)

fastlane
============

[![Twitter: @FastlaneTools](https://img.shields.io/badge/contact-@FastlaneTools-blue.svg?style=flat)](https://twitter.com/FastlaneTools){: .badge }
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/fastlane/fastlane/blob/master/LICENSE){: .badge }
[![Gem](https://img.shields.io/gem/v/fastlane.svg?style=flat)](http://rubygems.org/gems/fastlane){: .badge }

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
<td width="33%"><a href="https://download.fastlane.tools/fastlane.zip">Download the zip file</a>. Then double click on the <code>install</code> script (or run it in a terminal window).</td>
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

All fastlane related questions, problems and feature ideas should be posted as [GitHub issue](https://github.com/fastlane/fastlane/issues/new). This way, other users can search existing discussions, and everybody can jump in.

## System requirements

_fastlane_ requires macOS or Linux with Ruby 2.0.0 or above

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](https://github.com/fastlane/fastlane/blob/master/LICENSE) file.

> This project and all fastlane tools are in no way affiliated with Apple Inc or Google. This project is open source under the MIT license, which means you have full access to the source code and can modify it to fit your own needs. All fastlane tools run on your own computer or server, so your credentials or other sensitive information will never leave your own computer. You are responsible for how you use fastlane tools.
