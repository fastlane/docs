<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_connect_api_key.rb
-->

# app_store_connect_api_key


Load the App Store Connect API token to use in other fastlane tools and actions




> Load the App Store Connect API token to use in other fastlane tools and actions


app_store_connect_api_key ||
---|---
Supported platforms | ios, mac
Author | @joshdholtz



## 3 Examples

```ruby
app_store_connect_api_key(
  key_id: "D83848D23",
  issuer_id: "227b0bbf-ada8-458c-9d62-3d8022b7d07f",
  key_filepath: "D83848D23.p8"
)
```

```ruby
app_store_connect_api_key(
  key_id: "D83848D23",
  issuer_id: "227b0bbf-ada8-458c-9d62-3d8022b7d07f",
  key_filepath: "D83848D23.p8",
  duration: 200,
  in_house: true
)
```

```ruby
app_store_connect_api_key(
  key_id: "D83848D23",
  issuer_id: "227b0bbf-ada8-458c-9d62-3d8022b7d07f",
  key_content: "-----BEGIN EC PRIVATE KEY-----\nfewfawefawfe\n-----END EC PRIVATE KEY-----"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `key_id` | The key ID | 
  `issuer_id` | The issuer ID | 
  `key_filepath` | The path to the key p8 file | 
  `key_content` | The content of the key p8 file | 
  `is_key_content_base64` | Whether :key_content is Base64 encoded or not | `false`
  `duration` | The token session duration | `1200`
  `in_house` | Is App Store or Enterprise (in house) team? App Store Connect API cannot determine this on its own (yet) | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `app_store_connect_api_key` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::APP_STORE_CONNECT_API_KEY` | The App Store Connect API key information used for authorization requests. This hash can be passed directly into the :api_key options on other tools or into Spaceship::ConnectAPI::Token.create method

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action app_store_connect_api_key
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run app_store_connect_api_key
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run app_store_connect_api_key parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/app_store_connect_api_key.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
