<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# erb


Allows to Generate output files based on ERB templates




> Renders an ERB template with `placeholders` given as a hash via parameter,
if no :destination is set, returns rendered template as string


erb |
-----|----
Supported platforms | ios, android, mac
Author | @hjanuschka



## 1 Example

```ruby
# Example `erb` template:

# Variable1 <%= var1 %>
# Variable2 <%= var2 %>
# <% for item in var3 %>
#        <%= item %>
# <% end %>

erb(
  template: "1.erb",
  destination: "/tmp/rendered.out",
  placeholders: {
    :var1 => 123,
    :var2 => "string",
    :var3 => ["element1", "element2"]
  }
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `template` | ERB Template File | -
  `destination` | Destination file | -
  `placeholders` | Placeholders given as a hash | {}

_- = this parameter doesn't have a default value_<br/>
_* = this default value is dependent on the user's system_


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action erb
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/erb.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
