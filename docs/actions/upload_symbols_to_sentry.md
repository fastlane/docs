<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# upload_symbols_to_sentry


Upload dSYM symbolication files to Sentry

> Please use the `sentry` plugin instead.
Install using `fastlane add_plugin sentry`.
Replace `upload_symbols_to_sentry` with `sentry_upload_dsym`


> This action allows you to upload symbolication files to Sentry. It's extra useful if you use it to download the latest dSYM files from Apple when you use Bitcode


upload_symbols_to_sentry |
-----|----
Supported platforms | ios
Author | @joshdholtz
Returns | The uploaded dSYM path(s)



## 1 Example

```ruby
upload_symbols_to_sentry(
  auth_token: "...",
  org_slug: "...",
  project_slug: "...",
  dsym_path: "./App.dSYM.zip"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_host` | API host url for Sentry | `https://app.getsentry.com/api/0`
  `api_key` | API key for Sentry | 
  `auth_token` | Authentication token for Sentry | 
  `org_slug` | Organization slug for Sentry project | 
  `project_slug` | Project slug for Sentry | 
  `dsym_path` | Path to your symbols file. For iOS and Mac provide path to app.dSYM.zip | [*](#parameters-legend-dynamic)
  `dsym_paths` | Path to an array of your symbols file. For iOS and Mac provide path to app.dSYM.zip | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action upload_symbols_to_sentry
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_symbols_to_sentry.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
