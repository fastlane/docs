<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# frame_screenshots


Adds device frames around all screenshots (via `frameit`)




> Uses [frameit](https://github.com/fastlane/fastlane/tree/master/frameit) to prepare perfect screenshots for the App Store, your website, QA
or emails. You can add background and titles to the framed screenshots as well.


frame_screenshots |
-----|----
Supported platforms | ios, mac
Author | @KrauseFx



## 5 Examples

```ruby
frame_screenshots
```

```ruby
frameit # alias for "frame_screenshots"
```

```ruby
frame_screenshots(silver: true)
```

```ruby
frame_screenshots(path: "/screenshots")
```

```ruby
frame_screenshots(rose_gold: true)
```





## Parameters

Key | Description
----|------------
  `white` | Use white device frames
  `silver` | Use white device frames. Alias for :white
  `rose_gold` | Use rose gold device frames. Alias for :rose_gold
  `gold` | Use gold device frames. Alias for :gold
  `force_device_type` | Forces a given device type, useful for Mac screenshots, as their sizes vary
  `use_legacy_iphone5s` | Use iPhone 5s instead of iPhone SE frames
  `use_legacy_iphone6s` | Use iPhone 6s frames instead of iPhone 7 frames
  `path` | The path to the directory containing the screenshots




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action frame_screenshots
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/frame_screenshots.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
