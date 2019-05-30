<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/podio_item.rb
-->

# podio_item


Creates or updates an item within your Podio app




> Use this action to create or update an item within your Podio app (see [https://help.podio.com/hc/en-us/articles/201019278-Creating-apps-](https://help.podio.com/hc/en-us/articles/201019278-Creating-apps-)).<br>Pass in dictionary with field keys and their values.<br>Field key is located under `Modify app` -> `Advanced` -> `Developer` -> `External ID` (see [https://developers.podio.com/examples/items](https://developers.podio.com/examples/items)).


podio_item ||
---|---
Supported platforms | ios, android, mac
Author | @pprochazka72, @laugejepsen



## 1 Example

```ruby
podio_item(
  identifying_value: "Your unique value",
  other_fields: {
    "field1" => "fieldValue",
    "field2" => "fieldValue2"
  }
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `client_id` | Client ID for Podio API (see https://developers.podio.com/api-key) | 
  `client_secret` | Client secret for Podio API (see https://developers.podio.com/api-key) | 
  `app_id` | App ID of the app you intend to authenticate with (see https://developers.podio.com/authentication/app_auth) | 
  `app_token` | App token of the app you intend to authenticate with (see https://developers.podio.com/authentication/app_auth) | 
  `identifying_field` | String specifying the field key used for identification of an item | 
  `identifying_value` | String uniquely specifying an item within the app | 
  `other_fields` | Dictionary of your app fields. Podio supports several field types, see https://developers.podio.com/doc/items | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `podio_item` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::PODIO_ITEM_URL` | URL to newly created (or updated) Podio item

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action podio_item
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run podio_item
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run podio_item parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/podio_item.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
