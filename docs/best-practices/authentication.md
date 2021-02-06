# Authentication

## General

- Use separate accounts for fastlane
- On CI it might be helpful to use accounts that have no 2 Factor Authentication enabled, see CI

## Apple

### 2FA


#### Avoid 2FA via separate account

#### Avoid 2FA via App Specific Password

`FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

This only works for some actions in specific configurations where only iTMSTransporter or avgtool (TODO check name) are used. As soon as the normal API is used, the app specific password will not be enough.

#### Pushed security Token



#### Trusted Phone Numbers

If you have trusted phone numbers added to your Apple ID you can exit the normal input of the pushed security code by typing `sms`. This will let you manually choose one of your trusted phone numbers to receive the security code. 

##### Set `SPACESHIP_2FA_SMS_DEFAULT_PHONE_NUMBER` to automatically select a phone number for the security code to be sent to

If you know beforehand that you always want to do this and select the same phone number, set the environment variable `SPACESHIP_2FA_SMS_DEFAULT_PHONE_NUMBER` to your phone number. The phone number should be specified in the same format as it is displayed in your [Apple ID console](https://appleid.apple.com/) under `TRUSTED PHONE NUMBERS`, e.g. `+49 162 2850123`, `+1-123-456-7866` or similar. Do not leave off the country code or add or remove any numbers, otherwise fastlane will not be able to match the masked value from Apple's API and select the correct number.

#### Use `FASTLANE_SESSION` to reuse a 2FA session on CI

See ...
