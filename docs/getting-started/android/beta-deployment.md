{!docs/includes/setup-fastlane-header.md!}

# Deploy to Beta distribution services using _fastlane_

If you would like to distribute your beta builds to Google Play, please make sure you've done the steps from [Setting up _supply_](../setup/#setting-up-supply) before continuing.

## Building your app

_fastlane_ takes care of building your app by delegating to your existing Gradle build. Just add the following to your `Fastfile`:

```ruby
lane :beta do
  # Adjust the `build_type` and `flavor` params as needed to build the right APK for your setup
  gradle(
    task: 'assemble',
    build_type: 'Release'
  )

  # ...
end
```

Try running the lane with:

```no-highlight
fastlane beta
```

When that completes you should have the appropriate APK ready to go in the standard output directory.

To get a list of all available parameters for the `gradle` action, run:

```no-highlight
fastlane action gradle
```

## Uploading your app

After building your app, it's ready to be uploaded to a beta testing service of your choice. The beauty of _fastlane_ is that you can easily switch beta providers, or even upload to multiple at once, with a minimum of configuration. Follow that with a notification posted to the group messaging service of your choice to let the team know that you've shipped.

```ruby
lane :beta do
  gradle(task: 'assemble', build_type: 'Release')
  upload_to_play_store(track: 'beta')
  slack(message: 'Successfully distributed a new beta build')
end
```

### Supported beta testing services

<details markdown="1">
<summary>Google Play</summary>

In order to distribute to Google Play with _upload_to_play_store_ you will need to have your Google credentials set up. Make sure you've gone through [Setting up _supply_](setup/#setting-up-supply) before continuing!

```ruby
lane :beta do
  # ...
  gradle(
    task: 'assemble',
    build_type: 'Release'
  )
  upload_to_play_store(track: 'beta')
  # ...
end
```

To get a list of all available options, run:

```no-highlight
fastlane action upload_to_play_store
```

---
</details>

<details markdown="1">
<summary>Firebase App Distribution</summary>

Install the Firebase App Distribution plugin:

```no-highlight
fastlane add_plugin firebase_app_distribution
```

Authenticate with Firebase by running the `firebase_app_distribution_login` action (or using one of the other [authentication methods](https://firebase.google.com/docs/app-distribution/android/distribute-fastlane#step_2_authenticate_with_firebase)):

```no-highlight
fastlane run firebase_app_distribution_login
```

Then add the `firebase_app_distribution` action to your lane:

```ruby
lane :beta do
  # ...
  gradle(
    task: 'assemble',
    build_type: 'Release'
  )

  firebase_app_distribution(
    app: "1:123456789:android:abcd1234",
    groups: "qa-team, trusted-testers"
  )
  # ...
end
```

For more information and options (such as adding release notes) see the full [Getting Started](https://firebase.google.com/docs/app-distribution/android/distribute-fastlane) guide.

---
</details>

More information about additional supported beta testing services can be found in the [list of "Beta" actions](https://docs.fastlane.tools/actions/#beta)

## Release Notes

<details markdown="1">
<summary>Generate based on Git commits</summary>

You take the time to write great Git commit messages, right? Why not take advantage of them to automatically summarize the work done for your latest beta release?

```ruby
lane :beta do
  # ...

  # Generate the changelog based on commit messages since your last tag
  changelog_from_git_commits

  # The crashlytics action knows how to use the generated changelog automatically
  crashlytics(
    api_token: '[insert_key_here]',
    build_secret: '[insert_secret_here]'
  )
end
```

You can get a list of all available options by running `fastlane action changelog_from_git_commits`, but here are some examples:

```ruby
changelog_from_git_commits(
  between: ['7b092b3', 'HEAD'], # Optional, lets you specify a revision/tag range between which to collect commit info
  merge_commit_filtering: 'exclude_merges' # Optional, lets you filter out merge commits
)
```
---
</details>

<details markdown="1">
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

  crashlytics(
    api_token: '[insert_key_here]',
    build_secret: '[insert_secret_here]',
    notes: changelog
  )
end
```

---
</details>

<details markdown="1">
<summary>Fetch the changelog from the file system or remote server</summary>

You can fetch values from anywhere, including the file system and remote server, by writing code in your `Fastfile`

```ruby
lane :beta do
  # Variant 1: Read from file system
  #   note the `..`, since fastlane runs in the _fastlane_ directory
  changelog = File.read("../Changelog.txt")

  # Variant 2: Fetch data from a remote web server
  changelog = download(url: "https://lookatmycms.com/changelog.txt")

  crashlytics(
    api_token: '[insert_key_here]',
    build_secret: '[insert_secret_here]',
    notes: changelog
  )
end
```

---
</details>
