Tip: If you see Google Play Console or Google Developer Console in your local language, add `&hl=en` at the end of the URL (before any `#...`) to switch to English.

1. Open the [Google Play Console](https://play.google.com/apps/publish/)
1. Click the **Settings** menu entry, followed by **API access**
1. Click the **CREATE SERVICE ACCOUNT** button 
1. Follow the **Google Developers Console** link in the dialog, which opens a new tab/window:
   1. Click the **CREATE SERVICE ACCOUNT** button at the top of the **Google Developers Console**
   1. Provide a `Service account name`
   1. Click **Select a role** and choose **Service Accounts > Service Account User**
   1. Check the **Furnish a new private key** checkbox
   1. Make sure **JSON** is selected as the `Key type`
   1. Click **SAVE** to close the dialog
   1. Make a note of the file name of the JSON file downloaded to your computer
1. Back on the **Google Play Console**, click **DONE** to close the dialog
1. Click on **Grant Access** for the newly added service account
1. Choose **Release Manager** (or alternatively **Project Lead**) from the `Role` dropdown. (Note that choosing **Release Manager** grants access to the production track and all other tracks. Choosing **Project Lead** grants access to update all tracks _except_ the production track.)
1. Click **ADD USER** to close the dialog
