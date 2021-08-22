{!docs/includes/setup-fastlane-header.md!}

# Continuous Integration

_fastlane_ works very well in Continuous Integration setups. It for example automatically generates a JUnit report for you that allows Continuous Integration systems, like `Jenkins`, access the results of your deployment.

- [Integrations](#integrations)
- [Authentication with Apple services](#authentication-with-apple-services)
- [Environment variables to set](#environment-variables-to-set)
- [Deploy Strategy](#deploy-strategy)

## Integrations

Multiple CI products and services offer integrations with _fastlane_:

- [Appcircle](/best-practices/continuous-integration/appcircle/)
- [Azure DevOps](/best-practices/continuous-integration/azure-devops/) (formerly known as: Visual Studio Team Services)
- [Bamboo](/best-practices/continuous-integration/bamboo/)
- [Bitrise](/best-practices/continuous-integration/bitrise/)
- [CircleCI](/best-practices/continuous-integration/circle-ci/)
- [GitLab CI](/best-practices/continuous-integration/gitlab/)
- [GitHub Actions](/best-practices/continuous-integration/github/)
- [Jenkins](/best-practices/continuous-integration/jenkins/)
- [NeverCode](/best-practices/continuous-integration/nevercode/)
- [Semaphore](/best-practices/continuous-integration/semaphore/)
- [Travis](/best-practices/continuous-integration/travis/)

## Authenticating with Apple services

Check out [Authenticating with Apple services](/getting-started/ios/authentication) to learn the best ways to authenticate, catered for your specific use case.

## Environment variables to set

Most setups will need the following environment variables

- `FASTLANE_USER`: Your App Store Connect / Apple Developer Portal user, if your _fastlane_ setup accesses App Store Connect or the Apple Developer Portal (e.g. submit a TestFlight build, create a profile, ...)
- `FASTLANE_PASSWORD`: Your App Store Connect / Apple Developer Portal password, usually only needed if you also set the `FASTLANE_USER` variable
- `MATCH_PASSWORD`: You need to provide the password of your _match_ encryption if you use _match_
- `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`: You need to provide an [application specific password](#application-specific-passwords) if you have 2-factor enabled and use _pilot_ or _deliver_ to upload a binary to App Store Connect
- `FASTLANE_SESSION`: You need to provide a [pregenerated session via `fastlane spaceauth`](#spaceauth) if you have 2-factor authentication enabled and want to use any actions that communicates with App Store Connect.
- `LANG` and `LC_ALL`: These set up the locale your shell and all the commands you execute run at. _fastlane_ needs these to be set to an UTF-8 locale to work correctly, for example `en_US.UTF-8`. Many CI systems come with a locale that is unset or set to ASCII by default, so make sure to double-check whether yours is set correctly.
- `SPACESHIP_ONLY_ALLOW_INTERACTIVE_2FA`: Explicitly prevents being prompted for 2FA in non-interactive mode.

## Deploy Strategy

You should **not** deploy a new App Store update after every commit, since you still have to wait 1-2 days for the review. Instead it is recommended that you use Git Tags, or custom triggers to deploy a new update.

You can set up your own `Release` job, which is only triggered manually.

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
