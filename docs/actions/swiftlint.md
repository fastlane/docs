<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# swiftlint


Run swift code validation using SwiftLint







swiftlint |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



## 1 Example

```ruby
swiftlint(
  mode: :lint,      # SwiftLint mode: :lint (default) or :autocorrect
  output_file: "swiftlint.result.json", # The path of the output file (optional)
  config_file: ".swiftlint-ci.yml",     # The path of the configuration file (optional)
  files: [# List of files to process (optional)
    "AppDelegate.swift",
    "path/to/project/Model.swift"
  ],
  ignore_exit_status: true    # Allow fastlane to continue even if SwiftLint returns a non-zero exit status
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `mode` | SwiftLint mode: :lint or :autocorrect | `:lint`
  `output_file` | Path to output SwiftLint result | 
  `config_file` | Custom configuration file of SwiftLint | 
  `strict` | Fail on warnings? (true/false) | `false`
  `files` | List of files to process | 
  `ignore_exit_status` | Ignore the exit status of the SwiftLint command, so that serious violations                                                     don't fail the build (true/false) | `false`
  `reporter` | Choose output reporter | 
  `quiet` | Don't print status logs like 'Linting <file>' & 'Done linting' | `false`
  `executable` | Path to the `swiftlint` executable on your machine | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action swiftlint
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/swiftlint.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
