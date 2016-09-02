# iOS App Store deployment using fastlane

# Building your app

_fastlane_ takes care of building your app using a feature called _gym_, just add the following to your `Fastfile`:

```
lane :appstore do
  gym(scheme: "MyApp")
end
```

Additionally you can specify more options for building your app, for example

```ruby
lane :appstore do
  gym(scheme: "MyApp",
      workspace: "Example.xcworkspace",
      include_bitcode: true)
end
```

Try running the lane using

```no-highlight
fastlane appstore
```

If everything works, you should have a `[ProductName].ipa` file in the current directory. To get a list of all available parameters for _gym_, run `fastlane action gym`.

## Codesigning

Chances are that something went wrong because of code signing at the previous step. We prepared our own [Code Signing Guide](/codesigning/GettingStarted) that helps you setting up the right code signing approach for your project.

# Submitting your app

## Generating screenshots

To find out more about how to automatically generate screenshots for the App Store, check out the [screenshots guide](screenshots.md).

## Upload the binary and app metadata

After building your app, it's ready to be uploaded to the App Store. If you've already followed the [beta deployment guide](beta-deployment.md), the following code might look similar already. 

```ruby
lane :appstore do
  snapshot                      # generate new screenshots for the App Store
  match(type: "appstore")       # see code signing guide for more information
  gym(scheme: "MyApp")          # build your app
  appstore                      # upload your app to iTunes Connect
  slack(message: "Successfully uploaded a new App Store build")
end
```

_fastlane_ automatically passes on information about the generated screenshots and the binary to the `appstore` action of your `Fastfile`.

For a list of all options for each of the steps run `fastlane action [action_name]`.

# Best Practices

<details>
<summary>Push Notifications</summary>

To make sure your latest push notification certificate is still valid during your submission process, add the following at the beginning of your lane:

```ruby
lane :appstore do
  pem
  ...
end
```

_pem_ will ensure your certificate is valid for at least another 2 weeks, and create a new one if it isn't.

If you don't have any push certificates already, _pem_ will create one for you and store locally in your project's directory. To get more information about the available options run `fastlane action pem`.

</details>


