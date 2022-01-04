<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clean_build_artifacts.rb
-->

# clean_build_artifacts


Deletes files created as result of running gym, cert, sigh or download_dsyms




> This action deletes the files that get created in your repo as a result of running the _gym_ and _sigh_ commands. It doesn't delete the `fastlane/report.xml` though, this is probably more suited for the .gitignore.<br><br>Useful if you quickly want to send out a test build by dropping down to the command line and typing something like `fastlane beta`, without leaving your repo in a messy state afterwards.


clean_build_artifacts ||
---|---
Supported platforms | ios, mac
Author | @lmirosevic



## 1 Example

```ruby
clean_build_artifacts
```





## Parameters

Key | Description | Default
----|-------------|--------
  `exclude_pattern` | Exclude all files from clearing that match the given Regex pattern: e.g. '.*.mobileprovision' | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action clean_build_artifacts
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run clean_build_artifacts
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run clean_build_artifacts parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clean_build_artifacts.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
