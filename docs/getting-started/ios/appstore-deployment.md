{!docs/includes/setup-fastlane-header.md!}

# iOS App Store deployment using _fastlane_

# Building your app

_fastlane_ takes care of building your app using an action called _build_app_, just add the following to your `Fastfile`:

```ruby
lane :release do
  build_app(scheme: "MyApp")
end
```

Additionally you can specify more options for building your app, for example

```ruby
lane :release do
  build_app(scheme: "MyApp",
            workspace: "Example.xcworkspace",
            include_bitcode: true)
end
```

Try running the lane using

```no-highlight
fastlane release
```

If everything works, you should have a `[ProductName].ipa` file in the current directory. To get a list of all available parameters for _build_app_, run `fastlane action build_app`.

## Codesigning

Chances are that something went wrong because of code signing at the previous step. We prepared our own [Code Signing Guide](/codesigning/getting-started/) that helps you setting up the right code signing approach for your project.

# Submitting your app

## Generating screenshots

To find out more about how to automatically generate screenshots for the App Store, check out [_fastlane_ screenshots for iOS and tvOS](screenshots.md).

## Upload the binary and app metadata

After building your app, it's ready to be uploaded to the App Store. If you've already followed [iOS Beta deployment using _fastlane_](beta-deployment.md), the following code might look similar already.

```ruby
lane :release do
  capture_screenshots                  # generate new screenshots for the App Store
  sync_code_signing(type: "appstore")  # see code signing guide for more information
  build_app(scheme: "MyApp")
  upload_to_app_store                  # upload your app to App Store Connect
  slack(message: "Successfully uploaded a new App Store build")
end
```

_fastlane_ automatically passes on information about the generated screenshots and the binary to the `upload_to_app_store` action of your `Fastfile`.

For a list of all options for each of the steps run `fastlane action [action_name]`.

## More details

For more details on how `upload_to_app_store` works, how you can define more options, check out [upload_to_app_store](/actions/upload_to_app_store/).

# Best Practices

<details>
<summary>Push Notifications</summary>

To make sure your latest push notification certificate is still valid during your submission process, add the following at the beginning of your lane:

```ruby
lane :release do
  get_push_certificate
  # ...
end
```

_get_push_certificate_ will ensure your certificate is valid for at least another 2 weeks, and create a new one if it isn't.

If you don't have any push certificates already, _get_push_certificate_ will create one for you and store locally in your project's directory. To get more information about the available options run `fastlane action get_push_certificate`.

</details>

<details>
<summary>Incrementing the build number</summary>

The code sample below will use the latest build number from App Store Connect and temporarily set it. 

```ruby
lane :beta do
  increment_build_number(
    build_number: app_store_build_number + 1,
    xcodeproj: "Example.xcodeproj"
  )
end
```

For all the steps above, there are more parameters available, run the following to get a full list:

```no-highlight
fastlane action [action_name]
```

