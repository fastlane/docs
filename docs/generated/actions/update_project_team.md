<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_team.rb
-->

# update_project_team


Update Xcode Development Team ID




> This action updates the Developer Team ID of your Xcode project.


update_project_team ||
---|---
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
  `path` | Path to your Xcode project | [*](#parameters-legend-dynamic)
  `targets` | Name of the targets you want to update | 
  `teamid` | The Team ID you want to use | [*](#parameters-legend-dynamic)

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action update_project_team
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run update_project_team
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run update_project_team parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_project_team.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
