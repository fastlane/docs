{!docs/includes/setup-fastlane-header.md!}

# Continuous Integration

_fastlane_ works very well in Continuous Integration setups. It for example automatically generates a JUnit report for you that allows Continuous Integration systems, like `Jenkins`, access the results of your deployment.

- [Integrations](#integrations)
- [Authentication with Apple services](#authentication-with-apple-services)
- [Environment variables to set](#environment-variables-to-set)
- [Deploy Strategy](#deploy-strategy)

## Integrations

Multiple CI products and services offer integrations with fastlane:

- [Jenkins](/best-practices/continuous-integration/jenkins/)
- [CircleCI](/best-practices/continuous-integration/circle-ci/)
- [Travis](/best-practices/continuous-integration/travis/)
- [Bamboo](/best-practices/continuous-integration/bamboo/)
- [GitLab CI](/best-practices/continuous-integration/gitlab/)
- [Azure DevOps](/best-practices/continuous-integration/azure-devops/) (formerly known as: Visual Studio Team Services)
- [NeverCode](/best-practices/continuous-integration/nevercode/)

## Authentication with Apple services

Several Fastlane actions communicate with Apple services that need authentication. This can pose several challenges on CI:

### Separate Apple ID for CI

The easiest way to get _fastlane_ running on a CI system is to create a separate Apple ID that 

  - doesn't have 2-factor authentication enabled
  - doesn't have the Account Holder role

Creating a separate Apple ID allows you to limit the permission scope (limited access to only the apps and resources it needs), have a long, randomly generated password, and will make it much more convenient for you to set up CI using _fastlane_.

### Two-step or Two-factor auth

_fastlane_ fully supports [2-factor authentication (2FA)](https://support.apple.com/en-us/HT204915) (and legacy [2-step verification (2SV)](https://support.apple.com/en-us/HT204152)) for logging in to your Apple ID and Apple Developer account. 🌟

Note: [Apple announced that as of February 27th 2019](https://developer.apple.com/news/?id=02202019a), it is enforcing 2-factor authentication on developer Apple IDs with the "Account Holder" role.

#### Security code and session

When your Apple account has 2-factor authentication (or 2-step verification) enabled, you will be asked to verify your identity by entering a security code. If you already have a trusted device configured for your account, then the code will appear on the device. If you don't have any devices configured, but have trusted a phone number, then the code will be sent to your phone. 

The resulting session will be stored in `~/.fastlane/spaceship/[email]/cookie`, which should be valid for about one month.

#### Use of application specific passwords and `spaceauth`

When you can not enter the security code manually, as on a Continuous Integration system, you have to use other ways to log in:

##### Application specific passwords

If you want to upload builds to App Store Connect (actions `upload_to_app_store` and `deliver`) or TestFlight (actions `upload_to_testflight`, `pilot` or `testflight`) from your CI machine, you need to generate an _application specific password_:

1. Visit [appleid.apple.com/account/manage](https://appleid.apple.com/account/manage)
1. Generate a new application specific password
1. Provide the application specific password using the environment variable `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

This will supply the application specific password to iTMSTransporter, the tool used by those actions to perform the upload.

Note: The application specific password will _not_ work if your action usage does anything else than uploading the binary, e.g. updating any metadata like setting release notes or distributing to testers, etc.

##### `spaceauth`

All other actions interacting with Apple's APIs do not accept application specific passwords.

As your CI machine will not be able to prompt you for your two-factor authentication or two-step verification information, you need to generate a login session for Apple ID in advance. You can get on your local machine this by running:

```
fastlane spaceauth -u user@email.com
```

The generated value then has to be stored inside the `FASTLANE_SESSION` environment variable on your CI system. This session will be reused instead of triggering a new login each time _fastlane_ communicates with Apple's APIs.

Please note:

- An Apple ID session is only valid for a certain region, meaning if your CI system is in a different region than your local machine, you might run into issues
- An Apple ID session is only valid for up to a month, meaning you'll have to generate a new session every month. Usually you'd only know about it when your build starts failing

Unfortunately there is nothing _fastlane_ can do better in this regard, as these are technical limitations on how App Store Connect sessions are handled.

## Environment variables to set

Most setups will need the following environment variables

- `FASTLANE_USER`: Your App Store Connect / Apple Developer Portal user, if your _fastlane_ setup accesses App Store Connect or the Apple Developer Portal (e.g. submit a TestFlight build, create a profile, ...)
- `FASTLANE_PASSWORD`: Your App Store Connect / Apple Developer Portal password, usually only needed if you also set the `FASTLANE_USER` variable
- `MATCH_PASSWORD`: You need to provide the password of your _match_ encryption if you use _match_
- `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`: You need to provide an [application specific password](#application-specific-passwords) if you have 2-factor enabled and use _pilot_ or _deliver_ to upload a binary to App Store Connect
- `FASTLANE_SESSION`: You need to provide a [pregenerated session via `fastlane spaceauth`](#spaceauth) if you have 2-factor authentication enabled and want to use any actions that communicates with App Store Connect.
- `LANG` and `LC_ALL`: These set up the locale your shell and all the commands you execute run at. _fastlane_ needs these to be set to an UTF-8 locale to work correctly, for example `en_US.UTF-8`. Many CI systems come with a locale that is unset or set to ASCII by default, so make sure to double-check whether yours is set correctly.

## Deploy Strategy

You should **not** deploy a new App Store update after every commit, since you still have to wait 1-2 days for the review. Instead it is recommended that you use Git Tags, or custom triggers to deploy a new update.

You can set up your own ```Release``` job, which is only triggered manually.

### Moved

<script type="text/javascript">
// Closure-wrapped for security.
(function () {
    var anchorMap = {
        "jenkins-integration": "/best-practices/continuous-integration/jenkins/",
        "circleci-integration": "/best-practices/continuous-integration/circle-ci/",
        "travis-integration": "/best-practices/continuous-integration/travis/",
        "bamboo-integration": "/best-practices/continuous-integration/bamboo/",
        "gitlab-ci-integration": "/best-practices/continuous-integration/gitlab/",
        "visual-studio-team-services": "/best-practices/continuous-integration/azure-devops/",
        "nevercode-integration": "/best-practices/continuous-integration/nevercode/",
    }
    /*
    * Best practice for extracting hashes:
    * https://stackoverflow.com/a/10076097/151365
    */
    var hash = window.location.hash.substring(1);
    if (hash) {
        /*
        * Best practice for javascript redirects: 
        * https://stackoverflow.com/a/506004/151365
        */
        if (anchorMap[hash]) {
            link = anchorMap[hash] + '#' + hash;
            window.location.replace(link);
        }
    }
})();
</script>

The following tool- and service-specific content was moved:

#### Jenkins Integration

This content was moved and now lives [here](/best-practices/continuous-integration/jenkins/).

#### CircleCI Integration

This content was moved and now lives [here](/best-practices/continuous-integration/circle-ci/).

#### Travis Integration

This content was moved and now lives [here](/best-practices/continuous-integration/travis/).

#### Bamboo Integration

This content was moved and now lives [here](/best-practices/continuous-integration/bamboo/).

#### GitLab CI Integration

This content was moved and now lives [here](/best-practices/continuous-integration/gitlab/).

#### Visual Studio Team Services

This content was moved and now lives [here](/best-practices/continuous-integration/azure-devops/).

#### Nevercode Integration

This content was moved and now lives [here](/best-practices/continuous-integration/nevercode/).
