{!docs/includes/setup-fastlane-header.md!}

# Other

Other advanced topics that didn't fit anywhere else:

# Environment Variables

You can define environment variables in a `.env` or `.env.default` file in the same directory as your `Fastfile`. Environment variables are loaded using [dotenv](https://github.com/bkeepers/dotenv). Here's an example:

```no-highlight
WORKSPACE=YourApp.xcworkspace
HOCKEYAPP_API_TOKEN=your-hockey-api-token
```

_fastlane_ also has a `--env` option that allows loading of environment specific `dotenv` files. `.env` and `.env.default` will be loaded before environment specific `dotenv` files are loaded. The naming convention for environment specific `dotenv` files is `.env.<environment>`

For example, `fastlane <lane-name> --env development` will load `.env`, `.env.default`, and `.env.development`

Alternatively, as environment variables are not a fastlane specific thing, you can also use standard methods to set them:

```
DELIVER_USER="felix@krausefx.com" fastlane test
```

or

```
export DELIVER_USER="felix@krausefx.com";
fastlane test
```

Although it kind of defeats the purpose of using them in the first place (not to have their content in any files), you can also set them in your `Fastfile`:

```
ENV["DELIVER_USER"] = "felix@krausefx.com"
```

# Adding Credentials

You can add credentials for use by _fastlane_ to your keychain using the [CredentialsManager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) command line interface. This is useful for situations like CI environments.

**Adding a Credential**
```no-highlight
fastlane fastlane-credentials add --username felix@krausefx.com
Password: *********
Credential felix@krausefx.com:********* added to keychain.
```

**Removing a Credential**
```no-highlight
fastlane fastlane-credentials remove --username felix@krausefx.com
password has been deleted.
```

# Manually manage the fastlane match Repo

Most users can benefit from _match_'s automatic management of the repo that stores certificates and provisioning profiles. From time to time, it may be necessary to manually change the files in this repo.

For example, _fastlane_ requires admin access to the Apple Developer account to generate the appropriate files. If you are provided with an updated certificate or profile but do not have admin access, you can manually edit the repo.

> **Warning:** Manually editing your _match_ repo can introduce unexpected behavior and is not recommended. Proceed with caution.

<details>
<summary>Instructions</summary>



### Overview

Because:

1. _fastlane_ encrypts the repo, and
2. _fastlane_ doesn't support manual edits to the repo

it's necessary to manually decrypt, then modify, then encrypt, the repo to make any changes.

> These instructions presuppose you already have _fastlane_ _match_ configured correctly.

### 🔓 Decryption Instructions

The easiest way to decrypt the repo is to use the _fastlane_ _match_ `GitHelper` class. You can do this from an interactive Ruby console:

```bash
$ bundle console
irb(main):001:0>
```

Then, require _match_ and set the appropriate parameters:

```ruby
irb(main):001:0> require 'match'
irb(main):002:0> git_url = 'https://github.com/fastlane/example-certificate-repo'
=> "https://github.com/fastlane/example-certificate-repo"
irb(main):003:0> shallow_clone = false
=> false
irb(main):004:0> manual_password = 'example-password'
=> "example-password"
```

Now call `GitHelper.clone`, which will clone and decrypt the repo for you. Assign the return value to `workspace`, which we'll need later when we re-encrypt:

```ruby
irb(main):005:0> workspace = Match::GitHelper.clone(git_url, shallow_clone, manual_password: manual_password)
[14:49:30]: Cloning remote git repo...
[14:49:31]: 🔓  Successfully decrypted certificates repo
=> "/var/folders/0j/29ytx6wx0fg86sznfb4mqdph0000gn/T/d20170314-14350-11hmdro"
```

The above example checks out the `master` branch by default. A common _match_ pattern is to create a separate branch per each developer team (the name of the branch being the team identifier). You can optionally pass in the branch name as a parameter to the `clone` method:

```ruby
irb(main):005:0> workspace = Match::GitHelper.clone(git_url, shallow_clone, manual_password: manual_password, branch: 'ABCDE12345')
```

The directory beginning with `/var/folders` contains the decrypted git repo. Modify it as needed.

If you are updating a `.p12` file, ensure it's exported from the keychain without a password, since _match_ doesn't support importing private keys with a password.

> **Warning:** Do *not* commit your changes. Allow _fastlane_ to do that for you.

Once your changes are made, we'll need to encrypt the repo and push it.

### 🔒 Encryption Instructions

In the Ruby console, call `GitHelper.commit_changes`, passing in the commit message you want. For example:

```ruby
irb(main):006:0> Match::GitHelper.commit_changes(workspace, "remove password from p12 file", git_url)
```
Again, pass in the branch name if your changes are not on `master`:

```ruby
irb(main):006:0> Match::GitHelper.commit_changes(workspace, "remove password from p12 file", git_url, 'ABCDE12345')
```

Your changes will be encrypted, committed, and pushed.

> **Note:** If your keychain doesn't include the encryption passcode, you may be prompted for it. If so, just enter the same password you used to decrypt it.

</details>