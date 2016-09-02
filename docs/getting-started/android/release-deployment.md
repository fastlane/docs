# Deploy to Google Play using fastlane

# Building your app

_fastlane_ takes care of building your app by delegating to your existing Gradle build. Just add the following to your `Fastfile`:

```ruby
lane :playstore
  gradle(
    task: 'assemble',
    build_type: 'Release'
  )
end
```

When that completes you should have the appropriate APK ready to go in the standard output directory. To get a list of all available parameters for the `gradle` action, run:

```no-highlight
fastlane action gradle
```

# Uploading your APK

To upload your binary to Google Play, _fastlane_ uses a tool called _supply_. Because _supply_ needs authentication information from Google, if you haven't yet done the [_supply_ setup steps](setup.md), please do those now!

With that done, simply add a call to _supply_ to the lane you set up above:

```ruby
lane :playstore
  gradle(
    task: 'assemble',
    flavor: 'Paid',
    build_type: 'Release'
  )
  supply # Uploads the APK built in the gradle step above
end
```

This will also upload:

- App metadata from `fastlane/metadata/android` if you previously ran `fastlane supply init`
- Expansion files (obbs) found under the same directory as your APK as long as:
    - They are identified by type as **main** or **patch** by containing `main` or `patch` in their file names
    - There is at most one of each type
- Screenshots from `fastlane/metadata/android` if you previously ran _screengrab_

If you would like to capture and upload screenshots automatically as part of your deployment process, check out the [fastlane screenshots for Android](screenshots.md) guide to get started!

To gradually roll out a new build you can use:

```ruby
lane :playstore
  # ...
  supply(
  	track: 'rollout',
  	rollout: '0.5'
  )
end
```

To get a list of all available parameters for the _supply_ action, run:

```no-highlight
fastlane action supply
```
