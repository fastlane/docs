<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# oclint


Lints implementation files with OCLint




> Run the static analyzer tool [OCLint](http://oclint.org) for your project. You need to have a `compile_commands.json` file in your _fastlane_ directory or pass a path to your file


oclint |
-----|----
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
  allow_duplicated_violations: true     # Allow duplicated violations in the OCLint report
)
```





## Parameters

Key | Description
----|------------
  `oclint_path` | The path to oclint binary
  `compile_commands` | The json compilation database, use xctool reporter 'json-compilation-database'
  `select_reqex` | Select all files matching this reqex
  `select_regex` | Select all files matching this regex
  `exclude_regex` | Exclude all files matching this regex
  `report_type` | The type of the report (default: html)
  `report_path` | The reports file path
  `list_enabled_rules` | List enabled rules
  `rc` | Override the default behavior of rules
  `thresholds` | List of rule thresholds to override the default behavior of rules
  `enable_rules` | List of rules to pick explicitly
  `disable_rules` | List of rules to disable
  `max_priority_1` | The max allowed number of priority 1 violations
  `max_priority_2` | The max allowed number of priority 2 violations
  `max_priority_3` | The max allowed number of priority 3 violations
  `enable_clang_static_analyzer` | Enable Clang Static Analyzer, and integrate results into OCLint report
  `enable_global_analysis` | Compile every source, and analyze across global contexts (depends on number of source files, could results in high memory load)
  `allow_duplicated_violations` | Allow duplicated violations in the OCLint report




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action oclint
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/oclint.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
