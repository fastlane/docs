<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# supply


Alias for the `upload_to_play_store` action




<p align="center">
  <img src="/img/actions/supply.png" width="250">
</p>

###### Command line tool for updating Android apps and their metadata on the Google Play Store

_supply_ uploads app metadata, screenshots and binaries to Google Play. You can also select tracks for builds and promote builds to production.

-------

<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#setup">Setup</a> &bull;
    <a href="#quick-start">Quick Start</a> &bull;
    <a href="#available-commands">Commands</a> &bull;
    <a href="#uploading-an-apk">Uploading an APK</a> &bull;
    <a href="#images-and-screenshots">Images</a>
</p>

-------

## Features
- Update existing Android applications on Google Play via the command line
- Upload new builds (APKs)
- Retrieve and edit metadata, such as title and description, for multiple languages
- Upload the app icon, promo graphics and screenshots for multiple languages
- Have a local copy of the metadata in your git repository
- Retrieve version code numbers from existing Google Play tracks


## Setup

Setup consists of setting up your Google Developers Service Account

1. Open the [Google Play Console](https://play.google.com/apps/publish/)
1. Select **Settings** tab, followed by the **API access** tab
1. Click the **Create Service Account** button and follow the **Google API Console** link in the dialog
1. Click the **Create Service account** button at the top of the developers console screen
1. Provide a name for the service account
1. Click **Select a role** and choose **Service Accounts > Service Account User**
1. Check the **Furnish a new private key** checkbox
1. Select **JSON** as the Key type
1. Click **Create** to close the dialog
1. Make a note of the file name of the JSON file downloaded to your computer
1. Back on the Google Play developer console, click **Done** to close the dialog
1. Click on **Grant Access** for the newly added service account
1. Choose **Release Manager** from the **Role** dropdown
1. Click **Add user** to close the dialog

### Migrating Google credential format (from .p12 key file to .json)

In previous versions of supply, credentials to your Play Console were stored as `.p12` files. Since version 0.4.0, supply now supports the recommended `.json` key Service Account credential files. If you wish to upgrade:

- follow the <a href="#setup">Setup</a> procedure once again to make sure you create the appropriate JSON file
- update your fastlane configuration or your command line invocation to use the appropriate argument if necessary.
  Note that you don't need to take note nor pass the `issuer` argument anymore.


The previous p12 configuration is still currently supported.


## Quick Start

- `cd [your_project_folder]`
- `fastlane supply init`
- Make changes to the downloaded metadata, add images, screenshots and/or an APK
- `fastlane supply run`

## Available Commands

- `fastlane supply`: update an app with metadata, a build, images and screenshots
- `fastlane supply init`: download metadata for an existing app to a local directory
- `fastlane action supply`: show information on available commands, arguments and environment variables

You can either run _supply_ on its own and use it interactively, or you can pass arguments or specify environment variables for all the options to skip the questions.

## Uploading an APK

To upload a new binary to Google Play, simply run

```no-highlight
fastlane supply --apk path/to/app.apk
```

This will also upload app metadata if you previously ran `fastlane supply init`.

To gradually roll out a new build use

```no-highlight
fastlane supply --apk path/app.apk --track rollout --rollout 0.5
```

Expansion files (obbs) found under the same directory as your APK will also be uploaded together with your APK as long as:

- they are identified as type 'main' or 'patch' (by containing 'main' or 'patch' in their file name)
- you have at most one of each type

## Images and Screenshots

After running `fastlane supply init`, you will have a metadata directory. This directory contains one or more locale directories (e.g. en-US, en-GB, etc.), and inside this directory are text files such as `title.txt` and `short_description.txt`.

Inside of a given locale directory is a folder called `images`. Here you can supply images with the following file names (extension can be png, jpg or jpeg):

- `featureGraphic`
- `icon`
- `promoGraphic`
- `tvBanner`

And you can supply screenshots by creating directories with the following names, containing PNGs or JPEGs (image names are irrelevant):

- `phoneScreenshots/`
- `sevenInchScreenshots/` (7-inch tablets)
- `tenInchScreenshots/` (10-inch tablets)
- `tvScreenshots/`
- `wearScreenshots/`

Note that these will replace the current images and screenshots on the play store listing, not add to them.

## Changelogs (What's new)

You can add changelog files under the `changelogs/` directory for each locale. The filename should exactly match the version code of the APK that it represents. `fastlane supply init` will populate changelog files from existing data on Google Play if no `metadata/` directory exists when it is run.

```no-highlight
└── fastlane
    └── metadata
        └── android
            ├── en-US
            │   └── changelogs
            │       ├── 100000.txt
            │       └── 100100.txt
            └── fr-FR
                └── changelogs
                    └── 100100.txt
```

## Track Promotion

A common Play publishing scenario might involve uploading an APK version to a test track, testing it, and finally promoting that version to production.

This can be done using the `--track_promote_to` parameter.  The `--track_promote_to` parameter works with the `--track` parameter to command the Play API to promote existing Play track APK version(s) (those active on the track identified by the `--track` param value) to a new track (`--track_promote_to` value).

## Retrieve Track Version Codes

Before performing a new APK upload you may want to check existing track version codes, or you may simply want to provide an informational lane that displays the currently promoted version codes for the production track. You can use the `google_play_track_version_codes` action to retrieve existing version codes for a package and track. For more information, see `fastlane action google_play_track_version_codes` help output.

<hr />


supply |
-----|----
Supported platforms | android
Author | @KrauseFx



## 2 Examples

```ruby
upload_to_play_store
```

```ruby
supply # alias for "upload_to_play_store"
```





## Parameters

Key | Description | Default
----|-------------|--------
  `package_name` | The package name of the application to use | [*](#parameters-legend-dynamic)
  `track` | The track of the application to use: production, beta, alpha, rollout | `production`
  `rollout` | The percentage of the user fraction when uploading to the rollout track | 
  `metadata_path` | Path to the directory containing the metadata files | [*](#parameters-legend-dynamic)
  `key` | [DEPRECATED!] Use --json_key instead - The p12 File used to authenticate with Google | [*](#parameters-legend-dynamic)
  `issuer` | [DEPRECATED!] Use --json_key instead - The issuer of the p12 file (email address of the service account) | [*](#parameters-legend-dynamic)
  `json_key` | The service account json file used to authenticate with Google | [*](#parameters-legend-dynamic)
  `json_key_data` | The service account json used to authenticate with Google | [*](#parameters-legend-dynamic)
  `apk` | Path to the APK file to upload | [*](#parameters-legend-dynamic)
  `apk_paths` | An array of paths to APK files to upload | 
  `skip_upload_apk` | Whether to skip uploading APK | `false`
  `skip_upload_metadata` | Whether to skip uploading metadata | `false`
  `skip_upload_images` | Whether to skip uploading images, screenshots not included | `false`
  `skip_upload_screenshots` | Whether to skip uploading SCREENSHOTS | `false`
  `track_promote_to` | The track to promote to: production, beta, alpha, rollout | 
  `validate_only` | Only validate changes with Google Play rather than actually publish | `false`
  `mapping` | Path to the mapping file to upload | 
  `mapping_paths` | An array of paths to mapping files to upload | 
  `root_url` | Root URL for the Google Play API. The provided URL will be used for API calls in place of https://www.googleapis.com/ | 
  `check_superseded_tracks` | Check the other tracks for superseded versions and disable them | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action supply
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/supply.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
