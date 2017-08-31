# opt_out_crash_reporting


This will prevent reports from being uploaded when _fastlane_ crashes




> By default, fastlane will send a report when it crashes The stack trace is sanitized so no personal information is sent. Learn more at https://github.com/fastlane/fastlane#crash-reporting Add `opt_out_crash_reporting` at the top of your Fastfile to disable crash reporting


opt_out_crash_reporting |
-----|----
Supported platforms | ios, android, mac
Author | @mpirri, @ohayon



**1 Example**

```ruby
opt_out_crash_reporting # add this to the top of your Fastfile
```





<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action opt_out_crash_reporting
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/opt_out_crash_reporting.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
