Install the latest Xcode command line tools:

```no-highlight
xcode-select --install
```

### Install with Bundler (recommended)
The recommended way to install _fastlane_ is with [Bundler](https://bundler.io/) by adding _fastlane_ to your `Gemfile`. `bundler` provides a consistent execution environment for your _fastlane_ project to run in.

`bundler` can be installed and `Gemfile` can be initialized by using

```sh
# Install bundler
[sudo] gem install bundler

# Init a Gemfile
bundle init
```

Edit your `Gemfile` to include _fastlane_

```rb
source "https://rubygems.org"
gem "fastlane"
```

_fastlane_ with `bundler` by using

```sh
# Install fastlane
bundle install
```

### Install with RubyGems and Homebrew
_fastlane_ can also be installed by using

```sh
# Using RubyGems
[sudo] gem install fastlane -NV

# Alternatively using Homebrew
brew cask install fastlane
```
Note: `sudo` may only be needed if you are installing _fastlane_ on a system version of Ruby
