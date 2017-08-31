# appetize_viewing_url_generator


Generate an URL for appetize simulator




> Check out the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md) for more information


appetize_viewing_url_generator |
-----|----
Supported platforms | ios
Author | @KrauseFx
Returns | The URL to preview the iPhone app





**Parameters**

Key | Description
----|------------
  `public_key` | Public key of the app you wish to update
  `base_url` | Base URL of Appetize service
  `device` | Device type: iphone4s, iphone5s, iphone6, iphone6plus, ipadair, iphone6s, iphone6splus, ipadair2, nexus5, nexus7 or nexus9
  `scale` | Scale of the simulator
  `orientation` | Device orientation
  `language` | Device language in ISO 639-1 language code, e.g. 'de'
  `color` | Color of the device
  `launch_url` | Specify a deep link to open when your app is launched
  `os_version` | The operating system version on which to run your app, e.g. 10.3, 8.0
  `params` | Specifiy params value to be passed to Appetize
  `proxy` | Specify a HTTP proxy to be passed to Appetize




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action appetize_viewing_url_generator
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appetize_viewing_url_generator.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
