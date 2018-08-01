{!docs/setup-fastlane-header.md!}

# fastlane actions

TODO document what tools are and how they work

This page contains a list of all fastlane tools:

### iOS

#### App Store
- [`produce`](tools/produce.md): Create new iOS apps on iTunes Connect and Dev Portal using the command line
- [`precheck`](tools/precheck.md): Check your app using a community driven set of App Store review rules to avoid being rejected
- [`deliver`](tools/deliver.md): Upload screenshots, metadata, and your app to the App Store

#### Screenshots
- [`snapshot`](tools/snapshot.md): Automate taking localized screenshots of your iOS and tvOS apps on every device
- [`frameit`](tools/frameit.md): Quickly put your screenshots into the right device frames

#### Certificates and Provisioning Profiles
- [`match`](tools/match.md): Easily sync your certificates and profiles across your team using Git
- [`pem`](tools/pem.md): Automatically generate and renew your push notification profiles
- [`sigh`](tools/sigh.md): Because you would rather spend your time building stuff than fighting provisioning
- [`cert`](tools/cert.md): Automatically create and maintain iOS code signing certificates

#### Testing
- [`scan`](tools/scan.md): The easiest way to run tests for your iOS and Mac apps
- [`pilot`](tools/pilot.md): The best way to manage your TestFlight testers and builds from your terminal
- [`boarding`](https://github.com/fastlane/boarding): The easiest way to invite your TestFlight beta testers

#### Building
- [`gym`](tools/gym.md): Building your iOS apps has never been easier

#### Plumbing
- [`spaceship`](tools/spaceship.md): Ruby library to access the Apple Dev Center and iTunes Connect

### Android

#### Google Play
- [`supply`](tools/supply.md): Upload your Android app and its metadata to Google Play

#### Screenshots
- [`screengrab`](tools/screengrab.md): Automate taking localized screenshots of your Android app on every device

TODO update list or replace with table