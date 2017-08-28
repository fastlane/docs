# Getting started with _fastlane_ for iOS

## Installing _fastlane_
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

## Setting up _fastlane_

Navigate your terminal to your project's directory and run

```no-highlight
fastlane init
```

You'll be asked for your Apple ID, and _fastlane_ will automatically generate a fastlane configuration for you, based on the information provided.

You can see the newly created _fastlane_ directory, with all your existing metadata fetched from iTunes Connect.

<img src="/img/getting-started/ios/fastlane-init.png" width="800" />

The most interesting file is `fastlane/Fastfile`, which contains all the information that is needed to distribute your app.

## What's next?

_fastlane_ created all the required files for you, now you can go ahead and customise it to generate screenshots or to automatically distribute new builds

- [_fastlane_ screenshots for iOS and tvOS](screenshots.md)
- [iOS Beta deployment using _fastlane_](beta-deployment.md)
- [iOS App Store deployment using _fastlane_](appstore-deployment.md)

### Use a Gemfile

It is recommended that you use a `Gemfile` to define your dependency on _fastlane_. This will clearly define the used _fastlane_ version, and its dependencies, and will also speed up using _fastlane_.

- Install [bundler](https://bundler.io/) using `sudo gem install bundler`
- Create a `./Gemfile` in the root directory of your project with the content
```ruby
source "https://rubygems.org"

gem "fastlane"
```
- Run `[sudo] bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `[sudo] bundle install` as your first build step
- To update _fastlane_, just run `[sudo] bundle update`
