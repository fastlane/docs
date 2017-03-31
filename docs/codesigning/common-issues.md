# Common code signing issues

## Xcode errors

> Code Sign error: No matching provisioning profiles found: No provisioning profiles with a valid signing identity (i.e. certificate and private key pair) matching the bundle identifier "X" were found.

The provisioning profile for the given app identifier "X" is not available on the local machine. Make sure you have a valid provisioning profile for the correct distribution type (App Store, Development or Ad Hoc) on the Apple Developer Portal, download and install it, and select the profile in the Xcode settings (See [Setting up your Xcode Project](xcode-project.md)).

You might have the provisioning profile installed locally, but miss the private key or certificate for it. 

> No matching codesigning identity found: No codesigning identities (i.e. certificate and private key pairs) matching "iPhone Distribution: X" were found

The code signing identity you specified in the Xcode project can't be found in your local keychain. Make sure to transfer the certificate and private key from another Mac (or wherever you store the private key), or to update the project file to use the correct code signing identity.

> Error Domain=IDEDistributionErrorDomain Code=1 "The operation couldn’t be completed. (IDEDistributionErrorDomain error 1.)"

This error can have a lot of reasons, some things you should try:

- Verify your Keychain is valid and you don't have an expired WWDR certificate using [this guide](troubleshooting.md#keychain)
- Verify both your certificate and provisioning profile are valid in both your Keychain and on the Apple Developer Portal (Check out [Debugging codesigning issues](troubleshooting.md) for more information)
- Follow the other steps of [Debugging codesigning issues](troubleshooting.md)

> Provisioning profile does not match bundle identifier: The provisioning profile specified in your build settings ("X") has an AppID of "Y" which does not match your bundle identifier "Z"

Your project defines a provisioning profile that doesn't match the bundle identifier of your app. There is mismatch between the bundle identifiers, this might happen if you specify the wrong provisioning profile in your target.

> Your build settings specify a provisioning profile with the UUID "X", however, no such provisioning profile was found.

Your project defines a provisioning profile which doesn't exist on your local machine. Check out [Setting up your Xcode Project](xcode-project.md) for more information how to properly specify a provisioning profile to avoid hard coded UUIDs in your project.

> CodeSign Error: code signing is required for product type 'Application'...

Make sure to have a valid code signing identity defined in your project targets. This might happen when you select `Don't Code Sign` as Code Signing Identity.

## _fastlane_ errors

> Could not find a matching code signing identity for type 'X'

There are no certificates available on the Apple Developer Portal. This could either mean someone revoked a certificate, or you don't have access to it. 

# Debugging Steps for "No applicable devices found." error

It's not immediately obvious what this error is or what it's caused by, so hopefully these simple steps will help you find the root cause faster than my experience with it.

### Not Just _fastlane_

This error happens to all projects built with `xcodebuild` / `xcrun`, so if you're trying to blame _fastlane_ here, take a deep breath and look elsewhere first. _fastlane_ might help alleviate it with some env var unsetting / setting or other tricks (see below), but this is an error from the new export APIs that Xcode uses.

### Legacy Export API

As of Xcode 8.3, the deprecated / legacy export api (e.g. `use_legacy_build_api`) is removed so you're unfortunately stuck with using the latest, and often broken, export API.

### Red Herring

The error message, `"No applicable devices found."`, is actually just a red herring: it's not the real error. Something else is erroring out under the hood so you'll need to dig in to find out what.

### The archive built successfully, but the export step failed

Typically, your archive will build nicely, and with the correct provisioning profile (you can inspect the `.xcarchive` package to verify the `embedded.mobileprovision` file matches).

What happens is the export step will possibly sign it with a different profile depending on which `export_method` you're choosing (with `development` being the default) and it is during this step that the process will fail.

This allows you to isolate the error to the export step, under most circumstances.

### Dependency on other Gems

This step sometimes fails due to not having these gems installed. This caused many of the old instances of this problem.

