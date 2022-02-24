## Xcodebuild Formatters

_fastlane_ uses formatters to make the output from `xcodebuild` easier to read. `xcodebuild` is used by [_scan_](/actions/scan/), [_gym_](/actions/gym), and [_snapshot_](/actions/snapshot). The output of `xcodebuild` is piped into a formatter by _fastlane_. Below is an example of how _fastlane_ uses formatters:

```no-highlight
$ xcodebuild [flags] | xcbeautify
```

There are two main formatters the community is using. These are:

- [xcbeautify](#xcbeautify) (recommended)
- [xcpretty](#xcpretty)

### Specifying formatter with _fastlane_ 2.201.0 and above

As of _fastlane_ 2.201.0, `scan`, `gym`, and `snapshot` all offer a new `xcodebuild_formatter` option.

This option will default to `xcbeautify` if its installed, otherwise it will fallback to `xcpretty`. However, `scan`, `gym`, and `snapshot` will end up using `xcpretty` if any options are set that are customizing with `xcpretty` (ex: `xcpretty_args`)

```ruby
scan(
  xcodebuild_formatter: "xcbeautify"
)

scan(
  xcodebuild_formatter: "xcpretty"
)

# Specify a local install of xcbeautify
scan(
  xcodebuild_formatter: "/custom/path/to/xcbeautify"
)

# Specify your own custom formatter
scan(
  xcodebuild_formatter: "/custom/path/to/my_formatter"
)
```

_fastlane_ has some custom logic if `xcbeautify` or `xcpretty` are specified but it will essentially run:

```no-highlight
$ xcodebuild [flags] | <xcodebuild_formatter>
```

---

### Formatters

#### xcbeautify

[xcbeautify](https://github.com/tuist/xcbeautify) is now the **recommended** formatter to use. _fastlane_ users are required to install `xcbeautify` themselves if they want to use it.

```no-highlight
$ brew install xcbeautify
```

`xcbeautify` is currently recommended because it:

 - Supports Xcode's new build system output
 - Supports Xcode's parallel testing output
 - Supports formatting Swift Package Manager output
 - It's faster than `xcpretty`

#### xcpretty

Historically, _fastlane_ was tightly integrated with [xcpretty](https://github.com/xcpretty/xcpretty). `xcpretty` is a RubyGem and a dependency of _fastlane_. This was the best option for _fastlane_ as there were no extra steps for installing or using this formatter.

`xcpretty` also did more than formatting. It used the `xcodebuild` output to:

- Generate a JUnit report
- Generate an HTML report
- Generate a JSON compilation database

**Before 2.201.0**, [_scan_](/actions/scan/) used `xcpretty` to generate these files and determine success/failure with `xcpretty` output.<br/>
**As of 2.201.0**, [_scan_](/actions/scan/) will only generate these if `xcodebuild_formatter` is using `xcpretty` but now use `trainer` to parse test results to determine success/failure.
