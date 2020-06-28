Install the latest Xcode command line tools:

```no-highlight
xcode-select --install
```

Install _fastlane_ using

```sh
# Using RubyGems
sudo gem install fastlane -NV

# Alternatively without sudo
gem install --user-install fastlane -NV

# Alternatively using bundler
gem install --user-install bundler
echo 'source "https://rubygems.org"\n\ngem "fastlane"' > Gemfile
bundle config set path 'vendor/bundle'
bundle install
# bundle exec fastlane

# Alternatively using Homebrew
brew install fastlane
```
