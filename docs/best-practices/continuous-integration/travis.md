# Travis Integration

Update your `.travis.yml` to look like this:

```yml
language: objective-c
osx_image: xcode8.3
install:
  - bundle install
script:
  - fastlane beta
```

The above config files assume you have a `Gemfile` set up, if you don't have one yet, make sure to follow our [Gemfile guide](https://docs.fastlane.tools/getting-started/ios/setup/#use-a-gemfile) and run `bundle update` to make sure you're using the most recent _fastlane_ release.

Replace `beta` with the lane you want to run for your setup. If you want to build, sign and distribute builds from Travis, you'll need to add one more action to your `Fastfile`, as by default, the Travis keychain is locked.

At the top of your `Fastfile`, add

```ruby
setup_travis
```

which will setup the keychain to work well with _match_ and _gym_. This action will also enable the `readonly` mode for _match_, so your CI doesn't create new certificates or provisioning profiles.