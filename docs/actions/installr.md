<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# installr


Upload a new build to Installr







installr |
-----|----
Supported platforms | ios
Author | @scottrhoyt



## 1 Example

```ruby
installr(
  api_token: "...",
  ipa: "test.ipa",
  notes: "The next great version of the app!",
  notify: "dev,qa",
  add: "exec,ops"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `api_token` | API Token for Installr Access | 
  `ipa` | Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action | [*](#dynamic)
  `notes` | Release notes | 
  `notify` | Groups to notify (e.g. 'dev,qa') | 
  `add` | Groups to add (e.g. 'exec,ops') | 

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action installr
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/installr.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
