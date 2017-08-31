# automatic_code_signing


Updates the Xcode 8 Automatic Codesigning Flag




> Updates the Xcode 8 Automatic Codesigning Flag of all targets in the project


automatic_code_signing |
-----|----
Supported platforms | ios, mac
Author | @mathiasAichinger, @hjanuschka
Returns | The current status (boolean) of codesigning after modification



**8 Examples**

```ruby
# enable automatic code signing
enable_automatic_code_signing
```

```ruby
enable_automatic_code_signing(
  path: "demo-project/demo/demo.xcodeproj"
)
```

```ruby
# disable automatic code signing
disable_automatic_code_signing
```

```ruby
disable_automatic_code_signing(
  path: "demo-project/demo/demo.xcodeproj"
)
```

```ruby
# also set team id
disable_automatic_code_signing(
  path: "demo-project/demo/demo.xcodeproj",
  team_id: "XXXX"
)
```

```ruby
# Only specific targets
  disable_automatic_code_signing(
    path: "demo-project/demo/demo.xcodeproj",
    use_automatic_signing: false,
    targets: ["demo"]
  )

```

```ruby
 # via generic action
automatic_code_signing(
  path: "demo-project/demo/demo.xcodeproj",
  use_automatic_signing: false
)
```

```ruby
automatic_code_signing(
  path: "demo-project/demo/demo.xcodeproj",
  use_automatic_signing: true
)
```





**Parameters**

Key | Description
----|------------
  `path` | Path to your Xcode project
  `use_automatic_signing` | Defines if project should use automatic signing
  `team_id` | Team ID, is used when upgrading project
  `targets` | Specify targets you want to toggle the signing mech. (default to all targets)




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action automatic_code_signing
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/automatic_code_signing.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
