# Codemagic Integration

[Codemagic](https://codemagic.io/) is a cloud-based CI/CD tool for Flutter apps that you can use for continuous delivery together with *fastlane*. Codemagic has *fastlane* pre-installed, so you can easily run your *fastlane* scripts as part of the Codemagic build process. 

When using *fastlane* for beta distribution to third-party services, you will need to add the API keys / secrets to Codemagic as secure [environment variables](https://docs.codemagic.io/building/environment-variables/). For example, in order to publish to Crashlytics, you need to add the following environment variables:
```
CRASHLYTICS_API_TOKEN = 123abc
CRASHLYTICS_BUILD_SECRET = secret_key
```

In app settings, paste your script in the appropriate custom script field to run it before or after the default Test, Build or Publish steps.

Start the script with the shebang line, for example:
 
    #!/usr/bin/env sh

    set -e # exit on first failed commandset
    set -x # print all executed commands to the log

Then add the commands you would like to run. The example script below will check if the app artifact was built successfully and then run the *beta* lane for Android beta distribution. You can use this script in the pre-publish phase.

    if [ "$FCI_BUILD_STEP_STATUS" == "success" ]
    then
        gem install bundler
        cd android
        bundle install
        bundle exec fastlane beta
    fi
