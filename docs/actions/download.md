# download


Download a file from a remote server (e.g. JSON file)




> Specify the URL to download and get the content as a return value
For more advanced networking code, use the Ruby functions instead:
http://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html


download |
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



**1 Example**

```ruby
data = download(url: "https://host.com/api.json")
```





**Parameters**

Key | Description
----|------------
  `url` | The URL that should be downloaded




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action download
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/download.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
