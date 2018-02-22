<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# update_project_team


Update Xcode Development Team ID




> This action update the Developer Team ID of your Xcode Project.


update_project_team |
-----|----
Supported platforms | ios, mac
Author | @lgaches



## 2 Examples

```ruby
update_project_team
```

```ruby
update_project_team(
  path: "Example.xcodeproj",
  teamid: "A3ZZVJ7CNY"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `path` | Path to your Xcode project | [*](#dynamic)
  `teamid` | The Team ID you want to use | [*](#dynamic)

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action update_project_team
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_team.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
