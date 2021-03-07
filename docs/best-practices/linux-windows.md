# Using _fastlane_ on Linux and Windows

_fastlane_ was created to automate building iOS apps on macOS. Over time, support for building macOS and Android applications was added.

Over the last few months members of the [_fastlane_ team](https://github.com/fastlane/fastlane#fastlane-team) have worked on improving the support for operating systems besides macOS with _fastlane_, namely Linux and Windows

## Installation

Follow the normal installation instructions:

- [Getting started with _fastlane_ for iOS](https://docs.fastlane.tools/getting-started/ios/setup/)
- [Getting started with _fastlane_ for Android](https://docs.fastlane.tools/getting-started/android/setup/)

## Unsupported functionality

_fastlane_ includes some functionality that does only work on macOS as it uses software that is not available on all other platforms as for example [Xcode](https://developer.apple.com/xcode/), [Keychain](https://support.apple.com/guide/keychain-access/what-is-keychain-access-kyca1083/mac), [`xcodebuild`](https://developer.apple.com/library/archive/technotes/tn2339/_index.html), [`security`](https://ss64.com/osx/security.html) or [`PTY`](http://man7.org/linux/man-pages/man7/pty.7.html). Where possible, we added alternatives inside the _fastlane_ codebase, but this was not possible everywhere. Whenever any of these softwares or tools are triggered in _fastlane_, a crash will inevitably follow on Windows and Linux.

To avoid this we went through all actions and marked the ones using unsupported software as "incompatible" to those operating systems. When _fastlane_ executes such an action, it will check this list and throw an _exception_ with a message and a link to this page instead of crashing uncontrollably. This clearly communicates that some functionality is not available on a platform:

```
...
[17:35:34]: Driving the lane 'test' 🚀
+---------------+------+
|     Lane Context     |
+---------------+------+
| PLATFORM_NAME |      |
| LANE_NAME     | test |
+---------------+------+
[16:39:53]: Action 'scan' is not compatible with operating system 'Windows'. For information how to handle this check out: TODO
[16:39:53]: fastlane finished with errors

[!] Action 'scan' is not compatible with operating system 'Windows'. For information how to handle this check out: TODO
```

The compatibility or incompatibility of actions is documented in the [list of available actions](https://docs.fastlane.tools/actions/).

### Handling different operating systems in your `Fastfile`

If you have lanes that should run on multiple operating systems with different compatibility for the actions used, you can wrap the calls of those actions in an `if` block to make sure it is skipped:

```ruby
lane :foo do
  if Helper.is_mac?
    scan
  else
    puts "Skipping tests as only possible on Mac"
  end

  if !Helper.is_windows?
    build_app
  end
end
```

This way you can e.g. upload a build that is created on the fly on macOS, but use a file from the file system (that was created on a macOS machine before) on Linux or Windows.

### Running unsupported functionality anyway

You can set the environment variable `FASTLANE_IGNORE_OS_INCOMPAT` to override this behavior. The exception is then replaced with a non-blocking error that is output on the console. This is meant for those hackers out there working on making the tools work on other platforms anyway, and also as a way to override this behavior if we ever get an action wrong and some parts of it maybe work on those operating systems anyway.

```
...
[17:36:19]: Driving the lane 'test' 🚀
[17:36:19]: ------------------------------------------------
[17:36:19]: Action 'scan' is not compatible with operating system 'Windows'. For information how to handle this check out: TODO
[17:36:19]: Continuing anyway as `FASTLANE_IGNORE_OS_INCOMPAT` environment variable is set.
[17:36:19]: ------------------------------------------------
[17:36:19]: ------------------
[17:36:19]: --- Step: scan ---
[17:36:19]: ------------------
...
```

### Documenting incompatibilities in custom or plugin action

To support this incompatibility check in your custom or plugin actions, simply create an `is_incompatible?()` action that takes the `operating_system` as a string parameter. It should return `true` if the supplied operating system is not supported:

```ruby
def self.is_incompatible?(operating_system)
  # you can do things like
  #
  #  operating_system != "macOS"
  #
  #  ["macOS", "Linux", "Windows"].include?(operating_system)
  #

  false
end
```

New actions generated with `fastlane new_action` or `fastlane new_plugin` automatically include this method.
