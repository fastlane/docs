# pem


Makes sure a valid push profile is active and creates a new one if needed




<p align="center">
  <img src="/img/actions/pem.png" height="110">
</p>

###### Automatically generate and renew your push notification profiles

Tired of manually creating and maintaining your push notification profiles for your iOS apps? Tired of generating a _pem_ file for your server?

_pem_ does all that for you, just by simply running _pem_.

_pem_ creates new .pem, .cer, and .p12 files to be uploaded to your push server if a valid push notification profile is needed. _pem_ does not cover uploading the file to your server.

To automate iOS Provisioning profiles you can use [match](https://github.com/fastlane/fastlane/tree/master/match).

-------

<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#how-does-it-work">How does it work?</a> &bull;
    <a href="#tips">Tips</a> &bull;
    <a href="#need-help">Need help?</a>
</p>

-------

<h5 align="center"><code>pem</code> is part of <a href="https://fastlane.tools">fastlane</a>: The easiest way to automate beta deployments and releases for your iOS and Android apps.</h5>

# Features
Well, it's actually just one: Generate the ``_pem_`` file for your server.

Check out this gif:

![img/actions/PEMRecording.gif](/img/actions/PEMRecording.gif)

# Usage

    fastlane pem

Yes, that's the whole command!

This does the following:

- Create a new signing request
- Create a new push certification
- Downloads the certificate
- Generates a new ```.pem``` file in the current working directory, which you can upload to your server

Note that ``_pem_`` will never revoke your existing certificates. _pem_ can't download any of your existing push certificates, as the private key is only available on the machine it was created on. 

If you already have a push certificate enabled, which is active for at least 30 more days, _pem_ will not create a new certificate. If you still want to create one, use the `force`:

    fastlane pem --force

You can pass parameters like this:

    fastlane pem -a com.krausefx.app -u username

If you want to generate a development certificate instead:

    fastlane pem --development

Set a password for your `p12` file:

    fastlane pem -p "MyPass"

You can specify a name for the output file:

    fastlane pem -o my.pem

To get a list of available options run:

    fastlane action pem


### Note about empty `p12` passwords and Keychain Access.app

_pem_ will produce a valid `p12` without specifying a password, or using the empty-string as the password.
While the file is valid, the Mac's Keychain Access will not allow you to open the file without specifying a passphrase.

Instead, you may verify the file is valid using OpenSSL:

    openssl pkcs12 -info -in my.p12

If you need the `p12` in your keychain, perhaps to test push with an app like [Knuff](https://github.com/KnuffApp/Knuff) or [Pusher](https://github.com/noodlewerk/NWPusher), you can use `openssl` to export the `p12` to _pem_ and back to `p12`:

    % openssl pkcs12 -in my.p12 -out my.pem
    Enter Import Password:
      <hit enter: the p12 has no password>
    MAC verified OK
    Enter PEM pass phrase:
      <enter a temporary password to encrypt the pem file>
      
    % openssl pkcs12 -export -in my.pem -out my-with-passphrase.p12
    Enter pass phrase for temp.pem:
      <enter the temporary password to decrypt the pem file>

    Enter Export Password:
      <enter a password for encrypting the new p12 file>

##### [Do you like fastlane? Be the first to know about updates and new fastlane tools](https://tinyletter.com/fastlane-tools)

## Environment Variables

Run `fastlane action pem` to get a list of available environment variables.

# How does it work?

_pem_ uses [spaceship](https://spaceship.airforce) to communicate with the Apple Developer Portal to request a new push certificate for you.

## How is my password stored?
``_pem_`` uses the [password manager](https://github.com/fastlane/fastlane/tree/master/credentials_manager) from _fastlane_. Take a look the [CredentialsManager README](https://github.com/fastlane/fastlane/tree/master/credentials_manager) for more information.

# Tips

## Use the 'Provisioning Quicklook plugin'
Download and install the [Provisioning Plugin](https://github.com/chockenberry/Provisioning).

It will show you the ``_pem_`` files like this:
![img/actions/QuickLookScreenshot.png](/img/actions/QuickLookScreenshot.png)

<hr />


pem |
-----|----
Supported platforms | ios
Author | @KrauseFx



**2 Examples**

```ruby
pem
```

```ruby
pem(
  force: true, # create a new profile, even if the old one is still valid
  app_identifier: "net.sunapps.9", # optional app identifier,
  save_private_key: true,
  new_profile: proc do |profile_path| # this block gets called when a new profile was generated
    puts profile_path # the absolute path to the new PEM file
    # insert the code to upload the PEM file to the server
  end
)
```





**Parameters**

Key | Description
----|------------
  `development` | Renew the development push certificate instead of the production one
  `generate_p12` | Generate a p12 file additionally to a PEM file
  `active_days_limit` | If the current certificate is active for less than this number of days, generate a new one. Default value is 30 days
  `force` | Create a new push certificate, even if the current one is active for 30 (or PEM_ACTIVE_DAYS_LIMIT) more days
  `save_private_key` | Set to save the private RSA key
  `app_identifier` | The bundle identifier of your app
  `username` | Your Apple ID Username
  `team_id` | The ID of your Developer Portal team if you're in multiple teams
  `team_name` | The name of your Developer Portal team if you're in multiple teams
  `p12_password` | The password that is used for your p12 file
  `pem_name` | The file name of the generated .pem file
  `output_path` | The path to a directory in which all certificates and private keys should be stored
  `new_profile` | Block that is called if there is a new profile




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action pem
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/pem.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
