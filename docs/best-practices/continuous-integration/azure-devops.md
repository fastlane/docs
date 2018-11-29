# Azure DevOps (formerly known as: Visual Studio Team Services)

Microsoft Visual Studio Team Services (VSTS) and Team Foundation Server (TFS) use _fastlane_ in their [Apple App Store](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.app-store) extension.

## Getting Started

Once you have created or retrieved credentials for your App Store account, then perform the following steps to automate releasing updates from a VSTS build or release definition:

1. Install the App Store extension from the VSTS Marketplace
1. Go to your VSTS or TFS project, click on the **Build** tab, and create a new build definition (the "+" icon) that is hooked up to your project's appropriate source repo
1. Click **Add build step...** and select the necessary tasks to generate your release assets (e.g. Gulp, Cordova Build)
1. Click **Add build step...** and select **App Store Release** from the **Deploy** category
1. Configure the **App Store Release** task with the desired authentication method, the generated IPA file path, and the desired release track.

Now when you build, your app will automatically be published to _App Store Connect_!

## Configuring _fastlane_ versions

The extension can be configured to install the latest version of _fastlane_ or a specific version of _fastlane_:

1. In the Build for your project, click on the **Apple App Store** task (supported in both `Apple App Store Release` and `Apple App Store Promote`), go to the **Advanced** section of the Task, click **Install fastlane**
1. Optionally, select **Specific Version** from `fastlane version`, and enter a specific version of _fastlane_

## More Information

For more documentation, see the [Apple App Store](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.app-store) in the Visual Studio Team Server marketplace.
