<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/assets/ActionDetails.md.erb
-->

# is_ci


Is the current run being executed on a CI system, like Jenkins or Travis




> The return value of this method is true if fastlane is currently executed on
Travis, Jenkins, Circle or a similar CI service


is_ci |
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



## 1 Example

```ruby
if is_ci?
  puts "I'm a computer"
else
  say "Hi Human!"
end
```





<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action is_ci
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/is_ci.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
