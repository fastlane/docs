# Getting started with _fastlane_ for Android

## Installing _fastlane_

```no-highlight
sudo gem install fastlane --verbose
```

## Setting up _fastlane_

Navigate your terminal to your project's directory and run

```no-highlight
fastlane init
```

You'll be asked to confirm that you're ready to begin, and then for a few pieces of information. To get started quickly:

1. Provide the package name for your application when asked (e.g. io.fabric.yourapp)
1. Press enter when asked for the path to your json secret file
1. Answer 'n' when asked if you plan on uploading info to Google Play via fastlane (we can set this up later)

That's it! _fastlane_ will automatically generate a configuration for you based on the information provided.

You can see the newly created `fastlane` directory, with the following files:

- `Appfile` which defines configuration information that is global to your app
- `Fastfile` which defines the "lanes" that drive the behavior of _fastlane_

<img src="/img/getting-started/android/fastlane-init.png" width="770" />

The most interesting file is `fastlane/Fastfile`, which contains all the information that is needed to distribute your app.

## What's next?

_fastlane_ created all the required files for you, now you can go ahead and customise them to generate screenshots or to automatically distribute new builds. To learn more, check out:

- [Automatically generate screenshots](screenshots.md)
- [Distribute beta builds](beta-deployment.md)
- [Deploy to Google Play for production release](release-deployment.md)

### Use a Gemfile

It is recommended that you use a `Gemfile` to define your dependency on _fastlane_. This will clearly define the used _fastlane_ version, and its dependencies, and will also speed up using _fastlane_.

- Create a `Gemfile` with the content
```ruby
source "https://rubygems.org"

gem "fastlane"
```
- Run `bundle update` and add both the `Gemfile` and the `Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `bundle install` as your first build step
- To update _fastlane_, just run `bundle update`
