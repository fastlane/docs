_fastlane_ can be installed multiple ways. The preferred method is with [_Bundler_](https://bundler.io). _fastlane_ can also be installed directly through with Homebrew (if on macOS). It is possible to use macOS's system Ruby but it's not recommended as it can be hard to manage dependencies and cause conflicts.

#### Managed Ruby environment + Bundler (macOS/Linux/Windows)

**Ruby**

If you use macOS, system Ruby is not recommended. [There is a variety of ways to install Ruby without having to modify your system environment](https://www.ruby-lang.org/en/documentation/installation/#managers). For macOS and Linux, _rbenv_ is one of the most popular ways to manage your Ruby environment.

_fastlane_ supports Ruby versions 2.5 or newer Verify which Ruby version you're using:

```sh
$ ruby --version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]
```

**Bundler**

It is recommended that you use _Bundler_ and `Gemfile` to define your dependency on _fastlane_. This will clearly define the _fastlane_ version to be used and its dependencies, and will also speed up _fastlane_ execution.

- Install _Bundler_ by running `gem install bundler`
- Create a `./Gemfile` in the root directory of your project with the content
```ruby
source "https://rubygems.org"

gem "fastlane"
```
- Run `bundle update` and add both the `./Gemfile` and the `./Gemfile.lock` to version control
- Every time you run _fastlane_, use `bundle exec fastlane [lane]`
- On your CI, add `bundle install` as your first build step
- To update _fastlane_, just run `bundle update fastlane`

#### Homebrew (macOS)

This way you don't have to install Ruby separately and instead _homebrew_ installs the most adequate Ruby version for _fastlane_.
See [this page](https://formulae.brew.sh/formula/fastlane) for details.

```sh
brew install fastlane
```

#### System Ruby + RubyGems (macOS/Linux/Windows)

This is not recommended for your local environment, but you can still install _fastlane_ to system Ruby's environment. Using `sudo` often occurs unwanted results later due to file permission and makes managing your environment harder.

```sh
sudo gem install fastlane
```
