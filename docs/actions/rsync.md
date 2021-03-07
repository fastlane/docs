<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/rsync.rb
-->

# rsync


Rsync files from :source to :destination




> A wrapper around `rsync`, which is a tool that lets you synchronize files, including permissions and so on. For a more detailed information about `rsync`, please see [rsync(1) man page](https://linux.die.net/man/1/rsync).


rsync ||
---|---
Supported platforms | ios, android, mac
Author | @hjanuschka



## 1 Example

```ruby
rsync(
  source: "root@host:/tmp/1.txt",
  destination: "/tmp/local_file.txt"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `extra` | Port | `-av`
  `source` | source file/folder | 
  `destination` | destination file/folder | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
fastlane action rsync
```

<hr />

## CLI

It is recommended to add the above action into your `Fastfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
fastlane run rsync
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
fastlane run rsync parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _fastlane_ actions you use to your `Fastfile`.

<hr />

## Source code

This action, just like the rest of _fastlane_, is fully open source, <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/rsync.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>
