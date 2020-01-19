<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/swiftlint.rb
-->

# swiftlint


Run swift code validation using SwiftLint







swiftlint ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx



## 1 Example

```ruby
swiftlint(
  mode: :lint,      # SwiftLint mode: :lint (default) or :autocorrect
  path: "/path/to/lint",       # Specify path to lint (optional)
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
  `mode` | SwiftLint mode: :lint, :autocorrect or :analyze | `:lint`
  `path` | Specify path to lint | 
  `output_file` | Path to output SwiftLint result | 
  `config_file` | Custom configuration file of SwiftLint | 
  `strict` | Fail on warnings? (true/false) | `false`
  `files` | List of files to process | 
  `ignore_exit_status` | Ignore the exit status of the SwiftLint command, so that serious violations                                                     don't fail the build (true/false) | `false`
  `reporter` | Choose output reporter | 
  `quiet` | Don't print status logs like 'Linting <file>' & 'Done linting' | `false`
  `executable` | Path to the `swiftlint` executable on your machine | 
  `format` | Format code when mode is :autocorrect | `false`
  `compiler_log_path` | Compiler log path when mode is :analyze | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action swiftlint
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run swiftlint
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run swiftlint parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/swiftlint.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
