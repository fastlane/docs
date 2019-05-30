<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcov.rb
-->

# xcov


Nice code coverage reports without hassle




> Create nice code coverage reports and post coverage summaries on Slack *(xcov gem is required)*.<br>More information: [https://github.com/nakiostudio/xcov](https://github.com/nakiostudio/xcov).


xcov ||
---|---
Supported platforms | ios, mac
Author | @nakiostudio



## 1 Example

```ruby
xcov(
  workspace: "YourWorkspace.xcworkspace",
  scheme: "YourScheme",
  output_directory: "xcov_output"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `workspace` | Path the workspace file | 
  `project` | Path the project file | 
  `scheme` | The project's scheme. Make sure it's marked as `Shared` | 
  `configuration` | The configuration used when building the app. Defaults to 'Release' | 
  `source_directory` | The path to project's root directory | 
  `derived_data_path` | The directory where build products and other derived data will go | 
  `output_directory` | The directory in which all reports will be stored | [*](#parameters-legend-dynamic)
  `html_report` | Produce an HTML report | `true`
  `markdown_report` | Produce a Markdown report | `false`
  `json_report` | Produce a JSON report | `false`
  `minimum_coverage_percentage` | Raise exception if overall coverage percentage is under this value (ie. 75) | `0`
  `slack_url` | Create an Incoming WebHook for your Slack group to post results there | 
  `slack_channel` | #channel or @username | 
  `skip_slack` | Don't publish to slack, even when an URL is given | `false`
  `slack_username` | The username which is used to publish to slack | `xcov`
  `slack_message` | The message which is published together with a successful report | `Your *xcov* coverage report`
  `ignore_file_path` | Relative or absolute path to the file containing the list of ignored files | [*](#parameters-legend-dynamic)
  `include_test_targets` | Enables coverage reports for .xctest targets | `false`
  `exclude_targets` | Comma separated list of targets to exclude from coverage report | 
  `include_targets` | Comma separated list of targets to include in coverage report. If specified then exlude_targets will be ignored | 
  `only_project_targets` | Display the coverage only for main project targets (e.g. skip Pods targets) | `false`
  `disable_coveralls` | Add this flag to disable automatic submission to Coveralls | `false`
  `coveralls_service_name` | Name of the CI service compatible with Coveralls. i.e. travis-ci. This option must be defined along with coveralls_service_job_id | 
  `coveralls_service_job_id` | Name of the current job running on a CI service compatible with Coveralls. This option must be defined along with coveralls_service_name | 
  `coveralls_repo_token` | Repository token to be used by integrations not compatible with Coveralls | 
  `xcconfig` | Use an extra XCCONFIG file to build your app | 
  `ideFoundationPath` | Absolute path to the IDEFoundation.framework binary | [*](#parameters-legend-dynamic)
  `legacy_support` | Whether xcov should parse a xccoverage file instead on xccovreport | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action xcov
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run xcov
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run xcov parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcov.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
