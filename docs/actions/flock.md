<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/flock.rb
-->

# flock


Send a message to a Flock group




> To obtain the token, create a new [incoming message webhook](https://dev.flock.co/wiki/display/FlockAPI/Incoming+Webhooks)
in your Flock admin panel.


flock |
-----|----
Supported platforms | ios, android, mac
Author | @Manav



## 1 Example

```ruby
flock(
  message: "Hello",
  token: "xxx"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `message` | Message text | 
  `token` | Token for the Flock incoming webhook | 
  `base_url` | Base URL of the Flock incoming message webhook | `https://api.flock.co/hooks/sendMessage`

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action flock
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/flock.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
