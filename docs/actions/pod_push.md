# pod_push


Push a Podspec to Trunk or a private repository







pod_push |
-----|----
Supported platforms | ios, mac
Author | @squarefrog



**4 Examples**

```ruby
# If no path is supplied then Trunk will attempt to find the first Podspec in the current directory.
pod_push
```

```ruby
# Alternatively, supply the Podspec file path
pod_push(path: "TSMessages.podspec")
```

```ruby
# You may also push to a private repo instead of Trunk
pod_push(path: "TSMessages.podspec", repo: "MyRepo")
```

```ruby
# If the podspec has a dependency on another private pod, then you will have to supply the sources you want the podspec to lint with for pod_push to succeed. Read more here - https://github.com/CocoaPods/CocoaPods/issues/2543.
pod_push(path: "TMessages.podspec", repo: "MyRepo", sources: ["https://github.com/MyGithubPage/Specs", "https://github.com/CocoaPods/Specs"])
```





**Parameters**

Key | Description
----|------------
  `path` | The Podspec you want to push
  `repo` | The repo you want to push. Pushes to Trunk by default
  `allow_warnings` | Allow warnings during pod push
  `use_libraries` | Allow lint to use static libraries to install the spec
  `sources` | The sources of repos you want the pod spec to lint with, separated by commas
  `verbose` | Show more debugging information




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action pod_push
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/pod_push.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
