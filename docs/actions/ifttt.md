<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# ifttt


Connect to the IFTTT Maker Channel. https://ifttt.com/maker




> Connect to the IFTTT [Maker Channel](https://ifttt.com/maker). An IFTTT Recipe has two components: a Trigger and an Action. In this case, the Trigger will fire every time the Maker Channel receives a web request (made by this _fastlane_ action) to notify it of an event. The Action can be anything that IFTTT supports: email, SMS, etc.


ifttt |
-----|----
Supported platforms | ios, android, mac
Author | @vpolouchkine



## 1 Example

```ruby
ifttt(
  api_key: "...",
  event_name: "...",
  value1: "foo",
  value2: "bar",
  value3: "baz"
)
```





## Parameters

Key | Description
----|------------
  `api_key` | API key
  `event_name` | The name of the event that will be triggered
  `value1` | Extra data sent with the event
  `value2` | Extra data sent with the event
  `value3` | Extra data sent with the event




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action ifttt
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ifttt.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
