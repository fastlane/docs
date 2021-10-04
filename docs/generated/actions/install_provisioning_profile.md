<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/install_provisioning_profile.rb
-->

# install_provisioning_profile


Install provisioning profile from path




> Install provisioning profile from path for current user


install_provisioning_profile ||
---|---
Supported platforms | ios, mac
Author | @SofteqDG
Returns | The absolute path to the installed provisioning profile



## 1 Example

```ruby
install_provisioning_profile(path: "profiles/profile.mobileprovision")
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to provisioning profile | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action install_provisioning_profile
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run install_provisioning_profile
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run install_provisioning_profile parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/install_provisioning_profile.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
