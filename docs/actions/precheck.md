# precheck


Check your app's metadata before you submit your app to review using _precheck_




<p align="center">
  <img src="assets/precheck.png" height="110">
</p>

Precheck
============

###### Check your app using a community driven set of App Store review rules to avoid being rejected

Apple rejects builds for many avoidable metadata issues like including swear words 😮, other companies’ trademarks, or even mentioning an iOS bug 🐛. _fastlane precheck_ takes a lot of the guess work out by scanning your app’s details in iTunes Connect for avoidable problems. fastlane precheck helps you get your app through app review without rejections so you can ship faster 🚀

-------

<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#example">Example</a> &bull;
    <a href="#how-does-it-work">How does it work?</a>
</p>

-------

# Features


|          |  precheck Features  |
|----------|-----------------|
|🐛|  product bug mentions|
|🙅‍♂️|Swear word checker|
|🤖|Mentioning other platforms|
|😵|URL reachability checker|
|📝|Placeholder/test words/mentioning future features|
|📅|Copyright date checking|
|🙈|Customizable word list checking|
|📢|You can decide if you want to warn  about potential problems and continue or have _fastlane_ show an error and stop after all scans are done.|

# Usage
Run _fastlane precheck_ to check the app metadata from iTunes Connect

    fastlane precheck

To get a list of available options run
    
    fastlane precheck --help

<img src="assets/precheck.gif" />
    
# Example

Since you might want to manually trigger _precheck_ but don't want to specify all the parameters every time, you can store your defaults in a so called `Precheckfile`.

Run `fastlane precheck init` to create a new configuration file. Example:

```ruby
# indicates that your metadata will not be checked by this rule
negative_apple_sentiment(level: :skip)

# when triggered, this rule will warn you of a potential problem
curse_words(level: :warn)

# show error and prevent any further commands from running after fastlane precheck finishes
unreachable_urls(level: :error)

# pass in whatever words you want to check for
custom_text(data: ["chrome", "webos"], 
           level: :warn)
``` 

### Use with [_fastlane_](https://github.com/fastlane/fastlane/tree/master/fastlane)

_precheck_ is fully integrated with [_deliver_](https://github.com/fastlane/fastlane/tree/master/deliver) another [_fastlane_](https://github.com/fastlane/fastlane/tree/master/fastlane) tool.

Update your `Fastfile` to contain the following code:

```ruby
lane :production do
  ...
  # by default deliver will call precheck and warn you of any problems
  # if you want precheck to halt submitting to app review, you can pass
  # precheck_default_rule_level: :error
  deliver(precheck_default_rule_level: :error)
  ...
end

# or if you prefer, you can run precheck alone
lane :check_metadata do
  precheck
end

```

# How does it work?

`precheck` will access `iTunes Connect` to download your app's metadata. It uses [spaceship](https://spaceship.airforce) to communicate with Apple's web services.

# Want to improve precheck's rules?
Please submit an issue on GitHub and provide information about your App Store rejection! Make sure you scrub out any personally identifiable information since this will be public.

<hr />


precheck |
-----|----
Supported platforms | ios
Author | @taquitos
Returns | true if precheck passes, else, false



**1 Example**

```ruby
precheck(
  negative_apple_sentiment(level: :skip), # Set to skip to not run the `negative_apple_sentiment` rule
  curse_words(level: :warn) # Set to warn to only warn on curse word check failures
)
```





**Parameters**

Key | Description
----|------------
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `team_name` | The name of your iTunes Connect team if you're in multiple teams
  `default_rule_level` | The default rule level unless otherwise configured
  `include_in_app_purchases` | Should check in-app purchases?
  `negative_apple_sentiment` | mentioning  in a way that could be considered negative
  `placeholder_text` | using placeholder text (e.g.:"lorem ipsum", "text here", etc...)
  `other_platforms` | mentioning other platforms, like Android or Blackberry
  `future_functionality` | mentioning features or content that is not currently available in your app
  `test_words` | using text indicating this release is a test
  `curse_words` | including words that might be considered objectionable
  `free_stuff_in_iap` | using text indicating that your IAP is free
  `custom_text` | mentioning any of the user-specified words passed to custom_text(data: [words])
  `copyright_date` | using a copyright date that is any different from this current year, or missing a date
  `unreachable_urls` | unreachable URLs in app metadata




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action precheck
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/precheck.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
