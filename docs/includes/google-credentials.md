**Tip:** If you see Google Play Console or Google Developer Console in your local language, add `&hl=en` at the end of the URL (before any `#...`) to switch to English. All the links below already have this to make it easier to find the correct buttons.

**Tip:** Google Cloud setup can also be [automated using Terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs).

**Note:** if you face issues when following these instructions, you might want to refer to the [official documentation by Google](https://developers.google.com/android-publisher/getting_started/?hl=en).

1. Open the [Google Play Console](https://play.google.com/console/?hl=en)
   1. Click **Account Details**, and note the **Google Cloud Project ID** listed there
1. Enable the [Google Play Developer API](https://console.developers.google.com/apis/api/androidpublisher.googleapis.com/?hl=en) by selecting an existing Google Cloud Project that fits your needs and pushing **ENABLE**
   1. If you don't have an existing project or prefer to have a dedicated one for _fastlane_, [create a new one here](https://console.cloud.google.com/projectcreate/?hl=en) and follow the instructions
1. Open [Service Accounts on Google Cloud](https://console.cloud.google.com/iam-admin/serviceaccounts?hl=en) and select the project you'd like to use
   1. Click the **CREATE SERVICE ACCOUNT** button at the top of the **Google Cloud Platform Console** page
   1. Verify that you are on the correct Google Cloud Platform Project by looking for the **Google Cloud Project ID** from earlier within the light gray text in the second input, preceding `.iam.gserviceaccount.com`, or by checking the project name in the navigation bar. If not, open the picker in the top navigation bar, and find the right one.
   1. Provide a `Service account name` (e.g. fastlane-supply)
   1. Copy the generated email address that is noted below the `Service account-ID` field for later use
   1. Click **DONE** (don't click **CREATE AND CONTINUE** as the optional steps such as granting access are not needed): <img src="/img/getting-started/android/creating-service-account.png" width="700" />
1. Setup [authentication](https://cloud.google.com/iam/docs/best-practices-service-accounts#choose-when-to-use) for the service account, fastlane supports Workload Identity Federation and service account keys
   - When using Workload Identity Federation (such as for GitHub Actions)
      1. 
   - To use service account keys:
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
