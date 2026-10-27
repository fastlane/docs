<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_age_rating.rb
-->

# update_app_age_rating


Update your app's age rating on App Store Connect




> Updates only the age rating of your app on App Store Connect without touching any other metadata, screenshots, or binaries. Useful for CI pipelines that need to update age ratings independently of an app release. Supports both API key and Apple ID authentication.


update_app_age_rating ||
---|---
Supported platforms | ios, mac
Author | @PratikPatil131
Returns | Returns true if the age rating was successfully updated



## 3 Examples

```ruby
# Using App Store Connect API key (recommended for CI)
update_app_age_rating(
  api_key_path: "fastlane/api_key.json",
  app_identifier: "com.example.app",
  age_rating_config_path: "fastlane/metadata/age_rating.json"
)
```

```ruby
# Using Apple ID
update_app_age_rating(
  username: "user@example.com",
  app_identifier: "com.example.app",
  age_rating_config_path: "fastlane/metadata/age_rating.json",
  team_id: "ABC123456"
)
```

```ruby
# Using the api_key hash returned by app_store_connect_api_key action
api_key = app_store_connect_api_key(
  key_id: "D383SF739",
  issuer_id: "6053b7fe-68a8-4acb-89be-165aa6465141",
  key_filepath: "./AuthKey_D383SF739.p8"
)
update_app_age_rating(
  api_key: api_key,
  app_identifier: "com.example.app",
  age_rating_config_path: "fastlane/metadata/age_rating.json"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/) | 
  `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/) | 
  `app_identifier` | The bundle identifier of your app | 
  `username` | Your Apple ID username | 
  `age_rating_config_path` | Path to the JSON file containing the age rating configuration | 
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | 
  `team_name` | The name of your App Store Connect team if you're in multiple teams | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_app_age_rating
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_app_age_rating
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_app_age_rating parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_age_rating.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
