_fastlane_ can be installed in a multiple ways. The preferred method is with a `Gemfile`. _fastlane_ can also get installed directly through RubyGems or with Homebrew (if on macOS).

#### A Gemfile (macOS/Linux/Windows)

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

#### RubyGems (macOS/Linux/Windows)

```sh
sudo gem install fastlane -NV
```

#### Homebrew (macOS)

```sh
brew install fastlane
```
