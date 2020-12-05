# Uploading App Privacy Details

## Introduction

Apple [announced](https://developer.apple.com/app-store/app-privacy-details/) that as of December 8, 2020, the App Store would start displaying detailed information about an app's privacy practices. App Store Connect will ask developers a series of questions on how privacy is respected over an array of categories. A category then allows for a selection of multiple purposes. After the purposes are selected, there are then questions on how the data is selected.

An example would be:

- Contact Info - Name
  - Purposes:
    - Product Personalization
    - App Functionality
  - Data Protections
    - Data linked to user
    - Data used to track user
- Financial Info - Credit Card
  - Purposes:
    - App Functionality
  - Data Protections
    - Data not linked to user

<img src="/img/app-privacy-details-app-store-connect.png">


## Uploading App Privacy Details with _fastlane_

_fastlane_ has the ability to upload your app's app privacy details with the `upload_app_privacy_details_to_app_store` action. This action has two steps. The first is answering an interactive questionnaire (similar to what App Store Connect dashboard offers) and saving the answers to a JSON config file. The second is the upload of the app privacy answers to App Store Connect.

The action outputs a JSON config file to `fastlane/app_privacy_details.json` (by default) which will save your configuration. This JSON file is output so the answers can be saved in source control, reviewed by you or team members, and used for other apps. The JSON file can then be used again by this action (with the `json_path` option) to skip the interactive questions.

These two steps can be done together or separate.

### Option 1: Answer and Upload Together

By default, `upload_app_privacy_details_to_app_store` will prompt you with questions and then upload them directly to App Store Connect. The action will also output a JSON config file to `fastlane/app_privacy_details.json`.

In CLI...

```sh
fastlane run upload_app_privacy_details_to_app_store \
  username:"your@email.com" \
  team_name:"Your Team" \
  app_identifier:"com.your.bundle"
```

or in `Fastfile`...

```ruby
upload_app_privacy_details_to_app_store(
  username: "your@email.com",
  team_name: "Your Team",
  app_identifier: "com.your.bundle"
)
```

### Option 2: Answer and Upload Separate

If you do not want to upload the app privacy details to App Store Connect right away, `skip_upload:true` can be passed to the action. This will prompt you with the interactive questions and save the JSON configuration file but that is it.

After reviewing the file, the same action can be used again with the `json_path` option to bypass the questions (since the answers are in the JSON file) and upload them right away to App Store Connect.

#### Step 1: Answering Questions

In CLI...

```sh
fastlane run upload_app_privacy_details_to_app_store \
  username:"your@email.com" \
  team_name:"Your Team" \
  app_identifier:"com.your.bundle" \
  skip_upload:true
```

or in `Fastfile`...

```ruby
upload_app_privacy_details_to_app_store(
  username: "your@email.com",
  team_name: "Your Team",
  app_identifier: "com.your.bundle",
  skip_upload: true
)
```

<img src="/img/app-privacy-details-action-questions.png"/>

#### Step 2: Uploading

In CLI...

```sh
fastlane run upload_app_privacy_details_to_app_store \
  username:"your@email.com" \
  team_name:"Your Team" \
  app_identifier:"com.your.bundle" \
  json_path:"fastlane/app_privacy_details.json"
```

or in `Fastfile`...

```ruby
upload_app_privacy_details_to_app_store(
  username: "your@email.com",
  team_name: "Your Team",
  app_identifier: "com.your.bundle",
  json_path: "fastlane/app_privacy_details.json"
)
```

<img src="/img/app-privacy-details-action-upload.png"/>

### Requirements

This action requires an Apple ID with owner or admin permissions on the Apple Development team. The APIs this action uses are also **not available** on the official App Store Connect API so the App Store Connect API Key **cannot** be used at this time.

## Example JSON configuration file

Below are two examples of the `app_privacy_details.json` file that `upload_app_privacy_details_to_app_store` action will create.

### Not collecting data

This is what will be output if your app does not collect any data.

```js
[
  {
    "data_protections": [
      "DATA_NOT_COLLECTED"
    ]
  }
]
```

### Collecting data

This is what will be output that matches the example at the top of this page.

```js
[
  {
    "category": "PAYMENT_INFORMATION",
    "purposes": [
      "APP_FUNCTIONALITY"
    ],
    "data_protections": [
      "DATA_NOT_LINKED_TO_YOU"
    ]
  },
  {
    "category": "NAME",
    "purposes": [
      "PRODUCT_PERSONALIZATION",
      "APP_FUNCTIONALITY"
    ],
    "data_protections": [
      "DATA_LINKED_TO_YOU",
      "DATA_USED_TO_TRACK_YOU"
    ]
  }
]
```

## Data Values

These are the values you will see in your JSON configuration file. You won't need to ever manually enter these values in your JSON configuration file (as this is what the interactive questionnaire will output for you).

### Categories

- `PAYMENT_INFORMATION`
- `CREDIT_AND_FRAUD`
- `OTHER_FINANCIAL_INFO`
- `PRECISE_LOCATION`
- `SENSITIVE_INFO`
- `PHYSICAL_ADDRESS`
- `EMAIL_ADDRESS`
- `NAME`
- `PHONE_NUMBER`
- `OTHER_CONTACT_INFO`
- `CONTACTS`
- `EMAILS_OR_TEXT_MESSAGES`
- `PHOTOS_OR_VIDEOS`
- `AUDIO`
- `GAMEPLAY_CONTENT`
- `CUSTOMER_SUPPORT`
- `OTHER_USER_CONTENT`
- `BROWSING_HISTORY`
- `SEARCH_HISTORY`
- `USER_ID`
- `DEVICE_ID`
- `PURCHASE_HISTORY`
- `PRODUCT_INTERACTION`
- `ADVERTISING_DATA`
- `OTHER_USAGE_DATA`
- `CRASH_DATA`
- `PERFORMANCE_DATA`
- `OTHER_DIAGNOSTIC_DATA`
- `OTHER_DATA`
- `HEALTH`
- `FITNESS`
- `COARSE_LOCATION`

### Purposes

- `THIRD_PARTY_ADVERTISING`
- `DEVELOPERS_ADVERTISING`
- `ANALYTICS`
- `PRODUCT_PERSONALIZATION`
- `APP_FUNCTIONALITY`
- `OTHER_PURPOSES`

### Data Protections

- Uses `DATA_LINKED_TO_YOU` or `DATA_NOT_LINKED_TO_YOU`
- Optionally uses `DATA_USED_TO_TRACK_YOU`
