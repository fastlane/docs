# Getting started with _fastlane_ for iOS

## Installing fastlane

```no-highlight
sudo gem install fastlane --verbose
```

## Setting up fastlane

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

- [Automatically generate screenshots](screenshots.md)
- [Distribute beta builds](beta-deployment.md)
- [Deploy to the App Store](appstore-deployment.md)

### Use a Gemfile

It is recommended that you use a `Gemfile` to define your dependency on _fastlane_. This will clearly define the used _fastlane_ version, and its dependencies, and will also speed up using _fastlane_.

- Create a `Gemfile` with the content
```ruby
source "https://rubygems.org"

gem "fastlane"
```
- Install [bundler](https://bundler.io/) using `sudo gem install bundler`
- Run `[sudo] bundle update` and add both the `Gemfile` and the `Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `[sudo] bundle install` as your first build step
- To update _fastlane_, just run `[sudo] bundle update`