<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/match_nuke.rb
-->

# match_nuke


Easily nuke your certificate and provisioning profiles (via _match_)




> Use the match_nuke action to revoke your certificates and provisioning profiles.<br>Don't worry, apps that are already available in the App Store / TestFlight will still work.<br>Builds distributed via Ad Hoc or Enterprise will be disabled after nuking your account, so you'll have to re-upload a new build.<br>After clearing your account you'll start from a clean state, and you can run match to generate your certificates and profiles again.<br>More information: https://docs.fastlane.tools/actions/match/


match_nuke ||
---|---
Supported platforms | ios, mac
Author | @crazymanish



## 2 Examples

```ruby
match_nuke(type: "development")
```

```ruby
match_nuke(type: "development", api_key: app_store_connect_api_key)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `type` | Define the profile type, can be appstore, adhoc, development, enterprise, developer_id, mac_installer_distribution, developer_id_installer | `development`
  `additional_cert_types` | Create additional cert types needed for macOS installers (valid values: mac_installer_distribution, developer_id_installer) | 
  `readonly` | Only fetch existing certificates and profiles, don't generate new ones | `false`
  `generate_apple_certs` | Create a certificate type for Xcode 11 and later (Apple Development or Apple Distribution) | [*](#parameters-legend-dynamic)
  `skip_provisioning_profiles` | Skip syncing provisioning profiles | `false`
  `app_identifier` | The bundle identifier(s) of your app (comma-separated string or array of strings) | [*](#parameters-legend-dynamic)
  `api_key_path` | Path to your App Store Connect API Key JSON file (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-json-file) | 
  `api_key` | Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option) | 
  `username` | Your Apple ID Username | [*](#parameters-legend-dynamic)
  `team_id` | The ID of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `team_name` | The name of your Developer Portal team if you're in multiple teams | [*](#parameters-legend-dynamic)
  `storage_mode` | Define where you want to store your certificates | `git`
  `git_url` | URL to the git repo containing all the certificates | 
  `git_branch` | Specific git branch to use | `master`
  `git_full_name` | git user full name to commit | 
  `git_user_email` | git user email to commit | 
  `shallow_clone` | Make a shallow clone of the repository (truncate the history to 1 revision) | `false`
  `clone_branch_directly` | Clone just the branch specified, instead of the whole repo. This requires that the branch already exists. Otherwise the command will fail | `false`
  `git_basic_authorization` | Use a basic authorization header to access the git repo (e.g.: access via HTTPS, GitHub Actions, etc), usually a string in Base64 | 
  `git_bearer_authorization` | Use a bearer authorization header to access the git repo (e.g.: access to an Azure DevOps repository), usually a string in Base64 | 
  `git_private_key` | Use a private key to access the git repo (e.g.: access to GitHub repository via Deploy keys), usually a id_rsa named file or the contents hereof | 
  `google_cloud_bucket_name` | Name of the Google Cloud Storage bucket to use | 
  `google_cloud_keys_file` | Path to the gc_keys.json file | 
  `google_cloud_project_id` | ID of the Google Cloud project to use for authentication | 
  `skip_google_cloud_account_confirmation` | Skips confirming to use the system google account | `false`
  `s3_region` | Name of the S3 region | 
  `s3_access_key` | S3 access key | 
  `s3_secret_access_key` | S3 secret access key | 
  `s3_bucket` | Name of the S3 bucket | 
  `s3_object_prefix` | Prefix to be used on all objects uploaded to S3 | 
  `s3_skip_encryption` | Skip encryption of all objects uploaded to S3. WARNING: only enable this on S3 buckets with sufficiently restricted permissions and server-side encryption enabled. See https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingEncryption.html | `false`
  `gitlab_project` | GitLab Project Path (i.e. 'gitlab-org/gitlab') | 
  `gitlab_host` | GitLab Host (i.e. 'https://gitlab.com') | `https://gitlab.com`
  `job_token` | GitLab CI_JOB_TOKEN | 
  `private_token` | GitLab Access Token | 
  `keychain_name` | Keychain the items should be imported to | `login.keychain`
  `keychain_password` | This might be required the first time you access certificates on a new mac. For the login/default keychain this is your macOS account password | 
  `force` | Renew the provisioning profiles every time you run match | `false`
  `force_for_new_devices` | Renew the provisioning profiles if the device count on the developer portal has changed. Ignored for profile types 'appstore' and 'developer_id' | `false`
  `include_mac_in_profiles` | Include Apple Silicon Mac devices in provisioning profiles for iOS/iPadOS apps | `false`
  `include_all_certificates` | Include all matching certificates in the provisioning profile. Works only for the 'development' provisioning profile type | `false`
  `certificate_id` | Select certificate by id. Useful if multiple certificates are stored in one place | 
  `force_for_new_certificates` | Renew the provisioning profiles if the certificate count on the developer portal has changed. Works only for the 'development' provisioning profile type. Requires 'include_all_certificates' option to be 'true' | `false`
  `skip_confirmation` | Disables confirmation prompts during nuke, answering them with yes | `false`
  `safe_remove_certs` | Remove certs from repository during nuke without revoking them on the developer portal | `false`
  `skip_docs` | Skip generation of a README.md for the created git repository | `false`
  `platform` | Set the provisioning profile's platform to work with (i.e. ios, tvos, macos, catalyst) | [*](#parameters-legend-dynamic)
  `derive_catalyst_app_identifier` | Enable this if you have the Mac Catalyst capability enabled and your project was created with Xcode 11.3 or earlier. Prepends 'maccatalyst.' to the app identifier for the provisioning profile mapping | `false`
  `template_name` | The name of provisioning profile template. If the developer account has provisioning profile templates (aka: custom entitlements), the template name can be found by inspecting the Entitlements drop-down while creating/editing a provisioning profile (e.g. "Apple Pay Pass Suppression Development") | 
  `profile_name` | A custom name for the provisioning profile. This will replace the default provisioning profile name if specified | 
  `fail_on_name_taken` | Should the command fail if it was about to create a duplicate of an existing provisioning profile. It can happen due to issues on Apple Developer Portal, when profile to be recreated was not properly deleted first | `false`
  `skip_certificate_matching` | Set to true if there is no access to Apple developer portal but there are certificates, keys and profiles provided. Only works with match import action | `false`
  `output_path` | Path in which to export certificates, key and profile | 
  `skip_set_partition_list` | Skips setting the partition list (which can sometimes take a long time). Setting the partition list is usually needed to prevent Xcode from prompting to allow a cert to be used for signing | `false`
  `verbose` | Print out extra information and all commands | `false`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action match_nuke
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run match_nuke
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run match_nuke parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/match_nuke.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
