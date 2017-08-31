# xcode_select


Change the xcode-path to use. Useful for beta versions of Xcode




> Select and build with the Xcode installed at the provided path. Use the `xcversion` action if you want to select an Xcode based on a version specifier or you don't have known, stable paths as may happen in a CI environment.


xcode_select |
-----|----
Supported platforms | ios, mac
Author | @dtrenz



**1 Example**

```ruby
xcode_select "/Applications/Xcode-8.3.2.app"
```





<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action xcode_select
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/xcode_select.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