- [CFPropertyList](https://github.com/ckruse/CFPropertyList)
- [sqlite3](https://github.com/sparklemotion/sqlite3-ruby)
- [digest](https://rubygems.org/gems/digest)

You can use `$ gem list` to show which gems are installed

### Use `system` Ruby

_fastlane_ will force you to use system Ruby version, by unsetting some env vars. This caused many of the old instances of this problem, but likely won't impact many in the future.

It should be perfectly fine to use RVM and Xcode may even work nicely with newer Ruby versions, so just keep this option in mind for legacy builds.

If you have [RVM](https://rvm.io/) installed, you can set and check this using:

```shell
$ rvm use system
$ ruby -v
ruby 2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin16]
$ which ruby
/usr/bin/ruby
```

### Check the Logs

In my situation and in many that I saw on this repo and across the interwebs, this error was given during the bundling process. Luckily, that bundler creates a log file that you can access to see what error *actually* happened:

>2017-03-30 21:47:09.855 xcodebuild[78957:9114437] [MT] IDEDistribution: -[IDEDistributionLogging _createLoggingBundleAtPath:]: Created bundle at path '/var/folders/s1/0h7d0scx6xqdthft328yfk0m0000gn/T/MyApp-Internal_2017-03-30_21-47-09.854.xcdistributionlogs'.
>1.2.840.113635.100.1.61
>1.2.840.113635.100.1.61
>2017-03-30 21:47:14.702 xcodebuild[78957:9114437] [MT] IDEDistribution: Step failed: <IDEDistributionThinningStep: 0x7fc3218d0b60>: Error Domain=IDEDistributionErrorDomain Code=14 "No applicable devices found." UserInfo={NSLocalizedDescription=No applicable devices found.}
error: exportArchive: No applicable devices found.

If you look closely, you'll see the red herring error message and then just above it, there's a path to a log file (`*.xcdistributionlogs`). Opening that up, you'll see more detail. (Side note: you can also search for all logs via `$ sudo find /private/var -name "*.xcdistributionlogs"`)

In my case, it was because my export was built without bitcode, but I had static lib frameworks that were built with it (inside `IDEDistribution.standard.log` within the `.xcdistributionlogs` file):

>2017-03-31 16:49:06 +0000  Validating IPA structure...
>2017-03-31 16:49:06 +0000  error: Failed to verify bitcode in opus.framework/opus:
error: Bundle only contains bitcode-marker /var/folders/s1/0h7d0scx6xqdthft328yfk0m0000gn/T/IDEDistributionThinningStep.KRt/Payload/Viv.app/Frameworks/opus.framework/opus (armv7)

I rebuilt that framework without bitcode and it worked like a charm! 😅 

### Run commands yourself

_gym_ does a great job of showing what commands it's going to run. Inspect the files that it generates and run these commands yourself, as many times as you need to, in order to isolate the problems.

Example, here's the export command that _gym_ shows:

>/usr/bin/xcrun /Users/rob/.fastlane/bin/bundle/lib/ruby/gems/2.2.0/gems/fastlane-2.24.0/gym/lib/assets/wrap_xcodebuild/xcbuild-safe.sh -exportArchive -exportOptionsPlist '/var/folders/s1/0h7d0scx6xqdthft328yfk0m0000gn/T/gym_config20170330-65021-1xbw0ov.plist' -archivePath /Users/rob/Library/Developer/Xcode/Archives/2017-03-30/MyApp\ 2017-03-30\ 21.12.02.xcarchive -exportPath '/var/folders/s1/0h7d0scx6xqdthft328yfk0m0000gn/T/gym_output20170330-65021-u80ojn'

From that, I can see which `exportOptionsPlist` it's using, which has this in it:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>method</key>
	<string>development</string>
</dict>
</plist>
```

And I can see which `.xcarchive` it's using to check if it built that with the correct provisioning profile.

Most importantly, I can keep running that entire command until I figure out why it's breaking (e.g. try installing these gems, try using system Ruby).

### Other Causes

Keep in mind, this list could be infinite since this `No applicable devices found` error just manifests itself from underlying errors. Your best bet is to dig into the logs and see which error is actually being thrown.

- Using the wrong `export_method` or some other error in the generated `exportPlist` that gets generated
- Root Apple WWDR certificate had expired; check the Keychain for expired certificates
- Env vars not being unset, [relevant PR](https://github.com/fastlane-old/gym/pull/176)
- Including bitcode sometimes caused it (can use `include_bitcode: false`) in your _gym_ command and check if all frameworks match your bitcode requirements
- Provisioning profiles not matching capabilities and beta-reports-active flag on .entitlements file.

### Apple Tech Notes

If all else fails, use these tech notes to troubleshoot app thinning and bitcode: 

- https://developer.apple.com/library/content/technotes/tn2432/_index.html
- https://stackoverflow.com/questions/34959767/whats-the-difference-between-fembed-bitcode-and-bitcode-generation-mode
- https://forums.developer.apple.com/thread/70583
