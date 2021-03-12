Tip: If you see Google Play Console or Google Developer Console in your local language, add `&hl=en` at the end of the URL (before any `#...`) to switch to English.

1. Open the [Google Play Console](https://play.google.com/apps/publish/)
1. Click **Settings** → **Developer Account** → **API access**
1. Click the **Create new service account** button
1. Follow the **Google Developers Console** link in the dialog, which opens a new tab/window:
   1. Click the **CREATE SERVICE ACCOUNT** button at the top of the **Google Developers Console**
   1. Provide a `Service account name` and click **Create**
   1. Click **Select a role**, then find and select **Service Account User**, and proceed.
   1. Click the **Done** button
   1. Click on the **Actions** vertical three-dot icon of the service account you just created
   1. Select **Manage keys** on the menu
   1. Click **ADD KEY** -> **Create New Key**
   1. Make sure **JSON** is selected as the `Key type`, and click **CREATE**
   1. Save the file on your computer when prompted and remember where it was saved to
1. Back on the **Google Play Console**, click **DONE** to close the dialog
1. Click on **Grant Access** for the newly added service account at the bottom of the screen
1. Choose the permissions you'd like this account to have. We recommend **Admin (all permissions)**, but you may want to manually select all checkboxes and leave out some of the **Releases** permissions such as **Release to production**.
1. Click **Invite user** to finish.

You can use [`fastlane run validate_play_store_json_key json_key:/path/to/your/downloaded/file.json`](https://docs.fastlane.tools/actions/validate_play_store_json_key/) to test the connection to Google Play Store with the downloaded private key.
