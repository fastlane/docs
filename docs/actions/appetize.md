<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# appetize


Upload your app to Appetize.io to stream it in the browser




> If you provide a `public_key`, this will overwrite an existing application. If you want to have this build as a new app version, you shouldn't provide this value.
To integrate appetize into your GitHub workflow check out the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md)


appetize |
-----|----
Supported platforms | ios, android
Author | @klundberg, @giginet



## 1 Example

```ruby
appetize(
  path: "./MyApp.zip",
  api_token: "yourapitoken", # get it from https://appetize.io/docs#request-api-token
  public_key: "your_public_key" # get it from https://appetize.io/dashboard
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_token` | Appetize.io API Token | 
  `url` | URL from which the ipa file can be fetched. Alternative to :path | 
  `platform` | Platform. Either `ios` or `android` | `ios`
  `path` | Path to zipped build on the local filesystem. Either this or `url` must be specified | 
  `public_key` | If not provided, a new app will be created. If provided, the existing build will be overwritten | 
  `note` | Notes you wish to add to the uploaded app | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action appetize
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appetize.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
