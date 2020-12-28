_fastlane_ can be installed multiple ways. The preferred method is with a `Gemfile`. _fastlane_ can also get installed directly through RubyGems or with Homebrew (if on macOS).

#### A Gemfile (macOS/Linux/Windows)

It is recommended that you use a `Gemfile` to define your dependency on _fastlane_. This will clearly define the used _fastlane_ version, and its dependencies, and will also speed up using _fastlane_.

- Create a `./Gemfile` in the root directory of your project with the content
```ruby
source "https://rubygems.org"

gem "fastlane"
```
- If you want the gems installed in a folder inside your project instead of globally in the system, so that you can avoid the need for `sudo`, you can run `bundle config set --local path 'vendor/bundle'`
- Run
  - Linux/Windows: `[sudo] bundle update`
  - macOS: `[sudo] xcrun bundle update`
- Add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add as your first build step
  - Linux/Windows: `[sudo] bundle install`
  - macOS: `[sudo] xcrun bundle install`
- To update _fastlane_, just run
  - Linux/Windows: `[sudo] bundle update fastlane`
  - macOS: `[sudo] xcrun bundle update fastlane`

#### RubyGems (macOS/Linux/Windows)

##### Linux/Windows
```sh
sudo gem install fastlane -NV
```
##### macOS
```sh
sudo xcrun gem install fastlane -NV
```

#### Homebrew (macOS)

```sh
brew install fastlane
```
