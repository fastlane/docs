<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ipa.rb
-->

# ipa


Easily build and sign your app using shenzhen

> You are using legacy `shenzhen` to build your app, which will be removed soon!<br>It is recommended to upgrade to _gym_.<br>To do so, just replace `ipa(...)` with `gym(...)` in your Fastfile.<br>To make code signing work, follow [https://docs.fastlane.tools/codesigning/xcode-project/](https://docs.fastlane.tools/codesigning/xcode-project/).





ipa ||
---|---
Supported platforms | ios
Author | @joshdholtz



## 1 Example

```ruby
ipa(
  workspace: "MyApp.xcworkspace",
  configuration: "Debug",
  scheme: "MyApp",
  # (optionals)
  clean: true, # This means "Do Clean". Cleans project before building (the default if not specified).
  destination: "path/to/dir",      # Destination directory. Defaults to current directory.
  ipa: "my-app.ipa",     # specify the name of the .ipa file to generate (including file extension)
  xcargs: "MY_ADHOC=0",  # pass additional arguments to xcodebuild when building the app.
  embed: "my.mobileprovision",     # Sign .ipa file with .mobileprovision
  identity: "MyIdentity",# Identity to be used along with --embed
  sdk: "10.0", # use SDK as the name or path of the base SDK when building the project.
  archive: true# this means "Do Archive". Archive project after building (the default if not specified).
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `workspace` | WORKSPACE Workspace (.xcworkspace) file to use to build app (automatically detected in current directory) | 
  `project` | Project (.xcodeproj) file to use to build app (automatically detected in current directory, overridden by --workspace option, if passed) | 
  `configuration` | Configuration used to build | 
  `scheme` | Scheme used to build app | 
  `clean` | Clean project before building | 
  `archive` | Archive project after building | 
  `destination` | Build destination. Defaults to current directory | [*](#parameters-legend-dynamic)
  `embed` | Sign .ipa file with .mobileprovision | 
  `identity` | Identity to be used along with --embed | 
  `sdk` | Use SDK as the name or path of the base SDK when building the project | 
  `ipa` | Specify the name of the .ipa file to generate (including file extension) | 
  `xcconfig` | Use an extra XCCONFIG file to build the app | 
  `xcargs` | Pass additional arguments to xcodebuild when building the app. Be sure to quote multiple args | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `ipa` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::IPA_OUTPUT_PATH` | The path to the newly generated ipa file
  `SharedValues::DSYM_OUTPUT_PATH` | The path to the dsym file

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action ipa
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ipa
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ipa parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ipa.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
