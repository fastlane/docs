# Getting started with _fastlane_ for iOS

### Setup Xcode for _fastlane_

{!docs/includes/installing-fastlane-ios.md!}

### Installing _fastlane_

{!docs/includes/installing-fastlane.md!}

### Setting up _fastlane_

Navigate your terminal to your project's directory and run

```no-highlight
fastlane init
```

Note that if you want to create your first app on your App Store Connect account, you need to set the developer name (`company_name`) with `PRODUCE_COMPANY_NAME` environment variable:

```no-highlight
PRODUCE_COMPANY_NAME="YOUR COMPANY NAME" fastlane init
```

To get more information check `company_name` description in the [Create app documentation](/generated/actions/create_app_online/#parameters_1).

To have your `Fastfile` configuration written in Swift (Beta)

```no-highlight
fastlane init swift
```

**Swift setup is still in beta. See [Fastlane.swift docs](https://docs.fastlane.tools/getting-started/ios/fastlane-swift/) for more information.**

Depending on what kind of setup you choose, different files will be set up for you. If you chose to download the existing app metadata, you'll end up with new folders that look like this:

<img src="/img/getting-started/ios/fastlane-init.png" width="800" />

The most interesting file is `fastlane/Fastfile`, which contains all the information that is needed to distribute your app.

### What's next?

_fastlane_ created all the required files for you. Now you can go ahead and customise _fastlane_ to generate screenshots, or automatically distribute new builds, and much, much more. Here're some examples:

- [Generate localized iOS screenshots for the App Store](screenshots.md)
- [Automatic iOS Beta deployment](beta-deployment.md)
- [Automatic iOS App Store deployment](appstore-deployment.md)
- Discover all [_fastlane_ actions](/generated/actions)

Do note that if the automation you're building requires connectivity with Apple's servers, such as for code signing when building your app, or uploading your app to the App Store Connect, and so on, you will need to authenticate. Check out [Authenticating with Apple services](authentication.md) to learn the best ways to authenticate, catered for your specific use case.

#### Set up environment variables

_fastlane_ requires some environment variables set up to run correctly. In particular, having your locale not set to a UTF-8 locale will cause issues with building and uploading your build. In your shell profile add the following lines:

```sh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

You can find your shell profile at `~/.bashrc`, `~/.bash_profile`, `~/.profile` or `~/.zshrc` depending on your system.

#### Use a Gemfile

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
