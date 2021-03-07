<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/oclint.rb
-->

# oclint


Lints implementation files with OCLint




> Run the static analyzer tool [OCLint](http://oclint.org) for your project. You need to have a `compile_commands.json` file in your _fastlane_ directory or pass a path to your file.


oclint ||
---|---
Supported platforms | ios, android, mac
Author | @HeEAaD



## 1 Example

```ruby
oclint(
  compile_commands: "commands.json",    # The JSON compilation database, use xctool reporter "json-compilation-database"
  select_regex: /ViewController.m/,     # Select all files matching this regex
  exclude_regex: /Test.m/,    # Exclude all files matching this regex
  report_type: "pmd",         # The type of the report (default: html)
  max_priority_1: 10,         # The max allowed number of priority 1 violations
  max_priority_2: 100,        # The max allowed number of priority 2 violations
  max_priority_3: 1000,       # The max allowed number of priority 3 violations
  thresholds: [     # Override the default behavior of rules
    "LONG_LINE=200",
    "LONG_METHOD=200"
  ],
  enable_rules: [   # List of rules to pick explicitly
    "DoubleNegative",
    "SwitchStatementsDon'TNeedDefaultWhenFullyCovered"
  ],
  disable_rules: ["GotoStatement"],     # List of rules to disable
  list_enabled_rules: true,   # List enabled rules
  enable_clang_static_analyzer: true,   # Enable Clang Static Analyzer, and integrate results into OCLint report
  enable_global_analysis: true,         # Compile every source, and analyze across global contexts (depends on number of source files, could results in high memory load)
  allow_duplicated_violations: true,    # Allow duplicated violations in the OCLint report
  extra_arg: "-Wno-everything"# Additional argument to append to the compiler command line
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `oclint_path` | The path to oclint binary | `oclint`
  `compile_commands` | The json compilation database, use xctool reporter 'json-compilation-database' | `compile_commands.json`
  `select_reqex` | Select all files matching this reqex | 
  `select_regex` | Select all files matching this regex | 
  `exclude_regex` | Exclude all files matching this regex | 
  `report_type` | The type of the report (default: html) | `html`
  `report_path` | The reports file path | 
  `list_enabled_rules` | List enabled rules | `false`
  `rc` | Override the default behavior of rules | 
  `thresholds` | List of rule thresholds to override the default behavior of rules | 
  `enable_rules` | List of rules to pick explicitly | 
  `disable_rules` | List of rules to disable | 
  `max_priority_1` | The max allowed number of priority 1 violations | 
  `max_priority_2` | The max allowed number of priority 2 violations | 
  `max_priority_3` | The max allowed number of priority 3 violations | 
  `enable_clang_static_analyzer` | Enable Clang Static Analyzer, and integrate results into OCLint report | `false`
  `enable_global_analysis` | Compile every source, and analyze across global contexts (depends on number of source files, could results in high memory load) | `false`
  `allow_duplicated_violations` | Allow duplicated violations in the OCLint report | `false`
  `extra_arg` | Additional argument to append to the compiler command line | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Lane Variables

Actions can communicate with each other using a shared hash `lane_context`, that can be accessed in other actions, plugins or your lanes: `lane_context[SharedValues:XYZ]`. The `oclint` action generates the following Lane Variables:

SharedValue | Description 
------------|-------------
  `SharedValues::FL_OCLINT_REPORT_PATH` | The reports file path

To get more information check the [Lanes documentation](https://docs.fastlane.tools/advanced/lanes/#lane-context).
<hr />


## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action oclint
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run oclint
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run oclint parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/oclint.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
