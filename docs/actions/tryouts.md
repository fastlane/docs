<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/tryouts.rb
-->

# tryouts


Upload a new build to [Tryouts](https://tryouts.io/)




> More information: [http://tryouts.readthedocs.org/en/latest/releases.html#create-release](http://tryouts.readthedocs.org/en/latest/releases.html#create-release)


tryouts ||
---|---
Supported platforms | ios, android
Author | @alicertel



## 1 Example

```ruby
tryouts(
  api_token: "...",
  app_id: "application-id",
  build_file: "test.ipa",
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `app_id` | Tryouts application hash | 
  `api_token` | API Token (api_key:api_secret) for Tryouts Access | 
  `build_file` | Path to your IPA or APK file. Optional if you use the _gym_ or _xcodebuild_ action | [*](#parameters-legend-dynamic)
  `notes` | Release notes | 
  `notes_path` | Release notes text file path. Overrides the :notes parameter | 
  `notify` | Notify testers? 0 for no | `1`
  `status` | 2 to make your release public. Release will be distributed to available testers. 1 to make your release private. Release won't be distributed to testers. This also prevents release from showing up for SDK update | `2`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `tryouts` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::TRYOUTS_BUILD_INFORMATION` | Contains release info like :application_name, :download_url. See http://tryouts.readthedocs.org/en/latest/releases.html#create-release

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action tryouts
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run tryouts
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run tryouts parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/tryouts.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
