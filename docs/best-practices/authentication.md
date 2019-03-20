# Authentication

## General

- Use separate accounts for fastlane
- On CI it might be helpful to use accounts that have no 2 Factor Authentication enabled, see CI

## Apple

### 2FA

#### App Specific Password via `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`

#### Set `SPACESHIP_2FA_SMS_DEFAULT_PHONE_NUMBER` to automatically select a phone number for the security code to be sent to

If your Apple ID has 2FA enabled you can usually enter `sms` to escape from the normal "enter your pushed security code" flow and manually choose one of your trusted phone numbers to receive the security code. If you know beforehand that you always want to do this and select the same phone number, set the environment variable `SPACESHIP_2FA_SMS_DEFAULT_PHONE_NUMBER` to the phone number. 

#### Use `FASTLANE_SESSION` to reuse a 2FA session on CI

See ...
