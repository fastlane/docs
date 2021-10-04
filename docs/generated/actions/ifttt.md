<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ifttt.rb
-->

# ifttt


Connect to the [IFTTT Maker Channel](https://ifttt.com/maker)




> Connect to the IFTTT [Maker Channel](https://ifttt.com/maker). An IFTTT Recipe has two components: a Trigger and an Action. In this case, the Trigger will fire every time the Maker Channel receives a web request (made by this _fastlane_ action) to notify it of an event. The Action can be anything that IFTTT supports: email, SMS, etc.


ifttt ||
---|---
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

Key | Description | Default
----|-------------|--------
  `api_key` | API key | 
  `event_name` | The name of the event that will be triggered | 
  `value1` | Extra data sent with the event | 
  `value2` | Extra data sent with the event | 
  `value3` | Extra data sent with the event | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action ifttt
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run ifttt
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run ifttt parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/ifttt.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
