<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# check_app_store_metadata


Check your app's metadata before you submit your app to review (via `precheck`)




> More information: https://fastlane.tools/precheck


check_app_store_metadata |
-----|----
Supported platforms | ios
Author | @taquitos
Returns | true if precheck passes, else, false



## 2 Examples

```ruby
check_app_store_metadata(
  negative_apple_sentiment(level: :skip), # Set to skip to not run the `negative_apple_sentiment` rule
  curse_words(level: :warn) # Set to warn to only warn on curse word check failures
)
```

```ruby
precheck(...) # alias for "check_app_store_metadata"
```





## Parameters

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
fastlane action check_app_store_metadata
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/check_app_store_metadata.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
