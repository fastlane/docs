<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

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

For _fastlane_ plugins, check out the [available plugins](https://docs.fastlane.tools/plugins/available-plugins) page.

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
- [Misc](#misc)
- [Deprecated](#deprecated)
- [Plugins](https://docs.fastlane.tools/plugins/available-plugins)


# Testing

Action | Description
---|---
<a href="/actions/scan">scan</a> | Alias for the `run_tests` action
<a href="/actions/slather">slather</a> | Use slather to generate a code coverage report
<a href="/actions/swiftlint">swiftlint</a> | Run swift code validation using SwiftLint
<a href="/actions/xcov">xcov</a> | Nice code coverage reports without hassle
<a href="/actions/sonar">sonar</a> | Invokes sonar-scanner to programmatically run SonarQube analysis
<a href="/actions/oclint">oclint</a> | Lints implementation files with OCLint
<a href="/actions/gcovr">gcovr</a> | Runs test coverage reports for your Xcode project
<a href="/actions/lcov">lcov</a> | Generates coverage data using lcov
<a href="/actions/appium">appium</a> | Run UI test by Appium with RSpec
<a href="/actions/xctool">xctool</a> | Run tests using xctool
<a href="/actions/xcode_server_get_assets">xcode_server_get_assets</a> | Downloads Xcode Bot assets like the `.xcarchive` and logs
<a href="/actions/run_tests">run_tests</a> | Easily run tests of your iOS app (via _scan_)



# Building

Action | Description
---|---
<a href="/actions/gym">gym</a> | Alias for the `build_ios_app` action
<a href="/actions/cocoapods">cocoapods</a> | Runs `pod install` for the project
<a href="/actions/gradle">gradle</a> | All gradle related actions, including building and testing your Android app
<a href="/actions/clear_derived_data">clear_derived_data</a> | Deletes the Xcode Derived Data
<a href="/actions/adb">adb</a> | Run ADB Actions
<a href="/actions/xcversion">xcversion</a> | Select an Xcode to use by version specifier
<a href="/actions/xcodebuild">xcodebuild</a> | Use the `xcodebuild` command to build and sign your app
<a href="/actions/carthage">carthage</a> | Runs `carthage` for your project
<a href="/actions/xcode_select">xcode_select</a> | Change the xcode-path to use. Useful for beta versions of Xcode
<a href="/actions/ensure_xcode_version">ensure_xcode_version</a> | Ensure the selected Xcode version with xcode-select matches a value
<a href="/actions/clean_cocoapods_cache">clean_cocoapods_cache</a> | Remove the cache for pods
<a href="/actions/verify_xcode">verify_xcode</a> | Verifies that the Xcode installation is properly signed by Apple
<a href="/actions/xcode_install">xcode_install</a> | Make sure a certain version of Xcode is installed
<a href="/actions/verify_pod_keys">verify_pod_keys</a> | Verifies all keys referenced from the Podfile are non-empty
<a href="/actions/xctest">xctest</a> | Runs tests on the given simulator
<a href="/actions/build_app">build_app</a> | Alias for the `build_ios_app` action
<a href="/actions/xcarchive">xcarchive</a> | Archives the project using `xcodebuild`
<a href="/actions/xcbuild">xcbuild</a> | Builds the project using `xcodebuild`
<a href="/actions/xcclean">xcclean</a> | Cleans the project using `xcodebuild`
<a href="/actions/xcexport">xcexport</a> | Exports the project using `xcodebuild`
<a href="/actions/build_ios_app">build_ios_app</a> | Easily build and sign your app (via _gym_)
<a href="/actions/build_android_app">build_android_app</a> | Alias for the `gradle` action



# Screenshots

Action | Description
---|---
<a href="/actions/snapshot">snapshot</a> | Alias for the `capture_ios_screenshots` action
<a href="/actions/screengrab">screengrab</a> | Alias for the `capture_android_screenshots` action
<a href="/actions/frameit">frameit</a> | Alias for the `frame_screenshots` action
<a href="/actions/frame_screenshots">frame_screenshots</a> | Adds device frames around all screenshots (via _frameit_)
<a href="/actions/capture_android_screenshots">capture_android_screenshots</a> | Automated localized screenshots of your Android app (via _screengrab_)
<a href="/actions/capture_ios_screenshots">capture_ios_screenshots</a> | Generate new localized screenshots on multiple devices (via _snapshot_)
<a href="/actions/capture_screenshots">capture_screenshots</a> | Alias for the `capture_ios_screenshots` action



# Project

Action | Description
---|---
<a href="/actions/increment_build_number">increment_build_number</a> | Increment the build number of your project
<a href="/actions/set_info_plist_value">set_info_plist_value</a> | Sets value to Info.plist of your project as native Ruby data structures
<a href="/actions/get_version_number">get_version_number</a> | Get the version number of your project
<a href="/actions/get_info_plist_value">get_info_plist_value</a> | Returns value from Info.plist of your project as native Ruby data structures
<a href="/actions/update_info_plist">update_info_plist</a> | Update a Info.plist file with bundle identifier and display name
<a href="/actions/update_app_identifier">update_app_identifier</a> | Update the project's bundle identifier
<a href="/actions/get_build_number">get_build_number</a> | Get the build number of your project
<a href="/actions/increment_version_number">increment_version_number</a> | Increment the version number of your project
<a href="/actions/update_project_team">update_project_team</a> | Update Xcode Development Team ID
<a href="/actions/update_app_group_identifiers">update_app_group_identifiers</a> | This action changes the app group identifiers in the entitlements file
<a href="/actions/get_ipa_info_plist_value">get_ipa_info_plist_value</a> | Returns a value from Info.plist inside a .ipa file
<a href="/actions/recreate_schemes">recreate_schemes</a> | Recreate not shared Xcode project schemes
<a href="/actions/update_url_schemes">update_url_schemes</a> | Updates the URL schemes in the given Info.plist
<a href="/actions/set_build_number_repository">set_build_number_repository</a> | Set the build number from the current repository
<a href="/actions/set_pod_key">set_pod_key</a> | Sets a value for a key with cocoapods-keys



# Code Signing

Action | Description
---|---
<a href="/actions/sigh">sigh</a> | Alias for the `get_provisioning_profile` action
<a href="/actions/match">match</a> | Alias for the `sync_code_signing` action
<a href="/actions/cert">cert</a> | Alias for the `get_certificates` action
<a href="/actions/import_certificate">import_certificate</a> | Import certificate from inputfile into a keychain
<a href="/actions/update_project_provisioning">update_project_provisioning</a> | Update projects code signing settings from your provisioning profile
<a href="/actions/resign">resign</a> | Codesign an existing ipa file
<a href="/actions/register_devices">register_devices</a> | Registers new devices to the Apple Dev Portal
<a href="/actions/automatic_code_signing">automatic_code_signing</a> | Configures Xcode's Codesigning options
<a href="/actions/register_device">register_device</a> | Registers a new device to the Apple Dev Portal
<a href="/actions/sync_code_signing">sync_code_signing</a> | Easily sync your certificates and profiles across your team (via _match_)
<a href="/actions/get_certificates">get_certificates</a> | Create new iOS code signing certificates (via _cert_)
<a href="/actions/get_provisioning_profile">get_provisioning_profile</a> | Generates a provisioning profile, saving it in the current folder (via _sigh_)



# Documentation

Action | Description
---|---
<a href="/actions/jazzy">jazzy</a> | Generate docs using Jazzy
<a href="/actions/appledoc">appledoc</a> | Generate Apple-like source code documentation from the source code



# Beta

Action | Description
---|---
<a href="/actions/pilot">pilot</a> | Alias for the `upload_to_testflight` action
<a href="/actions/crashlytics">crashlytics</a> | Upload a new build to Crashlytics Beta
<a href="/actions/hockey">hockey</a> | Upload a new build to HockeyApp
<a href="/actions/testflight">testflight</a> | Alias for the `upload_to_testflight` action
<a href="/actions/deploygate">deploygate</a> | Upload a new build to [DeployGate](https://deploygate.com/)
<a href="/actions/apteligent">apteligent</a> | Upload dSYM file to Apteligent (Crittercism)
<a href="/actions/appetize">appetize</a> | Upload your app to Appetize.io to stream it in the browser
<a href="/actions/testfairy">testfairy</a> | Upload a new build to TestFairy
<a href="/actions/appaloosa">appaloosa</a> | Upload your app to Appaloosa Store
<a href="/actions/nexus_upload">nexus_upload</a> | Upload a file to Sonatype Nexus platform
<a href="/actions/installr">installr</a> | Upload a new build to Installr
<a href="/actions/set_changelog">set_changelog</a> | Set the changelog for all languages on iTunes Connect
<a href="/actions/splunkmint">splunkmint</a> | Upload dSYM file to Splunk MINT
<a href="/actions/tryouts">tryouts</a> | Upload a new build to Tryouts
<a href="/actions/podio_item">podio_item</a> | Creates or updates an item within your Podio app
<a href="/actions/upload_to_testflight">upload_to_testflight</a> | Upload a new binary to iTunes Connect for TestFlight beta testing (via _pilot_)



# Push

Action | Description
---|---
<a href="/actions/pem">pem</a> | Alias for the `get_push_certificate` action
<a href="/actions/update_urban_airship_configuration">update_urban_airship_configuration</a> | Set the Urban Airship plist configuration values
<a href="/actions/onesignal">onesignal</a> | Create a new OneSignal application
<a href="/actions/get_push_certificate">get_push_certificate</a> | Ensure a valid push profile is active, creating a new one if needed (via _pem_)



# Releasing your app

Action | Description
---|---
<a href="/actions/deliver">deliver</a> | Alias for the `upload_to_app_store` action
<a href="/actions/supply">supply</a> | Alias for the `upload_to_play_store` action
<a href="/actions/appstore">appstore</a> | Alias for the `upload_to_app_store` action
<a href="/actions/upload_to_play_store">upload_to_play_store</a> | Upload metadata, screenshots and binaries to Google Play (via _supply_)
<a href="/actions/upload_to_app_store">upload_to_app_store</a> | Upload metadata and binary to iTunes Connect (via _deliver_)



# Source Control

Action | Description
---|---
<a href="/actions/ensure_git_status_clean">ensure_git_status_clean</a> | Raises an exception if there are uncommitted git changes
<a href="/actions/git_branch">git_branch</a> | Returns the name of the current git branch, possibly as managed by CI ENV vars
<a href="/actions/last_git_commit">last_git_commit</a> | Return last git commit hash, abbreviated commit hash, commit message and author
<a href="/actions/reset_git_repo">reset_git_repo</a> | Resets git repo to a clean state by discarding uncommitted changes
<a href="/actions/changelog_from_git_commits">changelog_from_git_commits</a> | Collect git commit messages into a changelog
<a href="/actions/number_of_commits">number_of_commits</a> | Return the number of commits in current git branch
<a href="/actions/git_pull">git_pull</a> | Executes a simple git pull command
<a href="/actions/last_git_tag">last_git_tag</a> | Get the most recent git tag
<a href="/actions/push_to_git_remote">push_to_git_remote</a> | Push local changes to the remote branch
<a href="/actions/add_git_tag">add_git_tag</a> | This will add an annotated git tag to the current branch
<a href="/actions/commit_version_bump">commit_version_bump</a> | Creates a 'Version Bump' commit. Run after `increment_build_number`
<a href="/actions/git_tag_exists">git_tag_exists</a> | Checks if the git tag with the given name exists in the current repo
<a href="/actions/ensure_git_branch">ensure_git_branch</a> | Raises an exception if not on a specific git branch
<a href="/actions/git_commit">git_commit</a> | Directly commit the given file with the given message
<a href="/actions/push_git_tags">push_git_tags</a> | Push local tags to the remote - this will only push tags
<a href="/actions/git_add">git_add</a> | Directly add the given file or all files
<a href="/actions/get_build_number_repository">get_build_number_repository</a> | Get the build number from the current repository
<a href="/actions/set_github_release">set_github_release</a> | This will create a new release on GitHub and upload assets for it
<a href="/actions/create_pull_request">create_pull_request</a> | This will create a new pull request on GitHub
<a href="/actions/get_github_release">get_github_release</a> | This will verify if a given release version is available on GitHub
<a href="/actions/hg_ensure_clean_status">hg_ensure_clean_status</a> | Raises an exception if there are uncommitted hg changes
<a href="/actions/hg_commit_version_bump">hg_commit_version_bump</a> | This will commit a version bump to the hg repo
<a href="/actions/hg_push">hg_push</a> | This will push changes to the remote hg repository
<a href="/actions/hg_add_tag">hg_add_tag</a> | This will add a hg tag to the current branch
<a href="/actions/github_api">github_api</a> | Call a GitHub API endpoint and get the resulting JSON response
<a href="/actions/commit_github_file">commit_github_file</a> | This will commit a file directly on GitHub via the API



# Notifications

Action | Description
---|---
<a href="/actions/slack">slack</a> | Send a success/error message to your Slack group
<a href="/actions/notification">notification</a> | Display a macOS notification with custom message and title
<a href="/actions/hipchat">hipchat</a> | Send a error/success message to HipChat
<a href="/actions/mailgun">mailgun</a> | Send a success/error message to an email group
<a href="/actions/chatwork">chatwork</a> | Send a success/error message to ChatWork
<a href="/actions/ifttt">ifttt</a> | Connect to the IFTTT Maker Channel. https://ifttt.com/maker
<a href="/actions/flock">flock</a> | Send a message to a Flock group
<a href="/actions/twitter">twitter</a> | Post a tweet on Twitter.com
<a href="/actions/typetalk">typetalk</a> | Post a message to Typetalk



# Misc

Action | Description
---|---
<a href="/actions/puts">puts</a> | Prints out the given text
<a href="/actions/default_platform">default_platform</a> | Defines a default platform to not have to specify the platform
<a href="/actions/fastlane_version">fastlane_version</a> | Alias for the `min_fastlane_version` action
<a href="/actions/lane_context">lane_context</a> | An alias to `Actions.lane_context`
<a href="/actions/import">import</a> | Import another Fastfile to use its lanes
<a href="/actions/import_from_git">import_from_git</a> | Import another Fastfile from a remote git repository to use its lanes
<a href="/actions/clean_build_artifacts">clean_build_artifacts</a> | Deletes files created as result of running gym, cert, sigh or download_dsyms
<a href="/actions/skip_docs">skip_docs</a> | Skip the creation of the fastlane/README.md file when running fastlane
<a href="/actions/produce">produce</a> | Alias for the `create_app_online` action
<a href="/actions/is_ci">is_ci</a> | Is the current run being executed on a CI system, like Jenkins or Travis
<a href="/actions/setup_jenkins">setup_jenkins</a> | Setup xcodebuild, gym and scan for easier Jenkins integration
<a href="/actions/unlock_keychain">unlock_keychain</a> | Unlock a keychain
<a href="/actions/update_fastlane">update_fastlane</a> | Makes sure fastlane-tools are up-to-date when running fastlane
<a href="/actions/precheck">precheck</a> | Alias for the `check_app_store_metadata` action
<a href="/actions/bundle_install">bundle_install</a> | This action runs `bundle install` (if available)
<a href="/actions/upload_symbols_to_crashlytics">upload_symbols_to_crashlytics</a> | Upload dSYM symbolication files to Crashlytics
<a href="/actions/create_keychain">create_keychain</a> | Create a new Keychain
<a href="/actions/delete_keychain">delete_keychain</a> | Delete keychains and remove them from the search list
<a href="/actions/latest_testflight_build_number">latest_testflight_build_number</a> | Fetches most recent build number from TestFlight
<a href="/actions/backup_file">backup_file</a> | This action backs up your file to "[path].back"
<a href="/actions/copy_artifacts">copy_artifacts</a> | Copy and save your build artifacts (useful when you use reset_git_repo)
<a href="/actions/prompt">prompt</a> | Ask the user for a value or for confirmation
<a href="/actions/reset_simulator_contents">reset_simulator_contents</a> | Shutdown and reset running simulators
<a href="/actions/restore_file">restore_file</a> | This action restore your file that was backuped with the `backup_file` action
<a href="/actions/say">say</a> | This action speaks out loud the given text
<a href="/actions/zip">zip</a> | Compress a file or folder to a zip
<a href="/actions/danger">danger</a> | Runs `danger` for the project
<a href="/actions/artifactory">artifactory</a> | This action uploads an artifact to artifactory
<a href="/actions/download_dsyms">download_dsyms</a> | Download dSYM files from Apple iTunes Connect for Bitcode apps
<a href="/actions/version_bump_podspec">version_bump_podspec</a> | Increment or set the version in a podspec file
<a href="/actions/team_id">team_id</a> | Specify the Team ID you want to use for the Apple Developer Portal
<a href="/actions/backup_xcarchive">backup_xcarchive</a> | Save your [zipped] xcarchive elsewhere from default path
<a href="/actions/pod_lib_lint">pod_lib_lint</a> | Pod lib lint
<a href="/actions/erb">erb</a> | Allows to Generate output files based on ERB templates
<a href="/actions/download">download</a> | Download a file from a remote server (e.g. JSON file)
<a href="/actions/rocket">rocket</a> | Outputs ascii-art for a rocket 🚀
<a href="/actions/debug">debug</a> | Print out an overview of the lane context values
<a href="/actions/make_changelog_from_jenkins">make_changelog_from_jenkins</a> | Generate a changelog using the Changes section from the current Jenkins build
<a href="/actions/pod_push">pod_push</a> | Push a Podspec to Trunk or a private repository
<a href="/actions/dsym_zip">dsym_zip</a> | Creates a zipped dSYM in the project root from the .xcarchive
<a href="/actions/ensure_no_debug_code">ensure_no_debug_code</a> | Ensures the given text is nowhere in the code base
<a href="/actions/cloc">cloc</a> | Generates a Code Count that can be read by Jenkins (xml format)
<a href="/actions/team_name">team_name</a> | Set a team to use by its name
<a href="/actions/scp">scp</a> | Transfer files via SCP
<a href="/actions/verify_build">verify_build</a> | Able to verify various settings in ipa file
<a href="/actions/install_on_device">install_on_device</a> | Installs an .ipa file on a connected iOS-device via usb or wifi
<a href="/actions/version_get_podspec">version_get_podspec</a> | Receive the version number from a podspec file
<a href="/actions/rsync">rsync</a> | Rsync files from :source to :destination
<a href="/actions/adb_devices">adb_devices</a> | Get an array of Connected android device serials
<a href="/actions/dotgpg_environment">dotgpg_environment</a> | Reads in production secrets set in a dotgpg file and puts them in ENV
<a href="/actions/jira">jira</a> | Leave a comment on JIRA tickets
<a href="/actions/read_podspec">read_podspec</a> | Loads a CocoaPods spec as JSON
<a href="/actions/ssh">ssh</a> | Allows remote command execution using ssh
<a href="/actions/app_store_build_number">app_store_build_number</a> | Returns the current build_number of either live or edit version
<a href="/actions/appetize_viewing_url_generator">appetize_viewing_url_generator</a> | Generate an URL for appetize simulator
<a href="/actions/install_xcode_plugin">install_xcode_plugin</a> | Install an Xcode plugin for the current user
<a href="/actions/add_extra_platforms">add_extra_platforms</a> | Modify the default list of supported platforms
<a href="/actions/clipboard">clipboard</a> | Copies a given string into the clipboard. Works only on macOS
<a href="/actions/build_and_upload_to_appetize">build_and_upload_to_appetize</a> | Generate and upload an ipa file to appetize.io
<a href="/actions/update_icloud_container_identifiers">update_icloud_container_identifiers</a> | This action changes the iCloud container identifiers in the entitlements file
<a href="/actions/sh">sh</a> | Runs a shell command
<a href="/actions/google_play_track_version_codes">google_play_track_version_codes</a> | Retrieves version codes for a Google Play track
<a href="/actions/opt_out_crash_reporting">opt_out_crash_reporting</a> | This will prevent reports from being uploaded when _fastlane_ crashes
<a href="/actions/modify_services">modify_services</a> | Modifies the services of the app created on Developer Portal
<a href="/actions/create_app_online">create_app_online</a> | Creates the given application on iTC and the Dev Portal (via _produce_)
<a href="/actions/min_fastlane_version">min_fastlane_version</a> | Verifies the minimum fastlane version required
<a href="/actions/plugin_scores">plugin_scores</a> | [31mNo description provided[0m
<a href="/actions/setup_travis">setup_travis</a> | Setup the keychain and match to work with Travis CI
<a href="/actions/environment_variable">environment_variable</a> | Sets/gets env vars for Fastlane.swift. Don't use in ruby, use `ENV[key] = val`
<a href="/actions/ruby_version">ruby_version</a> | Verifies the minimum ruby version required
<a href="/actions/opt_out_usage">opt_out_usage</a> | This will stop uploading the information which actions were run
<a href="/actions/setup_circle_ci">setup_circle_ci</a> | Setup the keychain and match to work with CircleCI
<a href="/actions/check_app_store_metadata">check_app_store_metadata</a> | Check your app's metadata before you submit your app to review (via _precheck_)



# Deprecated

Action | Description
---|---
<a href="/actions/badge">badge</a> | Automatically add a badge to your app icon
<a href="/actions/s3">s3</a> | Generates a plist file and uploads all to AWS S3
<a href="/actions/notify">notify</a> | Shows a macOS notification - use `notification` instead
<a href="/actions/update_project_code_signing">update_project_code_signing</a> | Updated code signing settings from 'Automatic' to a specific profile
<a href="/actions/ipa">ipa</a> | Easily build and sign your app using shenzhen
<a href="/actions/upload_symbols_to_sentry">upload_symbols_to_sentry</a> | Upload dSYM symbolication files to Sentry



