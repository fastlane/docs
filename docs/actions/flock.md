<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/flock.rb
-->

# flock


Send a message to a [Flock](https://flock.com/) group




> To obtain the token, create a new [incoming message webhook](https://dev.flock.co/wiki/display/FlockAPI/Incoming+Webhooks) in your Flock admin panel.


flock ||
---|---
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



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action flock
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run flock
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run flock parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/flock.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
