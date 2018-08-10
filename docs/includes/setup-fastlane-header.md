<style type="text/css">
  .fastlane-setup {
    border-left: .4rem solid #00b0ff;
    border-bottom: .1rem solid rgba(0,176,255,.1);
    background-color: rgba(0,176,255,.1);
    padding: 15px;
    margin-bottom: 20px;
    font-weight: 200;
  }
  .fastlane-setup-wrapper {
    background-color: rgba(0,176,255,.05);
  }
  .fastlane-setup-wrapper[open] {
    padding-bottom: 1px;
  }
  .fastlane-setup-header {
    font-size: 20px;
    font-weight: 500;
  }
  .fastlane-setup-more-details {
    font-size: 18px;
    font-weight: 350;
  }
</style>

<details class="fastlane-setup-wrapper">
  <summary class="fastlane-setup">New to fastlane? Click here to open the installation & setup instructions first</summary>
  

<p class="fastlane-setup-header">1) Install the latest Xcode command line tools</p>

```no-highlight
xcode-select --install
```

<p class="fastlane-setup-header">2) Install <i>fastlane</i></p>

```sh
# Using RubyGems
sudo gem install fastlane -NV

# Alternatively using Homebrew
brew cask install fastlane
```

<p class="fastlane-setup-header">3) Navigate to your project and run</p>

```no-highlight
fastlane init
```

<p class="fastlane-setup-more-details"><a href="/getting-started/ios/setup/">More Details</a></p>

</details>
