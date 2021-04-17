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
