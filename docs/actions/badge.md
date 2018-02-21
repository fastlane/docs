<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# badge


Automatically add a badge to your app icon




> [Please use the badge fastlane plugin instead: https://github.com/HazAT/fastlane-plugin-badge]
This action will add a light/dark badge onto your app icon.
You can also provide your custom badge/overlay or add an shield for more customization more info:
https://github.com/HazAT/badge
**Note** If you want to reset the badge back to default you can use `sh 'git checkout -- <path>/Assets.xcassets/'`


badge |
-----|----
Supported platforms | ios, android, mac
Author | @DanielGri



## 4 Examples

```ruby
badge(dark: true)
```

```ruby
badge(alpha: true)
```

```ruby
badge(custom: "/Users/xxx/Desktop/badge.png")
```

```ruby
badge(shield: "Version-0.0.3-blue", no_badge: true)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `dark` | Adds a dark flavored badge ontop of your icon | -
  `custom` | Add your custom overlay/badge image | -
  `no_badge` | Hides the beta badge | -
  `shield` | Add a shield to your app icon from shields.io | -
  `alpha` | Adds and alpha badge instead of the default beta one | -
  `path` | Sets the root path to look for AppIcons | .
  `shield_io_timeout` | Set custom duration for the timeout of the shields.io request in seconds | -
  `glob` | Glob pattern for finding image files | -
  `alpha_channel` | Keeps/adds an alpha channel to the icon (useful for android icons) | -
  `shield_gravity` | Position of shield on icon. Default: North - Choices include: NorthWest, North, NorthEast, West, Center, East, SouthWest, South, SouthEast | -
  `shield_no_resize` | Shield image will no longer be resized to aspect fill the full icon. Instead it will only be shrunk to not exceed the icon graphic | -

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action badge
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/badge.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
