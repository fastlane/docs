# ipa


Easily build and sign your app using shenzhen

> You are using legacy `shenzhen` to build your app, which will be removed soon!
It is recommended to upgrade to _gym_
To do so, just replace `ipa(...)` with `gym(...)` in your Fastfile
To make code signing work, follow https://docs.fastlane.tools/codesigning/xcode-project/#





ipa |
-----|----
Supported platforms | ios
Author | @joshdholtz



**1 Example**

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





**Parameters**

Key | Description
----|------------
  `workspace` | WORKSPACE Workspace (.xcworkspace) file to use to build app (automatically detected in current directory)
  `project` | Project (.xcodeproj) file to use to build app (automatically detected in current directory, overridden by --workspace option, if passed)
  `configuration` | Configuration used to build
  `scheme` | Scheme used to build app
  `clean` | Clean project before building
  `archive` | Archive project after building
  `destination` | Build destination. Defaults to current directory
  `embed` | Sign .ipa file with .mobileprovision
  `identity` | Identity to be used along with --embed
  `sdk` | Use SDK as the name or path of the base SDK when building the project
  `ipa` | Specify the name of the .ipa file to generate (including file extension)
  `xcconfig` | Use an extra XCCONFIG file to build the app
  `xcargs` | Pass additional arguments to xcodebuild when building the app. Be sure to quote multiple args




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action ipa
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ipa.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
