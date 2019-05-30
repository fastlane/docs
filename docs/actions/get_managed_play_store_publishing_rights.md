<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_managed_play_store_publishing_rights.rb
-->

# get_managed_play_store_publishing_rights


Obtain publishing rights for custom apps on Managed Google Play Store




> If you haven't done so before, start by following the first two steps of Googles ["Get started with custom app publishing"](https://developers.google.com/android/work/play/custom-app-api/get-started) -> ["Preliminary setup"](https://developers.google.com/android/work/play/custom-app-api/get-started#preliminary_setup) instructions:<br>"[Enable the Google Play Custom App Publishing API](https://developers.google.com/android/work/play/custom-app-api/get-started#enable_the_google_play_custom_app_publishing_api)" and "[Create a service account](https://developers.google.com/android/work/play/custom-app-api/get-started#create_a_service_account)".<br>You need the "service account's private key file" to continue.<br>Run the action and supply the "private key file" to it as the `json_key` parameter. The command will output a URL to visit. After logging in you are redirected to a page that outputs your "Developer Account ID" - take note of that, you will need it to be able to use [`create_app_on_managed_play_store`](https://docs.fastlane.tools/actions/create_app_on_managed_play_store/).


get_managed_play_store_publishing_rights ||
---|---
Supported platforms | android
Author | @janpio
Returns | An URI to obtain publishing rights for custom apps on Managed Play Store



## 1 Example

```ruby
get_managed_play_store_publishing_rights(
  json_key: "path/to/your/json/key/file"
)
# it is probably easier to execute this action directly in the command line:
# $ fastlane run get_managed_play_store_publishing_rights
```





## Parameters

Key | Description | Default
----|-------------|--------
  `json_key` | The path to a file containing service account JSON, used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The raw service account JSON data used to authenticate with Google | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action get_managed_play_store_publishing_rights
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run get_managed_play_store_publishing_rights
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run get_managed_play_store_publishing_rights parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/get_managed_play_store_publishing_rights.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
