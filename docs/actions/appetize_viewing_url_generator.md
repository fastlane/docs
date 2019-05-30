<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appetize_viewing_url_generator.rb
-->

# appetize_viewing_url_generator


Generate an URL for appetize simulator




> Check out the [device_grid guide](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/device_grid/README.md) for more information


appetize_viewing_url_generator ||
---|---
Supported platforms | ios
Author | @KrauseFx
Returns | The URL to preview the iPhone app





## Parameters

Key | Description | Default
----|-------------|--------
  `public_key` | Public key of the app you wish to update | [*](#parameters-legend-dynamic)
  `base_url` | Base URL of Appetize service | `https://appetize.io/embed`
  `device` | Device type: iphone4s, iphone5s, iphone6, iphone6plus, ipadair, iphone6s, iphone6splus, ipadair2, nexus5, nexus7 or nexus9 | `iphone5s`
  `scale` | Scale of the simulator | 
  `orientation` | Device orientation | `portrait`
  `language` | Device language in ISO 639-1 language code, e.g. 'de' | 
  `color` | Color of the device | `black`
  `launch_url` | Specify a deep link to open when your app is launched | 
  `os_version` | The operating system version on which to run your app, e.g. 10.3, 8.0 | 
  `params` | Specifiy params value to be passed to Appetize | 
  `proxy` | Specify a HTTP proxy to be passed to Appetize | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action appetize_viewing_url_generator
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run appetize_viewing_url_generator
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run appetize_viewing_url_generator parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appetize_viewing_url_generator.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
