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
- [Jenkins](/best-practices/continuous-integration/jenkins/)
- [NeverCode](/best-practices/continuous-integration/nevercode/)
- [Semaphore](/best-practices/continuous-integration/semaphore/)
- [Travis](/best-practices/continuous-integration/travis/)

## Authenticating with Apple services

Several _fastlane_ actions communicate with Apple services that need authentication. This can pose several challenges on CI. There are 3 ways to connect to Apple services:

### Method 1: App Store Connect API key (recommended)

This is the recommended and official way of authenticating with Apple services. However, it doesn't support all of the _fastlane_ features yet. Check out [App Store Connect API](/app-store-connect-api) for more information.

### Method 2: Two-step or two-factor authentication

For actions that aren't yet supported by the official App Store Connect API, you will need to authenticate with your Apple ID. Luckily, _fastlane_ fully supports [2-factor authentication (2FA)](https://support.apple.com/en-us/HT204915) (and legacy [2-step verification (2SV)](https://support.apple.com/en-us/HT204152)) for logging in to your Apple ID and Apple Developer account. 🌟

#### Manual verification

With 2-factor authentication (or 2-step verification) enabled, you will be asked to verify your identity by entering a security code. If you already have a trusted device configured for your account, then the code will appear on the device. If you don't have any devices configured, but have trusted a phone number, then the code will be sent to your phone.

The resulting session will be stored in `~/.fastlane/spaceship/[email]/cookie`.

#### Storing a manually verified session using `spaceauth`

As your CI machine will not be able to prompt you for your two-factor authentication or two-step verification information, you can generate a login session for your Apple ID in advance by running:

```
fastlane spaceauth -u user@email.com
```

The generated value then has to be stored inside the `FASTLANE_SESSION` environment variable on your CI system. This session will be reused instead of triggering a new login each time _fastlane_ communicates with Apple's APIs.

It's advised that you run `spaceauth` in the same machine as your CI, instead of running it locally on your machine - see the notes below regarding session duration.

You can also pass in the `--exports_to_clipboard` option to automatically export the session to clipboard. Use cases could be:

```sh
fastlane spaceauth -u user@example.org --exports_to_clipboard && export FASTLANE_SESSION=$(pbpaste)

# or

fastlane spaceauth -u user@example.org --exports_to_clipboard
FASTLANE_SESSION=$(pbpaste) fastlane another_lane
```

Note: `--exports_to_clipboard` uses `pbcopy`, and both `pbcopy` and `pbpaste` are only available in macOS. If you use a different OS, make sure you create aliases to `pbcopy` and `pbpaste`, such as:

```sh
# On Linux:

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# or

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
```

`SpaceauthRunner` also has a `session_string` method that can be used to get the session string directly:

```ruby
fastlane_session = Spaceship::SpaceauthRunner.new(username: "user@example.org").run.session_string
# Then you could for instance save the session to an env var on your CI programmatically, e.g. Aws::SecretsManager
```

#### Important note about session duration

The session generated, stored and reused as part of a 2FA/2SV authentication, or as part of _spaceauth_ is subject to technical limitations imposed by Apple. Namely:

- An Apple ID session is only valid within a certain region, meaning if the region you're using your session (e.g. CI system) is different than the region where you created that session (e.g. your local machine), you might run into issues. It's advised that you create the session in the same machine that will be used to consume it, to make the session last longer.
- The session's validity can greatly vary (anything between 1 day and 1 month, depending on factors such as geolocation of the session usage). This means you'll have to generate a new session at least once a month. Usually you'd only know about it when your build starts failing.

Unfortunately there is nothing _fastlane_ can do better in this regard, as these are technical limitations on how App Store Connect sessions are handled.

### Method 3: Application-specific passwords

If you want to upload builds to App Store Connect (actions `upload_to_app_store` and `deliver`) or TestFlight (actions `upload_to_testflight`, `pilot` or `testflight`) from your CI machine, you may generate an _application specific password_:

1. Visit [appleid.apple.com/account/manage](https://appleid.apple.com/account/manage)
1. Generate a new application specific password
1. Provide the application specific password using the environment variable `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

This will supply the application specific password to iTMSTransporter, the tool used by those actions to perform the upload.

Note: The application specific password will **not** work if your action usage does anything else than uploading the binary, e.g. updating any metadata like setting release notes or distributing to testers, etc. For those actions, you **must** use one of the other methods.

### Method 4: Apple ID without 2FA (deprecated)

[Apple announced that as of February 27th 2019](https://developer.apple.com/news/?id=02202019a), it would enforce 2-factor authentication on developer Apple IDs with the "Account Holder" role. Since then, they extended this rule to all roles, and then later throughout 2020 they slowly enforced all existing accounts to register 2FA. As of March 3rd 2021, no accounts without 2FA registered are able to login until they register a 2FA method, essentially breaking all "non-2FA compliant Apple IDs" that still existed. For this reason, when using _fastlane_ in your CI, you **will** have to work your way with 2FA.

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
