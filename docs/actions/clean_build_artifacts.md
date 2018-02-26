<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# clean_build_artifacts


Deletes files created as result of running gym, cert, sigh or download_dsyms




> This action deletes the files that get created in your repo as a result of running the _gym_ and _sigh_ commands. It doesn't delete the `fastlane/report.xml` though, this is probably more suited for the .gitignore.
Useful if you quickly want to send out a test build by dropping down to the command line and typing something like `fastlane beta`, without leaving your repo in a messy state afterwards.


clean_build_artifacts |
-----|----
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
To show the documentation in your terminal, run
```no-highlight
fastlane action clean_build_artifacts
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/clean_build_artifacts.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
