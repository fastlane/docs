{!docs/includes/setup-fastlane-header.md!}

# iOS Beta deployment using _fastlane_

# Building your app

_fastlane_ takes care of building your app using an action called _build_app_, just add the following to your `Fastfile`:

```ruby
lane :beta do
  build_app(scheme: "MyApp")
end
```

Additionally you can specify more options for building your app, for example

```ruby
lane :beta do
  build_app(scheme: "MyApp",
            workspace: "Example.xcworkspace",
            include_bitcode: true)
end
```

Try running the lane using

```no-highlight
fastlane beta
```

If everything works, you should have a `[ProductName].ipa` file in the current directory. To get a list of all available parameters for _build_app_, run `fastlane action build_app`.

## Codesigning

Chances are that something went wrong because of code signing at the previous step. We prepared our own [Code Signing Guide](/codesigning/getting-started/) that helps you setting up the right code signing approach for your project.

# Uploading your app

After building your app, it's ready to be uploaded to a beta testing service of your choice. The beauty of _fastlane_ is that you can easily switch beta provider, or even upload to multiple at once, without any extra work.

All you have to do is to put the name of the beta testing provider of your choice after building the app using _build_app_:

```ruby
lane :beta do
  sync_code_signing(type: "appstore")    # see code signing guide for more information
  build_app(scheme: "MyApp")
  upload_to_testflight
  slack(message: "Successfully distributed a new beta build")
end
```

_fastlane_ automatically passes on information about the generated `.ipa` file from _build_app_ to the beta testing provider of your choice.

To get a list of all available parameters for a given action, run
```no-highlight
fastlane action slack
```

### Beta testing services


<details>
<summary>TestFlight</summary>

You can easily upload new builds to TestFlight (which is part of App Store Connect) using _fastlane_. To do so, just use the built-in `testflight` action after building your app

```ruby
lane :beta do
  # ...
  build_app
  upload_to_testflight
end
```

Some example use cases

```ruby
lane :beta do
  # ...
  build_app

  # Variant 1: Provide a changelog to your build
  upload_to_testflight(changelog: "Add rocket emoji")

  # Variant 2: Skip the "Waiting for processing" of the binary
  #   While this will speed up your build, it will not distribute
  #   the binary to your tests, nor set a changelog
  upload_to_testflight(skip_waiting_for_build_processing: true)
end
```

If you used `fastlane init` to setup _fastlane_, your Apple ID is stored in the `fastlane/Appfile`. You can also overwrite the username, using `upload_to_testflight(username: "bot@fastlane.tools")`.

To get a list of all available options, run

```no-highlight
fastlane action upload_to_testflight
```

With _fastlane_, you can also automatically manage your beta testers, check out the other actions available.

---
</details>

<details>
<summary>Crashlytics (Fabric Beta)</summary>

```ruby
lane :beta do
  # ...
  build_app
  crashlytics(api_token: "[insert_key_here]",
              build_secret: "[insert_key_here]")
end
```

