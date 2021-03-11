# Codemagic Integration

[Codemagic](https://codemagic.io/) is a cloud-based CI/CD tool for mobile applications that you can use for continuous delivery together with *fastlane*. Codemagic has *fastlane* pre-installed, so you can easily run your *fastlane* scripts as part of the Codemagic build process. 

When using *fastlane* for beta distribution to third-party services, you will need to add the API keys / secrets to Codemagic as [environment variables](https://docs.codemagic.io/building/environment-variables/). 

Here's an example of using *fastlane* to publish a successfully built Android app to Firebase App Distribution as part of the Codemagic workflow.

First,  create a [Firebase token](https://firebase.google.com/docs/cli#cli-ci-systems), [encrypt](https://docs.codemagic.io/building/encrypting/) it and save it into an environment variable with the name `FIREBASE_TOKEN`.

Then add the script to install the Fastlane Firebase App Distribution plugin and call the lane to publish the app. The scripts are added to the `publish` section of [codemagic.yaml](https://docs.codemagic.io/getting-started/yaml/) or as a pre-publish script when configuring the builds in the UI.

```
gem install bundler
sudo gem install fastlane-plugin-firebase_app_distribution --user-install 
cd android
bundle install
bundle exec fastlane <your_android_lane>  
```
