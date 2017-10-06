# deliver


Uses deliver to upload new app metadata and builds to iTunes Connect




<p align="center">
  <img src="/img/actions/deliver.png" width="250">
</p>

_deliver_ uploads screenshots, metadata and binaries to iTunes Connect. Use _deliver_ to submit your app for App Store review.

-------

<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#quick-start">Quick Start</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#tips">Tips</a>
</p>

-------

<h5 align="center"><code>deliver</code> is part of <a href="https://fastlane.tools">fastlane</a>: The easiest way to automate beta deployments and releases for your iOS and Android apps.</h5>

# Features
- Upload hundreds of localised screenshots completely automatically
- Upload a new ipa/pkg file to iTunes Connect without Xcode from any Mac
- Maintain your app metadata locally and push changes back to iTunes Connect
- Easily implement a real Continuous Deployment process using [fastlane](https://fastlane.tools)
- Store the configuration in git to easily deploy from **any** Mac, including your Continuous Integration server
- Get a HTML preview of the fetched metadata before uploading the app metadata and screenshots to iTC
- Automatically uses [precheck](/actions/precheck) to ensure your app has the highest chances of passing app review the first time

To upload builds to TestFlight check out [pilot](/actions/pilot).

# Quick Start

The guide will create all the necessary files for you, using the existing app metadata from iTunes Connect.

- ```cd [your_project_folder]```
- ```fastlane deliver init```
- Enter your iTunes Connect credentials
- Enter your app identifier
- Enjoy a good drink, while the computer does all the work for you

From now on, you can run `fastlane deliver` to deploy a new update, or just upload new app metadata and screenshots.

# Usage

Check out your local `./fastlane/metadata` and `./fastlane/screenshots` folders (if you don't use [fastlane](https://fastlane.tools) it's `./metadata` instead)

![/img/actions/deliver_metadata.png](/img/actions/deliver_metadata.png)

You'll see your metadata from iTunes Connect. Feel free to store the metadata in git (not the screenshots). You can now modify it locally and push the changes back to iTunes Connect.

Run `fastlane deliver` to upload the app metadata from your local machine

```no-highlight
fastlane deliver
```

Provide the path to an `ipa` file to upload and submit your app for review:

```no-highlight
fastlane deliver --ipa "App.ipa" --submit_for_review
```

or you can specify path to `pkg` file for macOS apps:

```no-highlight
fastlane deliver --pkg "MacApp.pkg"
```

If you use [fastlane](https://fastlane.tools) you don't have to manually specify the path to your `ipa`/`pkg` file.

This is just a small sub-set of what you can do with _deliver_, check out the full documentation in [#more-options](#more-options)

Download existing screenshots from iTunes Connect

```no-highlight
fastlane deliver download_screenshots
```

Download existing metadata from iTunes Connect

```no-highlight
fastlane deliver download_metadata
```

To get a list of available options run

```no-highlight
fastlane action deliver
```

Select a previously uploaded build and submit it for review.

```no-highlight
fastlane deliver submit_build --build_number 830
```

### Use in a `Fastfile`

```ruby
deliver
```

```ruby
deliver(
  submit_for_review: true,
  force: true,
  metadata_path: "./metadata"
)
```

## More options

<details>
<summary>View all available options and their valid values</summary>

## Available options

All the options below can easily be added to your `Deliverfile`. The great thing: if you use _fastlane_ you can use all these options from your `Fastfile` too, for example:

```ruby
deliver(
  submit_for_review: true,
  metadata_path: "../folder"
)
```

##### app_identifier
The bundle identifier (e.g. "com.krausefx.app")

##### username
Your Apple ID email address

##### ipa
A path to a signed ipa file, which will be uploaded. If you don't provide this value, only app metadata will be uploaded. If you want to submit the app for review make sure to either use `fastlane deliver --submit_for_review` or add `submit_for_review true` to your `Deliverfile`

```ruby-skip-tests
ipa "App.ipa"
```

if you use [fastlane](https://fastlane.tools) the ipa file will automatically be detected.

##### pkg
A path to a signed pkg file, which will be uploaded. Submission logic of ipa applies to pkg files.
```ruby-skip-tests
pkg "MacApp.pkg"
```

##### app_version

Optional, as it is usually automatically detected. Specify the version that should be created / edited on iTunes Connect:

```ruby-skip-tests
app_version "2.0"
```

##### skip_app_version_update

In the case if _deliver_ uploads your application to iTunes Connect it will automatically update "Prepare for submission" app version (which could be found on iTunes Connect->My Apps->App Store page)

The option allows uploading your app without updating "Prepare for submission" version. 

This could be useful in the case if you are generating a lot of uploads while not submitting the latest build for Apple review.

The default value is false.

```ruby-skip-tests
skip_app_version_update true
```

##### submit_for_review

Add this to your `Deliverfile` to automatically submit the app for review after uploading metadata/binary. This will select the latest build.

```ruby-skip-tests
submit_for_review true
```

##### screenshots_path
A path to a folder containing subfolders for each language. This will automatically detect the device type based on the image resolution. Also includes  Watch Support.

![/img/actions/deliver_screenshots.png](/img/actions/deliver_screenshots.png)

##### metadata_path
Path to the metadata you want to use. The folder has to be structured like this

![/img/actions/deliver_metadata.png](/img/actions/deliver_metadata.png)

If you run `deliver init` this will automatically be created for you.

##### force

```ruby-skip-tests
force true
```
If set to `true`, no HTML report will be generated before the actual upload. You can also pass `--force` when calling _deliver_.


##### price_tier
Pass the price tier as number. This will be active from the current day.
```ruby-skip-tests
price_tier 0
```
##### trade_representative_contact_information
Trade Representative Contact information for Korean App Store. Available options: `first_name`, `last_name`, `address_line1`, `address_line2`, `address_line3`, `city_name`, `state`, `country`, `postal_code`, `phone_number`, `email_address`, `is_displayed_on_app_store`.


```ruby-skip-tests
trade_representative_contact_information(
  first_name: "Felix",
  last_name: "Krause",
  address_line1: "1 Infinite Loop",
  address_line2: "",
  address_line3: null,
  city_name: "Cupertino",
  state: "California",
  country: "United States",
  postal_code: "95014",
  phone_number: "+43 123123123",
  email_address: "github@krausefx.com",
)
```

You can also provide these values by creating files in a `metadata/trade_representative_contact_information/` directory. The file names must match the pattern `<key>.txt` (e.g. `first_name.txt`, `address_line1.txt` etc.). The contents of each file will be used as the value for the matching key. Values provided in the `Deliverfile` or `Fastfile` will be take priority over values from these files.

`is_displayed_on_app_store` is the option on iTunes Connect described as: `Display Trade Representative Contact Information on the Korean App Store`

##### app_review_information
Contact information for the app review team. Available options: `first_name`, `last_name`, `phone_number`, `email_address`, `demo_user`, `demo_password`, `notes`. 


```ruby-skip-tests
app_review_information(
  first_name: "Felix",
  last_name: "Krause",
  phone_number: "+43 123123123",
  email_address: "github@krausefx.com",
  demo_user: "demoUser",
  demo_password: "demoPass",
  notes: "such notes, very text"
)
```

You can also provide these values by creating files in a `metadata/review_information/` directory. The file names must match the pattern `<key>.txt` (e.g. `first_name.txt`, `notes.txt` etc.). The contents of each file will be used as the value for the matching key. Values provided in the `Deliverfile` or `Fastfile` will be take priority over values from these files.

##### submission_information 
Must be a hash. This is used as the last step for the deployment process, where you define if you use third party content or use encryption. [A list of available options](https://github.com/fastlane/fastlane/blob/master/spaceship/lib/spaceship/tunes/app_submission.rb#L18-L69).

```ruby-skip-tests
submission_information({
  add_id_info_serves_ads: true,
  ...
})
```

##### automatic_release
Should the app be released to all users once Apple approves it? If set to `false`, you'll have to manually release the update once it got approved.

```ruby-skip-tests
automatic_release true
# or 
automatic_release false
```

##### phased_release

Enable or disable the phased releases feature of iTunes Connect. If set to `true`, the update will be released over a 7 day period. Default behavior is to leave whatever you defined on iTunes Connect.

```ruby-skip-tests
phased_release true
# or 
phased_release false
```

##### app_rating_config_path
You can set the app age ratings using _deliver_. You'll have to create and store a `JSON` configuration file. Copy the [template](https://github.com/fastlane/fastlane/blob/master/deliver/assets/example_rating_config.json) to your project folder and pass the path to the `JSON` file using the `app_rating_config_path` option. 

The keys/values on the top allow values from 0-2, and the items on the bottom allow only 0 or 1. More information in [#reference](#reference).


## Metadata

All options below are useful if you want to specify certain app metadata in your `Deliverfile` or `Fastfile`

### Localised

Localised values should be set like this

```ruby-skip-tests
description({
  'en-US' => "English Description here",
  'de-DE' => "Deutsche Beschreibung hier"
})
```

##### name
The title/name of the app

##### subtitle

Localised subtitle of the app

```ruby-skip-tests
subtitle(
  "en-US" => "Awesome English subtitle here",
  "de-DE" => "Jetzt mit deutschen Untertiteln!"
)
```

##### description
The description of the app

##### release_notes
The release_notes (What's new / Changelog) of the latest version

##### support_url, marketing_url, privacy_url
These URLs are shown in the AppStore

##### keywords

Keywords separated using a comma.

```ruby-skip-tests
keywords(
  "en-US" => "Keyword1, Keyword2"
)
```

##### promotional_text

Localised promotional text

```ruby-skip-tests
promotional_text(
  "en-US" => "Hey, you should totally buy our app, it's the best",
  "de-DE" => "App kaufen bitte"
)
```

##### app_icon
A path to a new app icon, which must be exactly 1024x1024px
```ruby-skip-tests
app_icon './AppIcon.png'
```

##### apple_watch_app_icon
A path to a new app icon for the  Watch, which must be exactly 1024x1024px
```ruby-skip-tests
apple_watch_app_icon './AppleWatchAppIcon.png'
```

##### platform

The platform of your application (a.e. ios, osx). 

This option is optional. The default value is "ios" and deliver should be able to figure out the platform from your binary.

However, in the case if multiple binaries present, you can specify a platform which you want to deliver explicitly.

The available options: 

- 'ios'
- 'appletvos'
- 'osx'


### Non-Localised

##### copyright
The up to date copyright information.
```ruby-skip-tests
copyright "#{Time.now.year} Felix Krause"
```

##### primary_category
The english name of the category you want to set (e.g. `Business`, `Books`)

See [#reference](#reference) for a list of available categories

##### secondary_category
The english name of the secondary category you want to set

##### primary_first_sub_category
The english name of the primary first sub category you want to set

##### primary_second_sub_category
The english name of the primary second sub category you want to set

##### secondary_first_sub_category
The english name of the secondary first sub category you want to set

##### secondary_second_sub_category
The english name of the secondary second sub category you want to set
</details>

# Credentials

A detailed description about how your credentials are handled is available in a [credentials_manager](https://github.com/fastlane/fastlane/tree/master/credentials_manager).

### How does this thing even work? Is magic involved? 🎩

Your password will be stored in the macOS keychain, but can also be passed using environment variables. (More information available on [CredentialsManager](https://github.com/fastlane/fastlane/tree/master/credentials_manager))

Before actually uploading anything to iTunes, _deliver_ will generate a HTML summary of the collected data.

_deliver_ uses the following techniques under the hood:

- The iTMSTransporter tool is used to upload the binary to iTunes Connect. iTMSTransporter is a command line tool provided by Apple.
- For all metadata related actions _deliver_ uses [spaceship](https://github.com/fastlane/fastlane/tree/master/spaceship)

# Tips

## Available language codes
```no-highlight
no, en-US, en-CA, fi, ru, zh-Hans, nl-NL, zh-Hant, en-AU, id, de-DE, sv, ko, ms, pt-BR, el, es-ES, it, fr-CA, es-MX, pt-PT, vi, th, ja, fr-FR, da, tr, en-GB
```

## Reference

<details>
<summary>View all available categories, languages, etc.</summary>

### Available Categories

You can always prefix the category using `MZGenre.` (e.g. `MZGenre.Book`). _deliver_ supports both notations.

- `Book`
- `Business`
- `Apps.Catalogs`
- `Education`
- `Entertainment`
- `Finance`
- `Apps.Food_Drink`
- `Games`
- `Healthcare_Fitness`
- `Lifestyle`
- `Medical`
- `Music`
- `Navigation`
- `News`
- `Apps.Newsstand`
- `Photography`
- `Productivity`
- `Reference`
- `Apps.Shopping`
- `SocialNetworking`
- `Sports`
- `Stickers`
- `Travel`
- `Utilities`
- `Weather`

### Available Game Subcategories

- `MZGenre.Action`
- `MZGenre.Adventure`
- `MZGenre.Arcade`
- `MZGenre.Board`
- `MZGenre.Card`
- `MZGenre.Casino`
- `MZGenre.Dice`
- `MZGenre.Educational`
- `MZGenre.Family`
- `MZGenre.Music`
- `MZGenre.Puzzle`
- `MZGenre.Racing`
- `MZGenre.RolePlaying`
- `MZGenre.Simulation`
- `MZGenre.Sports`
- `MZGenre.Strategy`
- `MZGenre.Trivia`
- `MZGenre.Word`

### Available Magazines & Newspapers Subcategories

- `MZGenre.Apps.Arts_Photography`
- `MZGenre.Apps.Automotive`
- `MZGenre.Apps.Brides_Weddings`
- `MZGenre.Apps.Business_Investing`
- `MZGenre.Apps.Childrens_Magazines`
- `MZGenre.Apps.Computers_Internet`
- `MZGenre.Apps.Cooking_Food_Drink`
- `MZGenre.Apps.Crafts_Hobbies`
- `MZGenre.Apps.Electronics_Audio`
- `MZGenre.Apps.Entertainment`
- `MZGenre.Apps.Fashion_Style`
- `MZGenre.Apps.Health_Mind_Body`
- `MZGenre.Apps.History`
- `MZGenre.Apps.Home_Garden`
- `MZGenre.Apps.Literary_Magazines_Journals`
- `MZGenre.Apps.Mens_Interest`
- `MZGenre.Apps.Movies_Music`
- `MZGenre.Apps.News_Politics`
- `MZGenre.Apps.Outdoors_Nature`
- `MZGenre.Apps.Parenting_Family`
- `MZGenre.Apps.Pets`
- `MZGenre.Apps.Professional_Trade`
- `MZGenre.Apps.Regional_News`
- `MZGenre.Apps.Science`
- `MZGenre.Apps.Sports_Leisure`
- `MZGenre.Apps.Teens`
- `MZGenre.Apps.Travel_Regional`
- `MZGenre.Apps.Womens_Interest`

### Available Stickers Subcategories

- `MZGenre.Apps.Stickers.Animals`
- `MZGenre.Apps.Stickers.Art`
- `MZGenre.Apps.Stickers.BirthdaysAndCelebrations`
- `MZGenre.Apps.Stickers.Celebrities`
- `MZGenre.Apps.Stickers.Characters`
- `MZGenre.Apps.Stickers.FoodAndDrink`
- `MZGenre.Apps.Stickers.Emotions`
- `MZGenre.Apps.Stickers.Fashion`
- `MZGenre.Apps.Stickers.Games`
- `MZGenre.Apps.Stickers.KidsAndFamily`
- `MZGenre.Apps.Stickers.MoviesAndTV`
- `MZGenre.Apps.Stickers.Music`
- `MZGenre.Apps.Stickers.People`
- `MZGenre.Apps.Stickers.Places`
- `MZGenre.Apps.Stickers.Sports`

### Available Languages

- `da`
- `de-DE`
- `el`
- `en-AU`
- `en-CA`
- `en-GB`
- `en-US`
- `es-ES`
- `es-MX`
- `fi`
- `fr-CA`
- `fr-FR`
- `id`
- `it`
- `ja`
- `ko`
- `ms`
- `nl-NL`
- `no`
- `pt-BR`
- `pt-PT`
- `ru`
- `sv`
- `th`
- `tr`
- `vi`
- `zh-Hans`
- `zh-Hant`

### Available age rating groups

#### Non Boolean

**Values**

- 0: None
- 1: Infrequent/Mild
- 2: Frequent/Intense

**Keys**

- `CARTOON_FANTASY_VIOLENCE`
- `REALISTIC_VIOLENCE`
- `PROLONGED_GRAPHIC_SADISTIC_REALISTIC_VIOLENCE`
- `PROFANITY_CRUDE_HUMOR`
- `MATURE_SUGGESTIVE`
- `HORROR`
- `MEDICAL_TREATMENT_INFO`
- `ALCOHOL_TOBACCO_DRUGS`
- `GAMBLING`
- `SEXUAL_CONTENT_NUDITY`
- `GRAPHIC_SEXUAL_CONTENT_NUDITY`

#### Boolean

**Keys**

- `UNRESTRICTED_WEB_ACCESS`
- `GAMBLING_CONTESTS`
</details>

<br />

## Default values

Deliver has a special `default` language code which allows you to provide values that are not localised, and which will be used as defaults when you don’t provide a specific localised value.

In order to use `default`, you will need to tell _deliver_ which languages your app uses. You can do this in either of two ways:
1. Create the folders named with the language in the metadata folder (i.e. fastlane/metadata/en-US or fastlane/metadata/de-DE)
2. Add the following to your `Deliverfile` `languages(['en-US','de-DE'])` 

You can use this either in json within your `Deliverfile` and/or as folders in your metadata folder. _deliver_ will take the union of both language sets from the `Deliverfile` and from the metadata folder and create on single set of languages which will be enabled.

Imagine that you have localised data for the following language codes:  ```en-US, de-DE, el, it```

You can set the following in your `Deliverfile`

```ruby-skip-tests
release_notes({
  'default' => "Shiny and new",
  'de-DE' => "glaenzend und neu"
})
```

Deliver will use "Shiny and new" for en-US, el and it.

It will use "glaenzend und neu" for de-DE.

You can do the same with folders

```
   default
      keywords.txt
      marketing_url.txt
      name.txt
      privacy_url.txt
      support_url.txt
      release_notes.txt
   en-US
      description.txt
   de-DE
      description.txt
   el
      description.txt
   it
      description.txt
```

In this case, default values for keywords, urls, name and release notes are used in all localisations, but each language has a fully localised description



## Automatically create screenshots

If you want to integrate _deliver_ with [snapshot](https://github.com/fastlane/fastlane/tree/master/snapshot), check out [fastlane](https://fastlane.tools)!

## Jenkins integration
Detailed instructions about how to set up _deliver_ and _fastlane_ in `Jenkins` can be found in the [fastlane README](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Jenkins.md).

## Firewall Issues

_deliver_ uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol using

```
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" fastlane deliver
```

## HTTP Proxy
iTunes Transporter is a Java application bundled with Xcode. In addition to utilizing the `DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV"`, you need to configure the transporter application to use the proxy independently from the system proxy or any environment proxy settings. You can find the configuration file within Xcode:

```bash
TOOLS_PATH=$( xcode-select -p )
REL_PATH='../Applications/Application Loader.app/Contents/itms/java/lib/net.properties'
echo "$TOOLS_PATH/$REL_PATH"
```

Add necessary proxy configuration values to the net.properties according to [Java Proxy Configuration](http://docs.oracle.com/javase/8/docs/technotes/guides/net/proxies.html).

As an alternative to editing the properties files, proxy configuration can be specified on the command line directly:

```bash
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV -Dhttp.proxyHost=myproxy.com -Dhttp.proxyPort=8080"
```

## Limit
iTunes Connect has a limit of 150 binary uploads per day.

## Editing the `Deliverfile`
Change syntax highlighting to *Ruby*.

<hr />


deliver |
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
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team
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
fastlane action deliver
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/deliver.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
