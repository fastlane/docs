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

### Separate Apple ID for CI

As of February 27th 2019, Apple is enforcing 2FA on developer Apple ID's thus disabling the option to create a separate Apple ID specifically for CI without 2FA. 

### Security code and session

When your Apple account has 2-factor or 2-step auth enabled, you'll be asked to verify your identity by entering a security code. If you already have a trusted device configured for your account, then the code will appear on the device. If you don't have any devices configured, but have trusted a phone number, then the code will be sent to your phone. The resulting session will be stored in `~/.fastlane/spaceship/[email]/cookie`. Again, the session should be valid for about one month, however there is no way to test this without actually waiting for over a month.

### Use of application specific passwords and `spaceauth`

Before going through this guide, make sure to read the section above.

If you want to upload builds to TestFlight / App Store Connect from your CI machine, you need to generate an application specific password:

1. Visit [appleid.apple.com/account/manage](https://appleid.apple.com/account/manage)
1. Generate a new application specific password
1. Provide the application specific password using the environment variable `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

Because your CI machine will not be able to prompt you for your two-step or two-factor auth information, you also need to generate a login session for your CI machine in advance. You can get this by running:

```
fastlane spaceauth -u user@email.com
```

This will generate a token you can set using the `FASTLANE_SESSION` environment variable on your CI system.

### Bypass trusted device and use SMS for verification

If you have a trusted device configured, Apple will not send a SMS code to your phone for your Apple account when you try to generate a web session with _fastlane_. Instead, a code will be displayed on one of your account's trusted devices. This can be problematic if you are trying to authenticate but don't have access to a trusted device. Take the following steps to circumvent the device and use SMS instead:

- Attempt to generate a web session with `fastlane spaceauth -u [email]` and wait for security code prompt to appear
- Open a browser to [appleid.apple.com](https://appleid.apple.com) or an address that requires you to login with your Apple ID, and logout of any previous session
- Login with your Apple ID and request a code be sent to the desired phone when prompted for a security code
- Use the code sent to phone with _fastlane_ instead of with the browser

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
