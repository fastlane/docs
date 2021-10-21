# App Store Connect API

## Introduction

The [App Store Connect API](https://developer.apple.com/app-store-connect/api/) (which Apple announced at WWDC18 and is continuously working on) is an official public API used to manage app metadata, pricing and availability, provisioning, and more. This API follows the [JSON API](https://jsonapi.org/) spec and introduces a new authorization option using API Keys to generate a [JSON Web Token (JWT)](https://jwt.io/).

_fastlane_ has historically used Apple IDs with username and password to authenticate using a cookie-based web session. _fastlane_ will continue using this same cookie-based web session to authenticate with an unofficial version of the App Store Connect API.

However, it is **recommended** to use the API Key authentication when you are able to. The benefits include:

- No 2FA needed
- Better performance
- Documented API
- Increased reliability

## Supported Actions/Tools

The App Store Connect API has not been integrated into all tools and actions yet. 

Below are the statuses of each tool:

| Name | Apple ID | API Key |
|---|---|---|
| pilot | **Yes** | **Yes** |
| deliver | **Yes** | **Yes** |
| sigh | **Yes** | **Yes** |
| cert | **Yes** | **Yes** |
| match | **Yes** | **Yes** |
| produce | **Partial** | No |
| pem | **Yes** | No |
| precheck | **Yes (except for IAP)** | **Yes (except for IAP)** |

## Creating an App Store Connect API Key

1. Create a new App Store Connect API Key in the [Users page](https://appstoreconnect.apple.com/access/api)
  - For more info, go to the [App Store Connect API Docs](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api)
  - Give your API Key an appropriate role for the task at hand. You can read more about roles in [Permissions in App Store Connect](https://developer.apple.com/support/roles/)
2. Download the newly created API Key file (`.p8`)
  - This file cannot be downloaded again after the page has been refreshed

## Using an App Store Connect API Key

The API Key (located in the `.p8`) file, the key id, and the issuer id are needed to create the JWT token for authorization. There are multiple ways that these pieces of information can be input into _fastlane_.

**Note:** The App Store Connect API does not yet have the ability to determine if the team is App Store or Enterprise. The `app_store_connect_api_key` action and the _fastlane_ API Key JSON file format allow for an optional `in_house` key as a temporary workaround.

### Using `app_store_connect_api_key` action

There is a new `app_store_connect_api_key` action which takes the key id, the issuer id, and API Key file (`.p8`) to generate a dictionary/hash used for JWT authorization. This action can be used in two ways:

#### Use return value and pass in as an option

```ruby
lane :release do
  api_key = app_store_connect_api_key(
    key_id: "D383SF739",
    issuer_id: "6053b7fe-68a8-4acb-89be-165aa6465141",
    key_filepath: "./AuthKey_D383SF739.p8",
    duration: 1200, # optional (maximum 1200)
    in_house: false # optional but may be required if using match/sigh
  )

  pilot(api_key: api_key)
end
```

#### Use the shared value in lane context

The `app_store_connect_api_key` action sets `Actions.lane_context[SharedValues::APP_STORE_CONNECT_API_KEY]` and actions (like `pilot`) will automatically load the API Key from `Actions.lane_context`

```ruby
lane :release do
  app_store_connect_api_key(
    key_id: "D383SF739",
    issuer_id: "6053b7fe-68a8-4acb-89be-165aa6465141",
    key_filepath: "./AuthKey_D383SF739.p8",
    duration: 1200, # optional (maximum 1200)
    in_house: false # optional but may be required if using match/sigh
  )

  # Automatically loads Actions.lane_context[SharedValues::APP_STORE_CONNECT_API_KEY]
  pilot
end
```

### Using _fastlane_ API Key hash option

Keys and values that can be used in hash in `api_key` parameter in actions (e.g. `upload_to_testflight`) and tools (e.g. `cert`) are described in _fastlane_ API Key JSON file format below.
The only difference when using hash is that you could use `filepath` instead of `key`.

Please note that `key_content` and `key_filepath` described in `app_store_connect_api_key` action are invalid both in hash and in JSON file.
View [Token code on Github](https://github.com/fastlane/fastlane/blob/master/spaceship/lib/spaceship/connect_api/token.rb)

### Using _fastlane_ API Key JSON file

Below is an example of the _fastlane_ API Key JSON file format that tools and actions will also be able to read. The JSON file requires:

- `key_id`
- `issuer_id`
- `key` (the content of the `.p8` file)

The JSON file allows optional:

- `duration` (session length in seconds, maximum 1200)
- `in_house` (boolean value if team is Enterprise or not)

```js
{
  "key_id": "D383SF739",
  "issuer_id": "6053b7fe-68a8-4acb-89be-165aa6465141",
  "key": "-----BEGIN PRIVATE KEY-----\nMIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHknlhdlYdLu\n-----END PRIVATE KEY-----",
  "duration": 1200, # optional (maximum 1200)
  "in_house": false # optional but may be required if using match/sigh
}
```

Below is an example of a JSON file being used by an action:

```ruby
lane :release do
  pilot( api_key_path: "fastlane/D383SF739.json" )
end
```

Below is an example of a JSON file being used with CLI:

```no-highlight
$ fastlane pilot distribute --api_key_path fastlane/D383SF739.json
```
