# iOS Beta deployment using fastlane

## Building your app

`fastlane` takes care of building your app using a feature called `gym`, just add the following to your `Fastfile`:

```
lane :beta do
  gym(scheme: "MyApp")
end
```

Additionally you can specify more options for building your app, for example

```ruby
lane :beta do
  gym(scheme: "MyApp",
      workspace: "Example.xcworkspace",
      include_bitcode: true)
end
```

Try running the lane using

```
fastlane beta
```

If everything works, you should have a `[ProductName].ipa` file in the current directory.

### Codesigning

Chances are that something went wrong because of code signing at the previous step. We prepared our own [Code Signing Guide](/codesigning/GettingStarted) that helps you setting up the right code signing approach for your project.

## Uploading your app

After building your app, it's ready to be uploaded to a beta testing service of your choice. The beauty of `fastlane` is that you can easily switch beta provider, or even upload to multiple at once, without any extra work.

All you have to do is to put the name of the beta testing provider of your choice after building the app using `gym`:

```ruby
lane :beta do
  match(type: "appstore")       # see code signing guide for more information
  gym(scheme: "MyApp")          # build your app
  testflight                    # upload your app to TestFlight
  slack(message: "Successfully distributed a new beta build")
end
```

`fastlane` automatically passes on information about the generated `.ipa` file from `gym` to the beta testing provider of your choice.

### Supported beta testing services


<details>
<summary>TestFlight</summary>

You can easily upload new builds to TestFlight (which is part of iTunes Connect) using `fastlane`. To do so, just use the built-in `testflight` action after building your app

```ruby
lane :beta do
  ...
  gym
  testflight
end
```

Some example use cases

```ruby
lane :beta do
  ...
  gym

  # Variant 1: Provide a changelog to your build
  testflight(changelog: "Add rocket emoji")

  # Variant 2: Skip the "Waiting for processing" of the binary
  #   While this will speed up your build, it will not distribute
  #   the binary to your tests, nor set a changelog
  testflight(skip_waiting_for_build_processing: true)
end
```

If you used `fastlane init` to setup `fastlane`, your Apple ID is stored in the `fastlane/Appfile`. You can also overwrite the username, using `testflight(username: "bot@fastlane.tools")`.

To get a list of all available options, run

```no-highlight
fastlane action testflight
```

With `fastlane`, you can also automatically manage your beta testers, check out TODO for more information.

---
</details>

<details>
<summary>Crashlytics</summary>

```ruby
lane :beta do
  ...
  gym
  crashlytics(api_token: "[insert_key_here]",
              build_secret: "[insert_key_here]")
end
```

To get your API token, open the [organizations settings page](https://www.fabric.io/settings/organizations) and click on the API key and build secret links. 


To get a list of all available options, run

```no-highlight
fastlane action testfairy
```

TODO: Also mention the other onboarding method

---
</details>

<details>
<summary>TestFairy</summary>

```ruby
lane :beta do
  ...
  gym

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
---
</details>


### Release Notes

<details>
<summary>Automatically based on git commits</summary>

Your changelog changes, so it doesn't make a lot of sense to store a static release note in the `Fastfile`.

```ruby
lane :beta do
  match
  gym

  changelog_from_git_commits # this will generate the changelog based on your last commits
  testflight
end
```

Get a list of all available options using `fastlane action changelog_from_git_commits`, here are some examples

```ruby
changelog_from_git_commits(
  between: ['7b092b3', 'HEAD'], # Optional, lets you specify a revision/tag range between which to collect commit info
  include_merges: true # Optional, lets you filter out merge commits
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
  changelog = prompt("Changelog: ")

  # Variant 2: Ask for a multi-line input
  #   The user confirms their input by typing `END` and Enter
  changelog = prompt(
    text: "Changelog: ",
    multi_line_end_keyword: "END"
  )

  match
  gym

  testflight(changelog: changelog)
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
  #   note the `..`, since fastlane runs in the `fastlane` directory
  changelog = File.read("../Changelog.txt")

  # Variant 2: Fetch data from a remote web server
  changelog = download(url: "https://lookatmycms.com/changelog.txt")

  match
  gym

  testflight(changelog: changelog)
end
```

---
</details>



TODO: Remove below

- Building your app (this is the same as [App Store deployment](appstore-deployment.md))
    - This also includes references to Code Signing
- List of supported beta testing services including potential plugins
- Best practises around how to do beta deployment
