# Getting started with _fastlane_ for Android

## Installing _fastlane_

{!docs/includes/installing-fastlane.md!}

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

You can see the newly created `./fastlane` directory, with the following files:

- `Appfile` which defines configuration information that is global to your app
- `Fastfile` which defines the "lanes" that drive the behavior of _fastlane_

<img src="/img/getting-started/android/fastlane-init.png" width="996" />

The most interesting file is `fastlane/Fastfile`, which contains all the information that is needed to distribute your app.

## Setting up _supply_

_supply_ is a _fastlane_ tool that uploads app metadata, screenshots and binaries to Google Play. You can also select tracks for builds and promote builds to production!

Setting it up requires downloading a credentials file from your Google Developers Service Account.

### Collect your Google credentials

{!docs/includes/google-credentials.md!}

### Configure _supply_

Edit your `fastlane/Appfile` and change the `json_key_file` line to have the path to your credentials file:

```ruby
json_key_file "/path/to/your/downloaded/key.json"
```

### Fetch your app metadata

If your app has been created on the Google Play developer console, you're ready to start using _supply_ to manage it! Run:

```no-highlight
fastlane supply init
```

and all of your current Google Play store metadata will be downloaded to `fastlane/metadata/android`.

<img src="/img/getting-started/android/supply-init.png" width="1071" />

Due to limitations of the Google Play API, _supply_ can't download existing screenshots or videos.

## What's next?

_fastlane_ is ready to generate screenshots and automatically distribute new builds! To learn more, check out:

- [_fastlane_ screenshots for Android](screenshots.md)
- [Deploy to Google Play using _fastlane_](release-deployment.md)

### Set up environment variables

_fastlane_ requires some environment variables set up to run correctly. In particular, having your locale not set to a UTF-8 locale will cause issues with building and uploading your build. In your shell profile add the following lines:

```sh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

You can find your shell profile at `~/.bashrc`, `~/.bash_profile`, `~/.profile` or `~/.zshrc` depending on your system.

### Use a Gemfile

It is recommended that you use a `Gemfile` to define your dependency on _fastlane_. This will clearly define the used _fastlane_ version, and its dependencies, and will also speed up using _fastlane_.

- Create a `./Gemfile` in the root directory of your project with the content
```ruby
source "https://rubygems.org"

gem "fastlane"
```
- Run `[sudo] bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `[sudo] bundle install` as your first build step
- To update _fastlane_, just run `[sudo] bundle update fastlane`
