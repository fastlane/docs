<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/Actions.md.erb
-->

{!docs/includes/setup-fastlane-header.md!}

# fastlane actions

This page contains a list of all built-in fastlane actions and their available options.

To get the most up-to-date information from the command line on your current version you can also run

```sh
fastlane actions # list all available fastlane actions
fastlane action [action_name] # more information for a specific action
```

You can import another `Fastfile` by using the `import` action. This is useful if you have shared lanes across multiple apps and you want to store a `Fastfile` in a separate folder. The path must be relative to the `Fastfile` this is called from.

```ruby
import './path/to/other/Fastfile'
```

For _fastlane_ plugins, check out the [available plugins](/plugins/available-plugins/) page.
If you want to create your own action, check out the [local actions](/create-action/#local-actions) page.

- [Testing](#testing)
- [Building](#building)
- [Screenshots](#screenshots)
- [Project](#project)
- [Code Signing](#code-signing)
- [Documentation](#documentation)
- [Beta](#beta)
- [Push](#push)
- [Releasing your app](#releasing-your-app)
- [Source Control](#source-control)
- [Notifications](#notifications)
- [App Store Connect](#app-store-connect)
- [Misc](#misc)
- [Deprecated](#deprecated)
- [Plugins](/plugins/available-plugins/)


# Testing

Action | Description | Supported Platforms
---|---|---
<a href="/actions/scan/">scan</a> | Alias for the `run_tests` action | ios, mac
<a href="/actions/slather/">slather</a> | Use slather to generate a code coverage report | ios, mac
<a href="/actions/swiftlint/">swiftlint</a> | Run swift code validation using SwiftLint | ios, mac
<a href="/actions/xcov/">xcov</a> | Nice code coverage reports without hassle | ios, mac
<a href="/actions/sonar/">sonar</a> | Invokes sonar-scanner to programmatically run SonarQube analysis | ios, android, mac
<a href="/actions/oclint/">oclint</a> | Lints implementation files with OCLint | ios, android, mac
<a href="/actions/gcovr/">gcovr</a> | Runs test coverage reports for your Xcode project | ios
<a href="/actions/lcov/">lcov</a> | Generates coverage data using lcov | ios, mac
<a href="/actions/appium/">appium</a> | Run UI test by Appium with RSpec | ios, android
<a href="/actions/xctool/">xctool</a> | Run tests using xctool | ios, mac
<a href="/actions/xcode_server_get_assets/">xcode_server_get_assets</a> | Downloads Xcode Bot assets like the `.xcarchive` and logs | ios, mac
<a href="/actions/run_tests/">run_tests</a> | Easily run tests of your iOS app (via _scan_) | ios, mac



# Building

Action | Description | Supported Platforms
---|---|---
<a href="/actions/gym/">gym</a> | Alias for the `build_ios_app` action | ios, mac
<a href="/actions/cocoapods/">cocoapods</a> | Runs `pod install` for the project | ios, mac
<a href="/actions/gradle/">gradle</a> | All gradle related actions, including building and testing your Android app | ios, android
<a href="/actions/clear_derived_data/">clear_derived_data</a> | Deletes the Xcode Derived Data | ios, mac
<a href="/actions/adb/">adb</a> | Run ADB Actions | android
<a href="/actions/xcversion/">xcversion</a> | Select an Xcode to use by version specifier | ios, mac
<a href="/actions/xcodebuild/">xcodebuild</a> | Use the `xcodebuild` command to build and sign your app | ios, mac
<a href="/actions/carthage/">carthage</a> | Runs `carthage` for your project | ios, mac
<a href="/actions/xcode_select/">xcode_select</a> | Change the xcode-path to use. Useful for beta versions of Xcode | ios, mac
<a href="/actions/ensure_xcode_version/">ensure_xcode_version</a> | Ensure the right version of Xcode is used | ios, mac
<a href="/actions/clean_cocoapods_cache/">clean_cocoapods_cache</a> | Remove the cache for pods | ios, mac
<a href="/actions/verify_xcode/">verify_xcode</a> | Verifies that the Xcode installation is properly signed by Apple | ios, mac
<a href="/actions/xcode_install/">xcode_install</a> | Make sure a certain version of Xcode is installed | ios, mac
<a href="/actions/verify_pod_keys/">verify_pod_keys</a> | Verifies all keys referenced from the Podfile are non-empty | ios, mac
<a href="/actions/xcbuild/">xcbuild</a> | Builds the project using `xcodebuild` | ios, mac
<a href="/actions/xcarchive/">xcarchive</a> | Archives the project using `xcodebuild` | ios, mac
<a href="/actions/xctest/">xctest</a> | Runs tests on the given simulator | ios, mac
<a href="/actions/build_android_app/">build_android_app</a> | Alias for the `gradle` action | ios, android
<a href="/actions/build_ios_app/">build_ios_app</a> | Easily build and sign your app (via _gym_) | ios, mac
<a href="/actions/build_app/">build_app</a> | Alias for the `build_ios_app` action | ios, mac
<a href="/actions/xcclean/">xcclean</a> | Cleans the project using `xcodebuild` | ios, mac
<a href="/actions/xcexport/">xcexport</a> | Exports the project using `xcodebuild` | ios, mac
<a href="/actions/spm/">spm</a> | Runs Swift Package Manager on your project | ios, android, mac



# Screenshots

Action | Description | Supported Platforms
---|---|---
<a href="/actions/snapshot/">snapshot</a> | Alias for the `capture_ios_screenshots` action | ios, mac
<a href="/actions/screengrab/">screengrab</a> | Alias for the `capture_android_screenshots` action | android
<a href="/actions/frameit/">frameit</a> | Alias for the `frame_screenshots` action | ios, mac
<a href="/actions/frame_screenshots/">frame_screenshots</a> | Adds device frames around all screenshots (via _frameit_) | ios, mac
<a href="/actions/capture_ios_screenshots/">capture_ios_screenshots</a> | Generate new localized screenshots on multiple devices (via _snapshot_) | ios, mac
<a href="/actions/capture_screenshots/">capture_screenshots</a> | Alias for the `capture_ios_screenshots` action | ios, mac
<a href="/actions/capture_android_screenshots/">capture_android_screenshots</a> | Automated localized screenshots of your Android app (via _screengrab_) | android



# Project

Action | Description | Supported Platforms
---|---|---
<a href="/actions/increment_build_number/">increment_build_number</a> | Increment the build number of your project | ios, mac
<a href="/actions/set_info_plist_value/">set_info_plist_value</a> | Sets value to Info.plist of your project as native Ruby data structures | ios, mac
<a href="/actions/get_version_number/">get_version_number</a> | Get the version number of your project | ios, mac
<a href="/actions/get_info_plist_value/">get_info_plist_value</a> | Returns value from Info.plist of your project as native Ruby data structures | ios, mac
<a href="/actions/update_info_plist/">update_info_plist</a> | Update a Info.plist file with bundle identifier and display name | ios
<a href="/actions/update_app_identifier/">update_app_identifier</a> | Update the project's bundle identifier | ios
<a href="/actions/get_build_number/">get_build_number</a> | Get the build number of your project | ios, mac
<a href="/actions/increment_version_number/">increment_version_number</a> | Increment the version number of your project | ios, mac
<a href="/actions/update_project_team/">update_project_team</a> | Update Xcode Development Team ID | ios, mac
<a href="/actions/update_app_group_identifiers/">update_app_group_identifiers</a> | This action changes the app group identifiers in the entitlements file | ios
<a href="/actions/get_ipa_info_plist_value/">get_ipa_info_plist_value</a> | Returns a value from Info.plist inside a .ipa file | ios, mac
<a href="/actions/recreate_schemes/">recreate_schemes</a> | Recreate not shared Xcode project schemes | ios, mac
<a href="/actions/update_url_schemes/">update_url_schemes</a> | Updates the URL schemes in the given Info.plist | ios, mac
<a href="/actions/set_build_number_repository/">set_build_number_repository</a> | Set the build number from the current repository | ios, mac
<a href="/actions/set_pod_key/">set_pod_key</a> | Sets a value for a key with cocoapods-keys | ios, mac
<a href="/actions/update_plist/">update_plist</a> | Update a plist file | ios



# Code Signing

Action | Description | Supported Platforms
---|---|---
<a href="/actions/sigh/">sigh</a> | Alias for the `get_provisioning_profile` action | ios, mac
<a href="/actions/match/">match</a> | Alias for the `sync_code_signing` action | ios
<a href="/actions/cert/">cert</a> | Alias for the `get_certificates` action | ios
<a href="/actions/import_certificate/">import_certificate</a> | Import certificate from inputfile into a keychain | ios, android, mac
<a href="/actions/update_project_provisioning/">update_project_provisioning</a> | Update projects code signing settings from your provisioning profile | ios, mac
<a href="/actions/resign/">resign</a> | Codesign an existing ipa file | ios
<a href="/actions/register_devices/">register_devices</a> | Registers new devices to the Apple Dev Portal | ios, mac
<a href="/actions/automatic_code_signing/">automatic_code_signing</a> | Configures Xcode's Codesigning options | ios, mac
<a href="/actions/register_device/">register_device</a> | Registers a new device to the Apple Dev Portal | ios
<a href="/actions/get_certificates/">get_certificates</a> | Create new iOS code signing certificates (via _cert_) | ios
<a href="/actions/sync_code_signing/">sync_code_signing</a> | Easily sync your certificates and profiles across your team (via _match_) | ios
<a href="/actions/install_provisioning_profile/">install_provisioning_profile</a> | Install provisioning profile from path | ios, mac
<a href="/actions/get_provisioning_profile/">get_provisioning_profile</a> | Generates a provisioning profile, saving it in the current folder (via _sigh_) | ios, mac



# Documentation

Action | Description | Supported Platforms
---|---|---
<a href="/actions/jazzy/">jazzy</a> | Generate docs using Jazzy | ios, mac
<a href="/actions/appledoc/">appledoc</a> | Generate Apple-like source code documentation from the source code | ios, mac



# Beta

Action | Description | Supported Platforms
---|---|---
<a href="/actions/pilot/">pilot</a> | Alias for the `upload_to_testflight` action | ios
<a href="/actions/crashlytics/">crashlytics</a> | Upload a new build to [Crashlytics Beta](http://try.crashlytics.com/beta/) | ios, android, mac
<a href="/actions/testflight/">testflight</a> | Alias for the `upload_to_testflight` action | ios
<a href="/actions/deploygate/">deploygate</a> | Upload a new build to [DeployGate](https://deploygate.com/) | ios, android
<a href="/actions/apteligent/">apteligent</a> | Upload dSYM file to [Apteligent (Crittercism)](http://www.apteligent.com/) | ios
<a href="/actions/appetize/">appetize</a> | Upload your app to [Appetize.io](https://appetize.io/) to stream it in browser | ios, android
<a href="/actions/testfairy/">testfairy</a> | Upload a new build to [TestFairy](https://www.testfairy.com/) | ios, android
<a href="/actions/appaloosa/">appaloosa</a> | Upload your app to [Appaloosa Store](https://www.appaloosa-store.com/) | ios, android, mac
<a href="/actions/nexus_upload/">nexus_upload</a> | Upload a file to [Sonatype Nexus platform](https://www.sonatype.com) | ios, android, mac
<a href="/actions/installr/">installr</a> | Upload a new build to [Installr](http://installrapp.com/) | ios
<a href="/actions/splunkmint/">splunkmint</a> | Upload dSYM file to [Splunk MINT](https://mint.splunk.com/) | ios
<a href="/actions/tryouts/">tryouts</a> | Upload a new build to [Tryouts](https://tryouts.io/) | ios, android
<a href="/actions/upload_to_testflight/">upload_to_testflight</a> | Upload new binary to App Store Connect for TestFlight beta testing (via _pilot_) | ios
<a href="/actions/podio_item/">podio_item</a> | Creates or updates an item within your Podio app | ios, android, mac



# Push

Action | Description | Supported Platforms
---|---|---
<a href="/actions/pem/">pem</a> | Alias for the `get_push_certificate` action | ios
<a href="/actions/update_urban_airship_configuration/">update_urban_airship_configuration</a> | Set [Urban Airship](https://www.urbanairship.com/) plist configuration values | ios
<a href="/actions/onesignal/">onesignal</a> | Create a new [OneSignal](https://onesignal.com/) application | ios, android
<a href="/actions/get_push_certificate/">get_push_certificate</a> | Ensure a valid push profile is active, creating a new one if needed (via _pem_) | ios



# Releasing your app

Action | Description | Supported Platforms
---|---|---
<a href="/actions/deliver/">deliver</a> | Alias for the `upload_to_app_store` action | ios, mac
<a href="/actions/supply/">supply</a> | Alias for the `upload_to_play_store` action | android
<a href="/actions/appstore/">appstore</a> | Alias for the `upload_to_app_store` action | ios, mac
<a href="/actions/download_from_play_store/">download_from_play_store</a> | Download metadata and binaries from Google Play (via _supply_) | android
<a href="/actions/upload_to_app_store/">upload_to_app_store</a> | Upload metadata and binary to App Store Connect (via _deliver_) | ios, mac
<a href="/actions/upload_to_play_store/">upload_to_play_store</a> | Upload metadata, screenshots and binaries to Google Play (via _supply_) | android



# Source Control

Action | Description | Supported Platforms
---|---|---
<a href="/actions/ensure_git_status_clean/">ensure_git_status_clean</a> | Raises an exception if there are uncommitted git changes | ios, android, mac
<a href="/actions/git_branch/">git_branch</a> | Returns the name of the current git branch, possibly as managed by CI ENV vars | ios, android, mac
<a href="/actions/last_git_commit/">last_git_commit</a> | Return last git commit hash, abbreviated commit hash, commit message and author | ios, android, mac
<a href="/actions/reset_git_repo/">reset_git_repo</a> | Resets git repo to a clean state by discarding uncommitted changes | ios, android, mac
<a href="/actions/changelog_from_git_commits/">changelog_from_git_commits</a> | Collect git commit messages into a changelog | ios, android, mac
<a href="/actions/number_of_commits/">number_of_commits</a> | Return the number of commits in current git branch | ios, android, mac
<a href="/actions/git_pull/">git_pull</a> | Executes a simple git pull command | ios, android, mac
<a href="/actions/last_git_tag/">last_git_tag</a> | Get the most recent git tag | ios, android, mac
<a href="/actions/push_to_git_remote/">push_to_git_remote</a> | Push local changes to the remote branch | ios, android, mac
<a href="/actions/add_git_tag/">add_git_tag</a> | This will add an annotated git tag to the current branch | ios, android, mac
<a href="/actions/commit_version_bump/">commit_version_bump</a> | Creates a 'Version Bump' commit. Run after `increment_build_number` | ios, mac
<a href="/actions/git_tag_exists/">git_tag_exists</a> | Checks if the git tag with the given name exists in the current repo | ios, android, mac
<a href="/actions/ensure_git_branch/">ensure_git_branch</a> | Raises an exception if not on a specific git branch | ios, android, mac
<a href="/actions/git_commit/">git_commit</a> | Directly commit the given file with the given message | ios, android, mac
<a href="/actions/push_git_tags/">push_git_tags</a> | Push local tags to the remote - this will only push tags | ios, android, mac
<a href="/actions/git_add/">git_add</a> | Directly add the given file or all files | ios, android, mac
<a href="/actions/get_build_number_repository/">get_build_number_repository</a> | Get the build number from the current repository | ios, mac
<a href="/actions/set_github_release/">set_github_release</a> | This will create a new release on GitHub and upload assets for it | ios, android, mac
<a href="/actions/create_pull_request/">create_pull_request</a> | This will create a new pull request on GitHub | ios, android, mac
<a href="/actions/get_github_release/">get_github_release</a> | This will verify if a given release version is available on GitHub | ios, android, mac
<a href="/actions/hg_ensure_clean_status/">hg_ensure_clean_status</a> | Raises an exception if there are uncommitted hg changes | ios, android, mac
<a href="/actions/hg_commit_version_bump/">hg_commit_version_bump</a> | This will commit a version bump to the hg repo | ios, android, mac
<a href="/actions/hg_push/">hg_push</a> | This will push changes to the remote hg repository | ios, android, mac
<a href="/actions/hg_add_tag/">hg_add_tag</a> | This will add a hg tag to the current branch | ios, android, mac
<a href="/actions/github_api/">github_api</a> | Call a GitHub API endpoint and get the resulting JSON response | ios, android, mac
<a href="/actions/git_submodule_update/">git_submodule_update</a> | Executes a git submodule command | ios, android, mac
<a href="/actions/commit_github_file/">commit_github_file</a> | This will commit a file directly on GitHub via the API | ios, android, mac



# Notifications

Action | Description | Supported Platforms
---|---|---
<a href="/actions/slack/">slack</a> | Send a success/error message to your [Slack](https://slack.com) group | ios, android, mac
<a href="/actions/notification/">notification</a> | Display a macOS notification with custom message and title | ios, android, mac
<a href="/actions/hipchat/">hipchat</a> | Send a error/success message to [HipChat](https://www.hipchat.com/) | ios, android, mac
<a href="/actions/mailgun/">mailgun</a> | Send a success/error message to an email group | ios, android, mac
<a href="/actions/chatwork/">chatwork</a> | Send a success/error message to [ChatWork](https://go.chatwork.com/) | ios, android, mac
<a href="/actions/ifttt/">ifttt</a> | Connect to the [IFTTT Maker Channel](https://ifttt.com/maker) | ios, android, mac
<a href="/actions/flock/">flock</a> | Send a message to a [Flock](https://flock.com/) group | ios, android, mac
<a href="/actions/twitter/">twitter</a> | Post a tweet on [Twitter.com](https://twitter.com) | ios, android, mac
<a href="/actions/typetalk/">typetalk</a> | Post a message to [Typetalk](https://www.typetalk.com/) | ios, android, mac



# App Store Connect

Action | Description | Supported Platforms
---|---|---
<a href="/actions/produce/">produce</a> | Alias for the `create_app_online` action | ios
<a href="/actions/precheck/">precheck</a> | Alias for the `check_app_store_metadata` action | ios
<a href="/actions/latest_testflight_build_number/">latest_testflight_build_number</a> | Fetches most recent build number from TestFlight | ios
<a href="/actions/download_dsyms/">download_dsyms</a> | Download dSYM files from App Store Connect for Bitcode apps | ios
<a href="/actions/app_store_build_number/">app_store_build_number</a> | Returns the current build_number of either live or edit version | ios, mac
<a href="/actions/set_changelog/">set_changelog</a> | Set the changelog for all languages on App Store Connect | ios, mac
<a href="/actions/check_app_store_metadata/">check_app_store_metadata</a> | Check your app's metadata before you submit your app to review (via _precheck_) | ios
<a href="/actions/create_app_online/">create_app_online</a> | Creates the given application on iTC and the Dev Portal (via _produce_) | ios



# Misc

Action | Description | Supported Platforms
---|---|---
<a href="/actions/puts/">puts</a> | Prints out the given text | ios, android, mac
<a href="/actions/default_platform/">default_platform</a> | Defines a default platform to not have to specify the platform | ios, android, mac
<a href="/actions/fastlane_version/">fastlane_version</a> | Alias for the `min_fastlane_version` action | ios, android, mac
<a href="/actions/lane_context/">lane_context</a> | Access lane context values | ios, android, mac
<a href="/actions/import/">import</a> | Import another Fastfile to use its lanes | ios, android, mac
<a href="/actions/import_from_git/">import_from_git</a> | Import another Fastfile from a remote git repository to use its lanes | ios, android, mac
<a href="/actions/clean_build_artifacts/">clean_build_artifacts</a> | Deletes files created as result of running gym, cert, sigh or download_dsyms | ios, mac
<a href="/actions/skip_docs/">skip_docs</a> | Skip the creation of the fastlane/README.md file when running fastlane | ios, android, mac
<a href="/actions/is_ci/">is_ci</a> | Is the current run being executed on a CI system, like Jenkins or Travis | ios, android, mac
<a href="/actions/setup_jenkins/">setup_jenkins</a> | Setup xcodebuild, gym and scan for easier Jenkins integration | ios, mac
<a href="/actions/unlock_keychain/">unlock_keychain</a> | Unlock a keychain | ios, android, mac
<a href="/actions/update_fastlane/">update_fastlane</a> | Makes sure fastlane-tools are up-to-date when running fastlane | ios, android, mac
<a href="/actions/bundle_install/">bundle_install</a> | This action runs `bundle install` (if available) | ios, android, mac
<a href="/actions/upload_symbols_to_crashlytics/">upload_symbols_to_crashlytics</a> | Upload dSYM symbolication files to Crashlytics | ios
<a href="/actions/create_keychain/">create_keychain</a> | Create a new Keychain | ios, android, mac
<a href="/actions/delete_keychain/">delete_keychain</a> | Delete keychains and remove them from the search list | ios, android, mac
<a href="/actions/backup_file/">backup_file</a> | This action backs up your file to "[path].back" | ios, android, mac
<a href="/actions/copy_artifacts/">copy_artifacts</a> | Copy and save your build artifacts (useful when you use reset_git_repo) | ios, android, mac
<a href="/actions/prompt/">prompt</a> | Ask the user for a value or for confirmation | ios, android, mac
<a href="/actions/reset_simulator_contents/">reset_simulator_contents</a> | Shutdown and reset running simulators | ios
<a href="/actions/restore_file/">restore_file</a> | This action restore your file that was backuped with the `backup_file` action | ios, android, mac
<a href="/actions/say/">say</a> | This action speaks the given text out loud | ios, android, mac
<a href="/actions/zip/">zip</a> | Compress a file or folder to a zip | ios, android, mac
<a href="/actions/danger/">danger</a> | Runs `danger` for the project | ios, android, mac
<a href="/actions/artifactory/">artifactory</a> | This action uploads an artifact to artifactory | ios, android, mac
<a href="/actions/version_bump_podspec/">version_bump_podspec</a> | Increment or set the version in a podspec file | ios, mac
<a href="/actions/team_id/">team_id</a> | Specify the Team ID you want to use for the Apple Developer Portal | ios
<a href="/actions/backup_xcarchive/">backup_xcarchive</a> | Save your [zipped] xcarchive elsewhere from default path | ios, mac
<a href="/actions/pod_lib_lint/">pod_lib_lint</a> | Pod lib lint | ios, mac
<a href="/actions/erb/">erb</a> | Allows to Generate output files based on ERB templates | ios, android, mac
<a href="/actions/download/">download</a> | Download a file from a remote server (e.g. JSON file) | ios, android, mac
<a href="/actions/rocket/">rocket</a> | Outputs ascii-art for a rocket 🚀 | ios, android, mac
<a href="/actions/debug/">debug</a> | Print out an overview of the lane context values | ios, android, mac
<a href="/actions/make_changelog_from_jenkins/">make_changelog_from_jenkins</a> | Generate a changelog using the Changes section from the current Jenkins build | ios, android, mac
<a href="/actions/pod_push/">pod_push</a> | Push a Podspec to Trunk or a private repository | ios, mac
<a href="/actions/dsym_zip/">dsym_zip</a> | Creates a zipped dSYM in the project root from the .xcarchive | ios, mac
<a href="/actions/ensure_no_debug_code/">ensure_no_debug_code</a> | Ensures the given text is nowhere in the code base | ios, android, mac
<a href="/actions/cloc/">cloc</a> | Generates a Code Count that can be read by Jenkins (xml format) | ios, mac
<a href="/actions/team_name/">team_name</a> | Set a team to use by its name | ios
<a href="/actions/scp/">scp</a> | Transfer files via SCP | ios, android, mac
<a href="/actions/verify_build/">verify_build</a> | Able to verify various settings in ipa file | ios
<a href="/actions/install_on_device/">install_on_device</a> | Installs an .ipa file on a connected iOS-device via usb or wifi | ios
<a href="/actions/version_get_podspec/">version_get_podspec</a> | Receive the version number from a podspec file | ios, mac
<a href="/actions/rsync/">rsync</a> | Rsync files from :source to :destination | ios, android, mac
<a href="/actions/adb_devices/">adb_devices</a> | Get an array of Connected android device serials | android
<a href="/actions/dotgpg_environment/">dotgpg_environment</a> | Reads in production secrets set in a dotgpg file and puts them in ENV | ios, android, mac
<a href="/actions/jira/">jira</a> | Leave a comment on JIRA tickets | ios, android, mac
<a href="/actions/read_podspec/">read_podspec</a> | Loads a CocoaPods spec as JSON | ios, mac
<a href="/actions/ssh/">ssh</a> | Allows remote command execution using ssh | ios, android, mac
<a href="/actions/appetize_viewing_url_generator/">appetize_viewing_url_generator</a> | Generate an URL for appetize simulator | ios
<a href="/actions/install_xcode_plugin/">install_xcode_plugin</a> | Install an Xcode plugin for the current user | ios, mac
<a href="/actions/add_extra_platforms/">add_extra_platforms</a> | Modify the default list of supported platforms | ios, android, mac
<a href="/actions/clipboard/">clipboard</a> | Copies a given string into the clipboard. Works only on macOS | ios, android, mac
<a href="/actions/build_and_upload_to_appetize/">build_and_upload_to_appetize</a> | Generate and upload an ipa file to appetize.io | ios
<a href="/actions/update_icloud_container_identifiers/">update_icloud_container_identifiers</a> | This action changes the iCloud container identifiers in the entitlements file | ios
<a href="/actions/sh/">sh</a> | Runs a shell command | ios, android, mac
<a href="/actions/println/">println</a> | Alias for the `puts` action | ios, android, mac
<a href="/actions/create_app_on_managed_play_store/">create_app_on_managed_play_store</a> | Create Managed Google Play Apps | android
<a href="/actions/plugin_scores/">plugin_scores</a> | [31mNo description provided[0m | ios, android, mac
<a href="/actions/environment_variable/">environment_variable</a> | Sets/gets env vars for Fastlane.swift. Don't use in ruby, use `ENV[key] = val` | ios, android, mac
<a href="/actions/setup_circle_ci/">setup_circle_ci</a> | Setup the keychain and match to work with CircleCI | ios, mac
<a href="/actions/min_fastlane_version/">min_fastlane_version</a> | Verifies the minimum fastlane version required | ios, android, mac
<a href="/actions/ruby_version/">ruby_version</a> | Verifies the minimum ruby version required | ios, android, mac
<a href="/actions/validate_play_store_json_key/">validate_play_store_json_key</a> | Validate that the Google Play Store `json_key` works | android
<a href="/actions/setup_travis/">setup_travis</a> | Setup the keychain and match to work with Travis CI | ios, mac
<a href="/actions/setup_ci/">setup_ci</a> | Setup the keychain and match to work with CI | ios, mac
<a href="/actions/get_managed_play_store_publishing_rights/">get_managed_play_store_publishing_rights</a> | Obtain publishing rights for custom apps on Managed Google Play Store | android
<a href="/actions/modify_services/">modify_services</a> | Modifies the services of the app created on Developer Portal | ios
<a href="/actions/spaceship_logs/">spaceship_logs</a> | Find, print, and copy Spaceship logs | ios, android, mac
<a href="/actions/google_play_track_version_codes/">google_play_track_version_codes</a> | Retrieves version codes for a Google Play track | android
<a href="/actions/ensure_bundle_exec/">ensure_bundle_exec</a> | Raises an exception if not using `bundle exec` to run fastlane | ios, android, mac
<a href="/actions/opt_out_usage/">opt_out_usage</a> | This will stop uploading the information which actions were run | ios, android, mac
<a href="/actions/echo/">echo</a> | Alias for the `puts` action | ios, android, mac



# Deprecated

Action | Description | Supported Platforms
---|---|---
<a href="/actions/hockey/">hockey</a> | Refer to [App Center](https://github.com/Microsoft/fastlane-plugin-appcenter/) | ios, android, mac
<a href="/actions/badge/">badge</a> | Automatically add a badge to your app icon | ios, android, mac
<a href="/actions/s3/">s3</a> | Generates a plist file and uploads all to AWS S3 | ios
<a href="/actions/notify/">notify</a> | Shows a macOS notification - use `notification` instead | ios, android, mac
<a href="/actions/update_project_code_signing/">update_project_code_signing</a> | Updated code signing settings from 'Automatic' to a specific profile | ios
<a href="/actions/ipa/">ipa</a> | Easily build and sign your app using shenzhen | ios
<a href="/actions/upload_symbols_to_sentry/">upload_symbols_to_sentry</a> | Upload dSYM symbolication files to Sentry | ios
<a href="/actions/opt_out_crash_reporting/">opt_out_crash_reporting</a> | This will prevent reports from being uploaded when _fastlane_ crashes | ios, android, mac



