# appstore


Alias for the deliver action







appstore |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



**1 Example**

```ruby
deliver(
  force: true, # Set to true to skip PDF verification
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)
```





**Parameters**

Key | Description
----|------------
  `username` | Your Apple ID Username
  `app_identifier` | The bundle identifier of your app
  `app` | The app ID of the app you want to use/modify
  `edit_live` | Modify live metadata, this option disables ipa upload and screenshot upload
  `ipa` | Path to your ipa file
  `pkg` | Path to your pkg file
  `platform` | The platform to use (optional)
  `metadata_path` | Path to the folder containing the metadata files
  `screenshots_path` | Path to the folder containing the screenshots
  `skip_binary_upload` | Skip uploading an ipa or pkg to iTunes Connect
  `skip_screenshots` | Don't upload the screenshots
  `app_version` | The version that should be edited or created
  `skip_metadata` | Don't upload the metadata (e.g. title, description). This will still upload screenshots
  `skip_app_version_update` | Don't update app version for submission
  `force` | Skip the HTML report file verification
  `submit_for_review` | Submit the new version for Review after uploading everything
  `automatic_release` | Should the app be automatically released once it's approved?
  `phased_release` | Enable the phased release feature of iTC
  `price_tier` | The price tier of this application
  `build_number` | If set the given build number (already uploaded to iTC) will be used instead of the current built one
  `app_rating_config_path` | Path to the app rating's config
  `submission_information` | Extra information for the submission (e.g. third party content)
  `team_id` | The ID of your iTunes Connect team if you're in multiple teams
  `team_name` | The name of your iTunes Connect team if you're in multiple teams
  `dev_portal_team_id` | The short ID of your Developer Portal team, if you're in multiple teams. Different from your iTC team ID!
  `dev_portal_team_name` | The name of your Developer Portal team if you're in multiple teams
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column
  `overwrite_screenshots` | Clear all previously uploaded screenshots before uploading the new ones
  `run_precheck_before_submit` | Run precheck before submitting to app review
  `precheck_default_rule_level` | The default rule level unless otherwise configured
  `app_icon` | Metadata: The path to the app icon
  `apple_watch_app_icon` | Metadata: The path to the Apple Watch app icon
  `copyright` | Metadata: The copyright notice
  `primary_category` | Metadata: The english name of the primary category (e.g. `Business`, `Books`)
  `secondary_category` | Metadata: The english name of the secondary category (e.g. `Business`, `Books`)
  `primary_first_sub_category` | Metadata: The english name of the primary first sub category (e.g. `Educational`, `Puzzle`)
  `primary_second_sub_category` | Metadata: The english name of the primary second sub category (e.g. `Educational`, `Puzzle`)
  `secondary_first_sub_category` | Metadata: The english name of the secondary first sub category (e.g. `Educational`, `Puzzle`)
  `secondary_second_sub_category` | Metadata: The english name of the secondary second sub category (e.g. `Educational`, `Puzzle`)
  `trade_representative_contact_information` | Metadata: A hash containing the trade representative contact information
  `app_review_information` | Metadata: A hash containing the review information
  `description` | Metadata: The localised app description
  `name` | Metadata: The localised app name
  `subtitle` | Metadata: The localised app subtitle
  `keywords` | Metadata: An array of localised keywords
  `promotional_text` | Metadata: An array of localised promotional texts
  `release_notes` | Metadata: Localised release notes for this version
  `privacy_url` | Metadata: Localised privacy url
  `support_url` | Metadata: Localised support url
  `marketing_url` | Metadata: Localised marketing url
  `languages` | Metadata: List of languages to activate
  `ignore_language_directory_validation` | Ignore errors when invalid languages are found in metadata and screeenshot directories




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action appstore
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appstore.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
