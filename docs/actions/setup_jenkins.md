<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/setup_jenkins.rb
-->

# setup_jenkins


Setup xcodebuild, gym and scan for easier Jenkins integration




> - Adds and unlocks keychains from Jenkins 'Keychains and Provisioning Profiles Plugin'
- Sets code signing identity from Jenkins 'Keychains and Provisioning Profiles Plugin'
- Sets output directory to './output' (gym, scan and backup_xcarchive)
- Sets derived data path to './derivedData' (xcodebuild, gym, scan and clear_derived_data, carthage)
- Produce result bundle (gym and scan)
>
This action helps with Jenkins integration. Creates own derived data for each job. All build results like IPA files and archives will be stored in the `./output` directory.<br>The action also works with [Keychains and Provisioning Profiles Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Keychains+and+Provisioning+Profiles+Plugin), the selected keychain will be automatically unlocked and the selected code signing identity will be used. By default this action will only work when _fastlane_ is executed on a CI system.


setup_jenkins ||
---|---
Supported platforms | ios, mac
Author | @bartoszj



## 1 Example

```ruby
setup_jenkins
```





## Parameters

Key | Description | Default
----|-------------|--------
  `force` | Force setup, even if not executed by Jenkins | `false`
  `unlock_keychain` | Unlocks keychain | `true`
  `add_keychain_to_search_list` | Add to keychain search list | `:replace`
  `set_default_keychain` | Set keychain as default | `true`
  `keychain_path` | Path to keychain | 
  `keychain_password` | Keychain password | `''`
  `set_code_signing_identity` | Set code signing identity from CODE_SIGNING_IDENTITY environment | `true`
  `code_signing_identity` | Code signing identity | 
  `output_directory` | The directory in which the ipa file should be stored in | `./output`
  `derived_data_path` | The directory where built products and other derived data will go | `./derivedData`
  `result_bundle` | Produce the result bundle describing what occurred will be placed | `true`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action setup_jenkins
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run setup_jenkins
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run setup_jenkins parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/setup_jenkins.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
