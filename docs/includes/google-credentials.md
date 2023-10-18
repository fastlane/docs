**Tip:** If you see Google Play Console or Google Developer Console in your local language, add `&hl=en` at the end of the URL (before any `#...`) to switch to English. All the links below already have this to make it easier to find the correct buttons.

1. Open the [Google Play Console](https://play.google.com/console/?hl=en)
   1. Click **Account Details**, and note the **Developer Account ID** listed there
1. Open [Create Project on Google Cloud](https://console.cloud.google.com/projectcreate/?hl=en) and create a project if none exists that fits
   1. Enable the [Google Play Developer API](https://console.developers.google.com/apis/api/androidpublisher.googleapis.com/?hl=en) by selecting the project and pushing "enable"
1. Open [Service Accounts on Google Cloud](https://console.cloud.google.com/iam-admin/serviceaccounts?hl=en) and select the project you used before
   1. Click the **CREATE SERVICE ACCOUNT** button at the top of the **Google Cloud Platform Console**
   1. Verify that you are on the correct Google Cloud Platform Project by looking for the **Developer Account ID** from earlier within the light gray text in the second input, preceding `.iam.gserviceaccount.com`. If not, open the picker in the top navigation bar, and find the one with the **ID** that contains it
   1. Provide a `Service account name` (e.g. fastlane-supply) and click **Create**
   1. Copy the generated email address that is noted below the ServiceAccount-ID field for later use
   1. Click **Select a role**, then find and select **Service Account User**, and proceed
   1. Click the **Done** button
   1. Click on the **Actions** vertical three-dot icon of the service account you just created
   1. Select **Manage keys** on the menu
   1. Click **ADD KEY** → **Create New Key**
   1. Make sure **JSON** is selected as the `Key type`, and click **CREATE**
   1. Save the file on your computer when prompted and remember where it was saved at
1. Open the [Google Play Console](https://play.google.com/console/?hl=en) and select **Users and Permissions**
   1. Click **Invite new users**
   1. Paste the email address you saved for later use into the email address field
   1. Click on **Account Permissions**
   1. Choose the permissions you'd like this account to have. We recommend **Admin (all permissions)**, but you may want to manually select all checkboxes and leave out some of the **Releases** permissions such as **Release to production, exclude devices, and use Play App Signing**
   1. Click on **Invite User**


You can use [`fastlane run validate_play_store_json_key json_key:/path/to/your/downloaded/file.json`](https://docs.fastlane.tools/actions/validate_play_store_json_key/) to test the connection to Google Play Store with the downloaded private key. Once that works, add the path to the JSON file to your [Appfile](/advanced/Appfile):

```ruby
json_key_file("path/to/your/play-store-credentials.json")
package_name("my.package.name")
```
The path is relative to where you normally run `fastlane`.
