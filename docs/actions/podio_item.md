<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# podio_item


Creates or updates an item within your Podio app




> Use this action to create or update an item within your Podio app
        (see https://help.podio.com/hc/en-us/articles/201019278-Creating-apps-).
        Pass in dictionary with field keys and their values.
        Field key is located under Modify app -> Advanced -> Developer -> External ID
        (see https://developers.podio.com/examples/items)


podio_item |
-----|----
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

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action podio_item
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/podio_item.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