To get your API token, open the [organizations settings page](https://www.fabric.io/settings/organizations) and click on the API key and build secret links. 


To get a list of all available options, run

```no-highlight
fastlane action crashlytics
```

---
</details>

<details>
<summary>HockeyApp</summary>

```ruby
lane :beta do
  # ...
  build_app
  hockey(api_token: "[insert_key_here]")
end
```

To get your API token, open [API Tokens in Account Settings](https://rink.hockeyapp.net/manage/auth_tokens). From there, you can find your existing API token, or create a new one. 

To get a list of all available options see the [`hockey` action docs](https://docs.fastlane.tools/actions/hockey/), or run 

```no-highlight
fastlane action hockey
```

</details>

<details>
<summary>TestFairy</summary>

```ruby
lane :beta do
  # ...
  build_app

  testfairy(api_key: "[insert_key_here]")

  # Variant 1: Provide a changelog
  testfairy(api_key: "[insert_key_here]", 
            comment: "Add rocket emoji")

  # Variant 2: Specify tester groups
  testfairy(api_key: "[insert_key_here]", testers_groups: ["group1"])
end
```

To get a list of all available options, run

```no-highlight
fastlane action testfairy
```

More information about the service on [TestFairy.com](https://testfairy.com).
</details>

More information about additional supported beta testing services can be found in the [list of "Beta" actions](https://docs.fastlane.tools/actions/#beta)

# Release Notes

<details>
<summary>Automatically based on git commits</summary>

Your changelog changes, so it doesn't make a lot of sense to store a static release note in the `Fastfile`.

```ruby
lane :beta do
  sync_code_signing
  build_app

  changelog_from_git_commits # this will generate the changelog based on your last commits
  upload_to_testflight
end
```

Get a list of all available options using `fastlane action changelog_from_git_commits`, here are some examples

```ruby
changelog_from_git_commits(
  between: ['7b092b3', 'HEAD'], # Optional, lets you specify a revision/tag range between which to collect commit info
  merge_commit_filtering: exclude_merges # Optional, lets you filter out merge commits
)
```
---
</details>

<details>
<summary>Prompt for changelog</summary>

You can automatically be asked for the changelog in your terminal using the `prompt` action:

```ruby
lane :beta do
  # Variant 1: Ask for a one line input
  changelog = prompt(text: "Changelog: ")

  # Variant 2: Ask for a multi-line input
  #   The user confirms their input by typing `END` and Enter
  changelog = prompt(
    text: "Changelog: ",
    multi_line_end_keyword: "END"
  )

  sync_code_signing
  build_app

  upload_to_testflight(changelog: changelog)
end
```

---
</details>

<details>
<summary>Fetching the changelog from the file system or remote server</summary>

You can fetch values from anywhere in your `Fastfile`, including the file system and remote server

```ruby
lane :beta do
  # Variant 1: Read from file system
  #   note the `..`, since fastlane runs in the _fastlane_ directory
  changelog = File.read("../Changelog.txt")

  # Variant 2: Fetch data from a remote web server
  changelog = download(url: "https://lookatmycms.com/changelog.txt")

  sync_code_signing
  build_app

  upload_to_testflight(changelog: changelog)
end
```

---
</details>

# Best Practices

<details>
<summary>Manage devices and testers using _fastlane_</summary>

<details>
<summary>TestFlight</summary>

If you're using TestFlight you don't need to worry about UDIDs of your devices. Instead you just maintain a list of testers based on their Apple ID email address.

_fastlane_ supports automatically registering devices using different approaches

#### [boarding](https://github.com/fastlane/boarding#readme)

[boarding](https://github.com/fastlane/boarding#readme) allows you set up a registration page for your beta testers, so they can enter their email address and start testing your application.

![/img/getting-started/ios/boarding-screenshot.png](/img/getting-started/ios/boarding-screenshot.png)

Check out the [boarding GitHub repo](https://github.com/fastlane/boarding#readme) for more information.

#### pilot

_pilot_ is automatically installed with _fastlane_, you can use it to register individual testers to TestFlight

```no-highlight
# Register a new external tester
fastlane pilot add email@invite.com

# Register a new external tester and add them to your app
fastlane pilot add email@invite.com -a com.app.name
```
---

</details>

<details>
<summary>Third party beta testing services</summary>

If you're using a third party beta testing service, you'll need to manage your registered devices and their UDIDs. _fastlane_ already supports device registrations and updating provisioning profiles out of the box. 

```ruby
lane :beta do
  # Before calling match, we make sure all our devices are registered on the Apple Developer Portal
  register_devices(devices_file: "devices.txt")

  # After registering the new devices, we'll make sure to update the provisioning profile if necessary
  # Note how we make sure to pass "adhoc" to get and use a provisioning profile for Ad Hoc distribution
  sync_code_signing(force_for_new_devices: true, type: "adhoc")
  build_app
  # ...
end
```

The `devices.txt` should look like this:
```no-highlight
Device ID Device Name
A123456789012345678901234567890123456789  DeviceName1
B123456789012345678901234567890123456789  DeviceName2
```

</details>
</details>

<details>
<summary>Incrementing the build number</summary>

Depending on the beta testing service you use, you'll have to increment the build number each time you upload a new build. This is a requirement for TestFlight for example.

To do so, there are some built-in fastlane actions available, here are some examples

### Fetching the latest build number from TestFlight

The code sample below will use the latest build number from TestFlight and temporarily set it. 

```ruby
lane :beta do
  increment_build_number(
    build_number: latest_testflight_build_number + 1,
    xcodeproj: "Example.xcodeproj"
  )
end
```

### Committing the build number to version control

The code sample below will increment the build number and commit the project changes to version control.

```ruby
lane :beta do
  # Ensure that your git status is not dirty
  ensure_git_status_clean

  # Increment the build number (not the version number)
  # Providing the xcodeproj is optional
  increment_build_number(xcodeproj: "Example.xcodeproj")

  # Commit the version bump
  commit_version_bump(xcodeproj: "Example.xcodeproj")

  # Add a git tag for this build. This will automatically
  # use an appropriate git tag name
  add_git_tag

  # Push the new commit and tag back to your git remote
  push_to_git_remote
end
```


For all the steps above, there are more parameters available, run the following to get a full list:

```no-highlight
fastlane action [action_name]
```

### Use the number of commits

This isn't recommended, however some teams prefer this approach. You can use the number of commits of the current branch (via [`number_of_commits`](https://docs.fastlane.tools/actions/number_of_commits/)) as the build number. This will only work if you always run the build on the same branch.

```ruby
lane :beta do
  increment_build_number(build_number: number_of_commits)
end
```

---

</details>
