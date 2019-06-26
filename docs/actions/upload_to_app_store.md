<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_to_app_store.rb
-->

# upload_to_app_store


Upload metadata and binary to App Store Connect (via _deliver_)




<p align="center">
  <img src="/img/actions/deliver.png" width="250">
</p>

_deliver_ uploads screenshots, metadata and binaries to App Store Connect. Use _deliver_ to submit your app for App Store review.

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
- Upload hundreds of localized screenshots completely automatically
- Upload a new ipa/pkg file to App Store Connect without Xcode from any Mac
- Maintain your app metadata locally and push changes back to App Store Connect
- Easily implement a real Continuous Deployment process using [_fastlane_](https://fastlane.tools)
- Store the configuration in git to easily deploy from **any** Mac, including your Continuous Integration server
- Get a HTML preview of the fetched metadata before uploading the app metadata and screenshots to iTC
- Automatically uses [_precheck_](/actions/precheck/) to ensure your app has the highest chances of passing app review the first time

To upload builds to TestFlight check out [_pilot_](/actions/pilot/).

# Quick Start

The guide will create all the necessary files for you, using the existing app metadata from App Store Connect.

- `cd [your_project_folder]`
- `fastlane deliver init`
- Enter your App Store Connect credentials
- Enter your app identifier
- Enjoy a good drink, while the computer does all the work for you

From now on, you can run `fastlane deliver` to deploy a new update, or just upload new app metadata and screenshots.

# Usage

Check out your local `./fastlane/metadata` and `./fastlane/screenshots` folders (if you don't use [_fastlane_](https://fastlane.tools) it's `./metadata` instead)

![/img/actions/deliver_metadata.png](/img/actions/deliver_metadata.png)

You'll see your metadata from App Store Connect. Feel free to store the metadata in git (not the screenshots). You can now modify it locally and push the changes back to App Store Connect.

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

If you use [_fastlane_](https://fastlane.tools) you don't have to manually specify the path to your `ipa`/`pkg` file.

This is just a small sub-set of what you can do with _deliver_, check out the full documentation in [#more-options](#more-options)

Download existing screenshots from App Store Connect

```no-highlight
fastlane deliver download_screenshots
```

Download existing metadata from App Store Connect

```no-highlight
fastlane deliver download_metadata
```

To get a list of available options run

```no-highlight
fastlane action deliver
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
ipa("App.ipa")
```

if you use [_fastlane_](https://fastlane.tools) the ipa file will automatically be detected.

##### pkg
A path to a signed pkg file, which will be uploaded. Submission logic of ipa applies to pkg files.
```ruby-skip-tests
pkg("MacApp.pkg")
```

##### app_version

Optional, as it is usually automatically detected. Specify the version that should be created / edited on App Store Connect:

```ruby-skip-tests
app_version("2.0")
```

##### skip_app_version_update

In the case if _deliver_ uploads your application to App Store Connect it will automatically update "Prepare for submission" app version (which could be found on App Store Connect->My Apps->App Store page)

The option allows uploading your app without updating "Prepare for submission" version.

This could be useful in the case if you are generating a lot of uploads while not submitting the latest build for Apple review.

The default value is false.

```ruby-skip-tests
skip_app_version_update(true)
```

##### submit_for_review

Add this to your `Deliverfile` to automatically submit the app for review after uploading metadata/binary. This will select the latest build.

```ruby-skip-tests
submit_for_review(true)
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
force(true)
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

`is_displayed_on_app_store` is the option on App Store Connect described as: `Display Trade Representative Contact Information on the Korean App Store`

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

##### app_review_attachment_file
You can provide additional information to the app review team as a file attachment. As of this writing, Apple supports following file attachment formats: .pdf, .doc, .docx, .rtf, .pages, .xls, .xlsx, .numbers, .zip, .rar, .plist, .crash, .jpg, .png, .mp4, or .avi.

Provide an empty string (i.e. "", not null) to remove the existing attachment file (if any) from the review information being edited.

```ruby-skip-tests
app_review_attachment_file: "./readme.txt"
```

##### submission_information
Must be a hash. This is used as the last step for the deployment process, where you define if you use third party content or use encryption. [A list of available options](https://github.com/fastlane/fastlane/blob/master/spaceship/lib/spaceship/tunes/app_submission.rb).

```ruby-skip-tests
submission_information({
  add_id_info_serves_ads: true,
  ...
})
```

##### automatic_release
Should the app be released to all users once Apple approves it? If set to `false`, you'll have to manually release the update once it got approved.

```ruby-skip-tests
automatic_release(true)
# or
automatic_release(false)
```

##### phased_release

Enable or disable the phased releases feature of App Store Connect. If set to `true`, the update will be released over a 7 day period. Default behavior is to leave whatever you defined on App Store Connect.

```ruby-skip-tests
phased_release(true)
# or
phased_release(false)
```

##### reset_ratings

Reset your app's summary rating for all territories. If set to `true`, it will reset rating when this version is released. Default behavior is to keep existing rating.

```ruby-skip-tests
reset_ratings(true)
# or
reset_ratings(false)
```

##### app_rating_config_path
You can set the app age ratings using _deliver_. You'll have to create and store a `JSON` configuration file. Copy the [template](https://github.com/fastlane/fastlane/blob/master/deliver/assets/example_rating_config.json) to your project folder and pass the path to the `JSON` file using the `app_rating_config_path` option.

The keys/values on the top allow values from 0-2, and the items on the bottom allow only 0 or 1. More information in [#reference](#reference).


## Metadata

All options below are useful if you want to specify certain app metadata in your `Deliverfile` or `Fastfile`

### Localized

Localized values should be set like this

```ruby-skip-tests
description({
  'en-US' => "English Description here",
  'de-DE' => "Deutsche Beschreibung hier"
})
```

##### name
The title/name of the app

##### subtitle

Localized subtitle of the app

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

Localized promotional text

```ruby-skip-tests
promotional_text(
  "en-US" => "Hey, you should totally buy our app, it's the best",
  "de-DE" => "App kaufen bitte"
)
```

##### app_icon
A path to a new app icon, which must be exactly 1024x1024px
```ruby-skip-tests
app_icon('./AppIcon.png')
```

##### apple_watch_app_icon
A path to a new app icon for the  Watch, which must be exactly 1024x1024px
```ruby-skip-tests
apple_watch_app_icon('./AppleWatchAppIcon.png')
```

##### platform

The platform of your application (a.e. ios, osx).

This option is optional. The default value is "ios" and deliver should be able to figure out the platform from your binary.

However, in the case if multiple binaries present, you can specify a platform which you want to deliver explicitly.

The available options:

- 'ios'
- 'appletvos'
- 'osx'


### Non-Localized

##### copyright
The up to date copyright information.
```ruby-skip-tests
copyright("#{Time.now.year} Felix Krause")
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

# Submit Build
_deliver_ allows you to promote an existing build to production. Below are examples to select a previously uploaded build and submit it for review.

```no-highlight
fastlane deliver submit_build --build_number 830
```

### Submit build in a `Fastfile`

```ruby
lane :submit_review do
  deliver(
    build_number: '830',
    submit_for_review: true,
    automatic_release: true,
    force: true, # Skip HTMl report verification
    skip_metadata: true,
    skip_screenshots: true,
    skip_binary_upload: true
  )
end
```

Omit `build_number` to let _fastlane_ automatically select the latest build number for the current version being edited for release from App Store Connect.

### Compliance and IDFA settings

Use the `submission_information` parameter for additional submission specifiers, including compliance and IDFA settings. Look at the Spaceship's [`app_submission.rb`](https://github.com/fastlane/fastlane/blob/master/spaceship/lib/spaceship/tunes/app_submission.rb) file for options. See [this example](https://github.com/artsy/eigen/blob/faa02e2746194d8d7c11899474de9c517435eca4/fastlane/Fastfile#L131-L149).

# Credentials

A detailed description about how your credentials are handled is available in a [credentials_manager](https://github.com/fastlane/fastlane/tree/master/credentials_manager).

### How does this thing even work? Is magic involved? 🎩

Your password will be stored in the macOS keychain, but can also be passed using environment variables. (More information available on [CredentialsManager](https://github.com/fastlane/fastlane/tree/master/credentials_manager))

Before actually uploading anything to iTunes, _deliver_ will generate a HTML summary of the collected data.

_deliver_ uses the following techniques under the hood:

- The iTMSTransporter tool is used to upload the binary to App Store Connect. iTMSTransporter is a command line tool provided by Apple.
- For all metadata related actions _deliver_ uses [_spaceship_](https://github.com/fastlane/fastlane/tree/master/spaceship)

# Tips

## Available language codes
```no-highlight
ar-SA, ca, cs, da, de-DE, el, en-AU, en-CA, en-GB, en-US, es-ES, es-MX, fi, fr-CA, fr-FR, he, hi, hr, hu, id, it, ja, ko, ms, nl-NL, no, pl, pt-BR, pt-PT, ro, ru, sk, sv, th, tr, uk, vi, zh-Hans, zh-Hant
```

## Available Metadata Folder Options

_deliver_ allows for metadata to be set through `.txt` files in the metadata folder. This metadata folder location is defaulted to `./fastlane/metadata` but can be overridden through the `metadata_path` parameter. Below are all allowed metadata options.


### Non-Localized Metadata

Key | Editable While Live | Directory | Filename
----|--------|--------|--------
  `copyright` | Yes | `<metadata_path>` | `copyright.txt`
  `primary_category` | No | `<metadata_path>` | `primary_category.txt`
  `secondary_category` | No | `<metadata_path>` | `secondary_category.txt`
  `primary_first_sub_category` | No | `<metadata_path>` | `primary_first_sub_category.txt`
  `primary_second_sub_category` | No | `<metadata_path>` | `primary_second_sub_category.txt`
  `secondary_first_sub_category` | No | `<metadata_path>` | `secondary_first_sub_category.txt`
  `secondary_second_sub_category` | No | `<metadata_path>` | `secondary_second_sub_category.txt`


### Localized Metadata

Key | Editable While Live | Directory | Filename
----|--------|--------|--------
  `name` | No | `<metadata_path>/<lang>/` | `name.txt`
  `subtitle` | No | `<metadata_path>/<lang>/` | `subtitle.txt`
  `privacy_url` | Yes | `<metadata_path>/<lang>/` | `privacy_url.txt`
  `apple_tv_privacy_policy` | No | `<metadata_path>/<lang>/` | `apple_tv_privacy_policy.txt`
  `description` | Yes | `<metadata_path>/<lang>/` | `description.txt`
  `keywords` | No | `<metadata_path>/<lang>/` | `keywords.txt`
  `release_notes` | Yes | `<metadata_path>/<lang>/` | `release_notes.txt`
  `support_url` | Yes | `<metadata_path>/<lang>/` | `support_url.txt`
  `marketing_url` | Yes | `<metadata_path>/<lang>/` | `marketing_url.txt`
  `promotional_text` | Yes | `<metadata_path>/<lang>/` | `promotional_text.txt`


### Trade Representative Contact Information Metadata

Key | Editable While Live | Directory | Filename
----|--------|--------|--------
  `trade_name` | Yes | `<metadata_path>/trade_representative_contact_information` | `trade_name.txt`
  `first_name` | Yes | `<metadata_path>/trade_representative_contact_information` | `first_name.txt`
  `last_name` | Yes | `<metadata_path>/trade_representative_contact_information` | `last_name.txt`
  `address_line1` | Yes | `<metadata_path>/trade_representative_contact_information` | `address_line1.txt`
  `address_line2` | Yes | `<metadata_path>/trade_representative_contact_information` | `address_line2.txt`
  `address_line3` | Yes | `<metadata_path>/trade_representative_contact_information` | `address_line3.txt`
  `city_name` | Yes | `<metadata_path>/trade_representative_contact_information` | `city_name.txt`
  `state` | Yes | `<metadata_path>/trade_representative_contact_information` | `state.txt`
  `country` | Yes | `<metadata_path>/trade_representative_contact_information` | `country.txt`
  `postal_code` | Yes | `<metadata_path>/trade_representative_contact_information` | `postal_code.txt`
  `phone_number` | Yes | `<metadata_path>/trade_representative_contact_information` | `phone_number.txt`
  `email_address` | Yes | `<metadata_path>/trade_representative_contact_information` | `email_address.txt`
  `is_displayed_on_app_store` | Yes | `<metadata_path>/trade_representative_contact_information` | `is_displayed_on_app_store.txt`


### Review Information Metadata

Key | Editable While Live | Directory | Filename
----|--------|--------|--------
  `first_name` | Yes | `<metadata_path>/review_information` | `first_name.txt`
  `last_name` | Yes | `<metadata_path>/review_information` | `last_name.txt`
  `phone_number` | Yes | `<metadata_path>/review_information` | `phone_number.txt`
  `email_address` | Yes | `<metadata_path>/review_information` | `email_address.txt`
  `demo_user` | Yes | `<metadata_path>/review_information` | `demo_user.txt`
  `demo_password` | Yes | `<metadata_path>/review_information` | `demo_password.txt`
  `notes` | Yes | `<metadata_path>/review_information` | `notes.txt`


## Reference

<details>
<summary>View all available categories, etc.</summary>

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

Deliver has a special `default` language code which allows you to provide values that are not localized, and which will be used as defaults when you don’t provide a specific localized value.

In order to use `default`, you will need to tell _deliver_ which languages your app uses. You can do this in either of two ways:

1. Create the folders named with the language in the metadata folder (i.e. fastlane/metadata/en-US or fastlane/metadata/de-DE)
2. Add the following to your `Deliverfile` `languages(['en-US','de-DE'])`

You can use this either in json within your `Deliverfile` and/or as folders in your metadata folder. _deliver_ will take the union of both language sets from the `Deliverfile` and from the metadata folder and create on single set of languages which will be enabled.

Imagine that you have localized data for the following language codes:  ```en-US, de-DE, el, it```

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

In this case, default values for keywords, urls, name and release notes are used in all localizations, but each language has a fully localized description

## Uploading screenshots for "iPad Pro (12.9-inch) (3rd generation)"

[Starting March 20, 2019 Apple's App Store](https://developer.apple.com/news/?id=03202019a) requires 12.9-inch iPad Pro (3rd generation) screenshots additionally to the iPad Pro 2nd generation [screenshots](https://help.apple.com/app-store-connect/#/devd274dd925). As fastlane historically uses the screenshot dimensions to determine the "display family" of a screenshot, this poses a problem as both use the same dimensions and are recognized as the same device family.

To solve this a screenshot of a 12.9-inch iPad Pro (3rd generation) must contain either the string `iPad Pro (12.9-inch) (3rd generation)` or `ipadPro129` (Apple's internal naming of the display family for the 3rd generation iPad Pro) in its filename to be assigned the correct display family and to be uploaded to the correct screenshot slot in your app's metadata.

## Automatically create screenshots

If you want to integrate _deliver_ with [_snapshot_](https://docs.fastlane.tools/actions/snapshot/), check out [_fastlane_](https://fastlane.tools)!

## Jenkins integration
Detailed instructions about how to set up _deliver_ and _fastlane_ in `Jenkins` can be found in the [fastlane README](https://docs.fastlane.tools/best-practices/continuous-integration/#jenkins-integration).

## Firewall Issues

_deliver_ uses the iTunes Transporter to upload metadata and binaries. In case you are behind a firewall, you can specify a different transporter protocol using

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV" fastlane deliver
```

## HTTP Proxy
iTunes Transporter is a Java application bundled with Xcode. In addition to utilizing the `DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV"`, you need to configure the transporter application to use the proxy independently from the system proxy or any environment proxy settings. You can find the configuration file within Xcode:

```no-highlight
TOOLS_PATH=$( xcode-select -p )
REL_PATH='../Applications/Application Loader.app/Contents/itms/java/lib/net.properties'
echo "$TOOLS_PATH/$REL_PATH"
```

Add necessary proxy configuration values to the net.properties according to [Java Proxy Configuration](http://docs.oracle.com/javase/8/docs/technotes/guides/net/proxies.html).

As an alternative to editing the properties files, proxy configuration can be specified on the command line directly:

```no-highlight
DELIVER_ITMSTRANSPORTER_ADDITIONAL_UPLOAD_PARAMETERS="-t DAV -Dhttp.proxyHost=myproxy.com -Dhttp.proxyPort=8080"
```

## Limit
App Store Connect has a limit of 150 binary uploads per day.

## Editing the `Deliverfile`
Change syntax highlighting to *Ruby*.

## Provider Short Name
If you are on multiple App Store Connect teams, _deliver_ needs a provider short name to know where to upload your binary. _deliver_ will try to use the long name of the selected team to detect the provider short name. To override the detected value with an explicit one, use the `itc_provider` option.

<hr />


upload_to_app_store ||
---|---
Supported platforms | ios, mac
Author | @KrauseFx



## 3 Examples

```ruby
upload_to_app_store(
  force: true, # Set to true to skip PDF verification
  itc_provider: "abcde12345" # pass a specific value to the iTMSTransporter -itc_provider option
)
```

```ruby
deliver   # alias for "upload_to_app_store"
```

```ruby
appstore  # alias for "upload_to_app_store"
```





## Parameters

Key | Description | Default
----|-------------|--------
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `app_identifier` | The bundle identifier of your app | [*](#parameters-legend-dynamic)
  `app_version` | The version that should be edited or created | 
  `ipa` | Path to your ipa file | [*](#parameters-legend-dynamic)
  `pkg` | Path to your pkg file | [*](#parameters-legend-dynamic)
  `build_number` | If set the given build number (already uploaded to iTC) will be used instead of the current built one | 
  `platform` | The platform to use (optional) | `ios`
  `edit_live` | Modify live metadata, this option disables ipa upload and screenshot upload | `false`
  `use_live_version` | Force usage of live version rather than edit version | `false`
  `metadata_path` | Path to the folder containing the metadata files | 
  `screenshots_path` | Path to the folder containing the screenshots | 
  `skip_binary_upload` | Skip uploading an ipa or pkg to App Store Connect | `false`
  `skip_screenshots` | Don't upload the screenshots | `false`
  `skip_metadata` | Don't upload the metadata (e.g. title, description). This will still upload screenshots | `false`
  `skip_app_version_update` | Don't update app version for submission | `false`
  `force` | Skip the HTML report file verification | `false`
  `overwrite_screenshots` | Clear all previously uploaded screenshots before uploading the new ones | `false`
  `submit_for_review` | Submit the new version for Review after uploading everything | `false`
  `reject_if_possible` | Rejects the previously submitted build if it's in a state where it's possible | `false`
  `automatic_release` | Should the app be automatically released once it's approved? | `false`
  `auto_release_date` | Date in milliseconds for automatically releasing on pending approval | 
  `phased_release` | Enable the phased release feature of iTC | `false`
  `reset_ratings` | Reset the summary rating when you release a new version of the application | `false`
  `price_tier` | The price tier of this application | 
  `app_rating_config_path` | Path to the app rating's config | 
  `submission_information` | Extra information for the submission (e.g. compliance specifications, IDFA settings) | 
  `team_id` | The ID of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your App Store Connect team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `dev_portal_team_id` | The short ID of your Developer Portal team, if you're in multiple teams. Different from your iTC team ID! | [*](#parameters-legend-dynamic)
  `dev_portal_team_name` | The name of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `itc_provider` | The provider short name to be used with the iTMSTransporter to identify your team. This value will override the automatically detected provider short name. To get provider short name run `pathToXcode.app/Contents/Applications/Application\ Loader.app/Contents/itms/bin/iTMSTransporter -m provider -u 'USERNAME' -p 'PASSWORD' -account_type itunes_connect -v off`. The short names of providers should be listed in the second column | 
  `run_precheck_before_submit` | Run precheck before submitting to app review | `true`
  `precheck_default_rule_level` | The default precheck rule level unless otherwise configured | `:warn`
  `individual_metadata_items` | An array of localized metadata items to upload individually by language so that errors can be identified. E.g. ['name', 'keywords', 'description']. Note: slow | `[]`
  `app_icon` | Metadata: The path to the app icon | 
  `apple_watch_app_icon` | Metadata: The path to the Apple Watch app icon | 
  `copyright` | Metadata: The copyright notice | 
  `primary_category` | Metadata: The english name of the primary category (e.g. `Business`, `Books`) | 
  `secondary_category` | Metadata: The english name of the secondary category (e.g. `Business`, `Books`) | 
  `primary_first_sub_category` | Metadata: The english name of the primary first sub category (e.g. `Educational`, `Puzzle`) | 
  `primary_second_sub_category` | Metadata: The english name of the primary second sub category (e.g. `Educational`, `Puzzle`) | 
  `secondary_first_sub_category` | Metadata: The english name of the secondary first sub category (e.g. `Educational`, `Puzzle`) | 
  `secondary_second_sub_category` | Metadata: The english name of the secondary second sub category (e.g. `Educational`, `Puzzle`) | 
  `trade_representative_contact_information` | Metadata: A hash containing the trade representative contact information | 
  `app_review_information` | Metadata: A hash containing the review information | 
  `app_review_attachment_file` | Metadata: Path to the app review attachment file | 
  `description` | Metadata: The localised app description | 
  `name` | Metadata: The localised app name | 
  `subtitle` | Metadata: The localised app subtitle | 
  `keywords` | Metadata: An array of localised keywords | 
  `promotional_text` | Metadata: An array of localised promotional texts | 
  `release_notes` | Metadata: Localised release notes for this version | 
  `privacy_url` | Metadata: Localised privacy url | 
  `apple_tv_privacy_policy` | Metadata: Localised Apple TV privacy policy text | 
  `support_url` | Metadata: Localised support url | 
  `marketing_url` | Metadata: Localised marketing url | 
  `languages` | Metadata: List of languages to activate | 
  `ignore_language_directory_validation` | Ignore errors when invalid languages are found in metadata and screenshot directories | `false`
  `precheck_include_in_app_purchases` | Should precheck check in-app purchases? | `true`
  `app` | The (spaceship) app ID of the app you want to use/modify | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action upload_to_app_store
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run upload_to_app_store
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run upload_to_app_store parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/upload_to_app_store.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
