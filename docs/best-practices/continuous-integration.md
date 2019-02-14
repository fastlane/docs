{!docs/includes/setup-fastlane-header.md!}

# Continuous Integration

_fastlane_ works very well in Continuous Integration setups. It for example automatically generates a JUnit report for you that allows Continuous Integration systems, like `Jenkins`, access the results of your deployment.

## Integrations

Multiple CI products and services offer integrations with fastlane:

- [Jenkins](/best-practices/continuous-integration/jenkins/)
- [CircleCI](/best-practices/continuous-integration/circle-ci/)
- [Travis](/best-practices/continuous-integration/travis/)
- [Bamboo](/best-practices/continuous-integration/bamboo/)
- [GitLab CI](/best-practices/continuous-integration/gitlab/)
- [Azure DevOps](/best-practices/continuous-integration/azure-devops/) (formerly known as: Visual Studio Team Services)
- [NeverCode](/best-practices/continuous-integration/nevercode/)

## Two-step or Two-factor auth

Fastlane fully support 2 step verification and 2 Factor Authentication for logging in to your Apple ID and Apple Developer account.


The easiest way to get _fastlane_ running on a CI system is to create a separate Apple ID that doesn't have 2-factor auth enabled, with a long, randomly generated password. Additionally make sure the newly created Apple account has limited access to only the apps and resources it needs.

Creating a separate Apple ID allows you to limit the permission scope, have a randomly generated password, and will make it much easier for you to set up CI using _fastlane_.

### Security code and session

When your Apple account has 2 Factor Authentication (or 2 step verification) enabled, you will be asked to verify your identity by entering a security code. If you already have a trusted device configured for your account, then the code will appear on the device. If you don't have any devices configured, but have trusted a phone number, then the code will be sent to your phone. The resulting session will be stored in `~/.fastlane/spaceship/[email]/cookie`. The session should be valid for about one month, however there is no way to test this without actually waiting for over a month.

### Use of application specific passwords and `spaceauth`

When you can not enter this token, as on a Continuous Integration system, you have to use other ways to log in:

#### Application specific passwords

If you want to upload builds to TestFlight / App Store Connect from your CI machine, you need to generate an application specific password:

1. Visit [appleid.apple.com/account/manage](https://appleid.apple.com/account/manage)
1. Generate a new application specific password
1. Provide the application specific password using the environment variable `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

#### `spaceauth`

Because your CI machine will not be able to prompt you for your two-step or two-factor auth information, you also need to generate a login session for your CI machine in advance. You can get on your local machine this by running:

```
fastlane spaceauth -u user@email.com
```

This will generate a token you can set using the `FASTLANE_SESSION` environment variable on your CI system.

Please note:

- An Apple ID session is only valid for a certain region, meaning if your CI system is in a different region than your local machine, you'll run into issues
- An Apple ID session is only valid for up to a month, meaning you'll have to generate a new session every month. Usually you'd only know about it when your build starts failing

There is nothing _fastlane_ can do better in that regard, as these are technical limitations on how App Store Connect sessions are handled.

### Separate Apple ID for CI

Apple announced that as of February 27th 2019, it is enforcing 2FA on developer Apple ID's thus disabling the option to create a separate Apple ID specifically for CI without 2FA. If you somehow still have an Apple ID that does not have 2 Factor Authentication enabled, you can of course use that one to login via _fastlane_.

## Environment variables to set

Most setups will need the following environment variables

- `FASTLANE_USER`: Your App Store Connect / Apple Developer Portal user, if your _fastlane_ setup accesses App Store Connect or the Apple Developer Portal (e.g. submit a TestFlight build, create a profile, ...)
- `FASTLANE_PASSWORD`: Your App Store Connect / Apple Developer Portal password, usually only needed if you also set the `FASTLANE_USER` variable
- `MATCH_PASSWORD`: You need to provide the password of your _match_ encryption if you use _match_
- `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`: You need to provide an [application specific password](#two-step-or-two-factor-auth) if you have 2-factor enabled and use _pilot_ or _deliver_ to upload a binary to App Store Connect
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

The following content was moved:

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
