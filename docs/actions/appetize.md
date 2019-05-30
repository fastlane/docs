<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appetize.rb
-->

# appetize


Upload your app to [Appetize.io](https://appetize.io/) to stream it in browser




> If you provide a `public_key`, this will overwrite an existing application. If you want to have this build as a new app version, you shouldn't provide this value.<br><br>To integrate appetize into your GitHub workflow check out the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md).


appetize ||
---|---
Supported platforms | ios, android
Author | @klundberg, @giginet, @steprescott



## 2 Examples

```ruby
appetize(
  path: "./MyApp.zip",
  api_token: "yourapitoken", # get it from https://appetize.io/docs#request-api-token
  public_key: "your_public_key" # get it from https://appetize.io/dashboard
)
```

```ruby
appetize(
  path: "./MyApp.zip",
  api_host: "company.appetize.io", # only needed for enterprise hosted solution
  api_token: "yourapitoken", # get it from https://appetize.io/docs#request-api-token
  public_key: "your_public_key" # get it from https://appetize.io/dashboard
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_host` | Appetize API host | `api.appetize.io`
  `api_token` | Appetize.io API Token | 
  `url` | URL from which the ipa file can be fetched. Alternative to :path | 
  `platform` | Platform. Either `ios` or `android` | `ios`
  `path` | Path to zipped build on the local filesystem. Either this or `url` must be specified | 
  `public_key` | If not provided, a new app will be created. If provided, the existing build will be overwritten | 
  `note` | Notes you wish to add to the uploaded app | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `appetize` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::APPETIZE_API_HOST` | Appetize API host.
  `SharedValues::APPETIZE_PUBLIC_KEY` | a public identifier for your app. Use this to update your app after it has been initially created.
  `SharedValues::APPETIZE_APP_URL` | a page to test and share your app.
  `SharedValues::APPETIZE_MANAGE_URL` | a page to manage your app.

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action appetize
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appetize
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appetize parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appetize.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
