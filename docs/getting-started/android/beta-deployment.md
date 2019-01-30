{!docs/includes/setup-fastlane-header.md!}

# Deploy to Beta distribution services using _fastlane_

If you would like to distribute your beta builds to Google Play, please make sure you've done the steps from [Setting up _supply_](setup/#setting-up-supply) before continuing.

# Building your app

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

# Uploading your app

After building your app, it's ready to be uploaded to a beta testing service of your choice. The beauty of _fastlane_ is that you can easily switch beta providers, or even upload to multiple at once, with a minimum of configuration. Follow that with a notification posted to the group messaging service of your choice to let the team know that you've shipped.

```ruby
lane :beta do
  gradle(task: 'assemble', build_type: 'Release')
  upload_to_play_store(track: 'beta')
  slack(message: 'Successfully distributed a new beta build')
end
```

## Supported beta testing services

<details>
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

<details>
<summary>Crashlytics</summary>

```ruby
lane :beta do
  # ...
  gradle(
    task: 'assemble',
    build_type: 'Release'
  )

  crashlytics(
    api_token: '[insert_key_here]',
    build_secret: '[insert_secret_here]'
  )
  # ...
end
```

To get your API token, open the [organizations settings page](https://www.fabric.io/settings/organizations) and click on the API key and build secret links.

Additionally you can specify `notes`, `emails`, `groups` and `notifications`. To get a list of all available options, run:

```no-highlight
fastlane action crashlytics
```

---
</details>

More information about additional supported beta testing services can be found in the [list of "Beta" actions](https://docs.fastlane.tools/actions/#beta)

# Release Notes

<details>
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

  crashlytics(
    api_token: '[insert_key_here]',
    build_secret: '[insert_secret_here]',
    notes: changelog
  )
end
```

---
</details>

<details>
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
