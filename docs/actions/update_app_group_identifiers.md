# update_app_group_identifiers


This action changes the app group identifiers in the entitlements file




> Updates the App Group Identifiers in the given Entitlements file, so you can have app groups for the app store build and app groups for an enterprise build.


update_app_group_identifiers |
-----|----
Supported platforms | ios
Author | @mathiasAichinger



**1 Example**

```ruby
update_app_group_identifiers(
  entitlements_file: "/path/to/entitlements_file.entitlements",
  app_group_identifiers: ["group.your.app.group.identifier"]
)
```





**Parameters**

Key | Description
----|------------
  `entitlements_file` | The path to the entitlement file which contains the app group identifiers
  `app_group_identifiers` | An Array of unique identifiers for the app groups. Eg. ['group.com.test.testapp']




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_app_group_identifiers
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_group_identifiers.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
