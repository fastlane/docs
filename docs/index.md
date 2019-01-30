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
💭 | Never remember any commands any more, just _fastlane_
🚢 | Deploy from any computer, including a CI server

## Getting Started

{!docs/includes/installing-fastlane.md!}

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

Currently, _fastlane_ is officially supported to run on macOS. 

But we are working on 🐧 Linux and 🖥️ Windows support for parts of _fastlane_. Some underlying software like Xcode or iTunes Transporter is only available for macOS, but many other tools and actions can theoretically also work on other platforms. Please see [this Github issue for further information](https://github.com/fastlane/fastlane/issues/11687).

## _fastlane_ team

<table>
<tr>
<td>
<a href='https://twitter.com/hjanuschka'><img src='https://github.com/hjanuschka.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/hjanuschka'>Helmut Januschka</a></h4>
</td>
<td>
<a href='https://twitter.com/KrauseFx'><img src='https://github.com/KrauseFx.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/KrauseFx'>Felix Krause</a></h4>
</td>
<td>
<a href='https://twitter.com/lacostej'><img src='https://github.com/lacostej.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/lacostej'>Jérôme Lacoste</a></h4>
</td>
<td>
<a href='https://twitter.com/Sujan'><img src='https://github.com/janpio.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/Sujan'>Jan Piotrowski</a></h4>
</td>
<td>
<a href='https://twitter.com/lmirosevic'><img src='https://github.com/lmirosevic.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/lmirosevic'>Luka Mirosevic</a></h4>
</td>
</tr>
<tr>
<td>
<a href='https://twitter.com/aligatr'><img src='https://github.com/AliSoftware.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/aligatr'>Olivier Halligon</a></h4>
</td>
<td>
<a href='#'><img src='https://github.com/jdee.png?size=200' width=140></a>
<h4 align='center'><a href='#'>Jimmy Dee</a></h4>
</td>
<td>
<a href='https://twitter.com/Revolt666'><img src='https://github.com/revolter.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/Revolt666'>Iulian Onofrei</a></h4>
</td>
<td>
<a href='https://twitter.com/DanToml'><img src='https://github.com/DanToml.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/DanToml'>Danielle Tomlinson</a></h4>
</td>
<td>
<a href='https://twitter.com/getaaron'><img src='https://github.com/getaaron.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/getaaron'>Aaron Brager</a></h4>
</td>
</tr>
<tr>
<td>
<a href='https://twitter.com/giginet'><img src='https://github.com/giginet.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/giginet'>Kohki Miki</a></h4>
</td>
<td>
<a href='https://twitter.com/snatchev'><img src='https://github.com/snatchev.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/snatchev'>Stefan Natchev</a></h4>
</td>
<td>
<a href='https://twitter.com/mgrebenets'><img src='https://github.com/mgrebenets.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/mgrebenets'>Maksym Grebenets</a></h4>
</td>
<td>
<a href='https://twitter.com/taquitos'><img src='https://github.com/taquitos.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/taquitos'>Joshua Liebowitz</a></h4>
</td>
<td>
<a href='https://twitter.com/acrooow'><img src='https://github.com/milch.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/acrooow'>Manu Wallner</a></h4>
</td>
</tr>
<tr>
<td>
<a href='https://twitter.com/nafu003'><img src='https://github.com/nafu.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/nafu003'>Fumiya Nakamura</a></h4>
</td>
<td>
<a href='https://twitter.com/mellis1995'><img src='https://github.com/matthewellis.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/mellis1995'>Matthew Ellis</a></h4>
</td>
<td>
<a href='https://twitter.com/joshdholtz'><img src='https://github.com/joshdholtz.png?size=200' width=140></a>
<h4 align='center'><a href='https://twitter.com/joshdholtz'>Josh Holtz</a></h4>
</td>
</table>

Special thanks to all [contributors](https://github.com/fastlane/fastlane/graphs/contributors) for extending and improving _fastlane_.

## Metrics
 
_fastlane_ tracks a few key metrics to understand how developers are using the tool and to help us know what areas need improvement. No personal/sensitive information is ever collected. Metrics that are collected include: 
 
* The number of _fastlane_ runs
* A salted hash of the app identifier or package name, which helps us anonymously identify unique usage of _fastlane_
 
You can easily opt-out of metrics collection by adding `opt_out_usage` at the top of your `Fastfile` or by setting the environment variable `FASTLANE_OPT_OUT_USAGE`. [Check out the metrics code on GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane_core/lib/fastlane_core/analytics)

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](https://github.com/fastlane/fastlane/blob/master/LICENSE) file.

> This project and all fastlane tools are in no way affiliated with Apple Inc. This project is open source under the MIT license, which means you have full access to the source code and can modify it to fit your own needs. All fastlane tools run on your own computer or server, so your credentials or other sensitive information will never leave your own computer. You are responsible for how you use fastlane tools.

----
### Where to go from here?
- [fastlane Getting Started guide for iOS](getting-started/ios/setup.md)
- [fastlane Getting Started guide for Android](getting-started/android/setup.md)
