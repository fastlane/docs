# prompt


Ask the user for a value or for confirmation




> You can use `prompt` to ask the user for a value or to just let the user confirm the next step
When this is executed on a CI service, the passed `ci_input` value will be returned
This action also supports multi-line inputs using the `multi_line_end_keyword` option.


prompt |
-----|----
Supported platforms | ios, android, mac
Author | @KrauseFx



**2 Examples**

```ruby
changelog = prompt(text: "Changelog: ")
```

```ruby
changelog = prompt(
  text: "Changelog: ",
  multi_line_end_keyword: "END"
)

crashlytics(notes: changelog)
```





**Parameters**

Key | Description
----|------------
  `text` | The text that will be displayed to the user
  `ci_input` | The default text that will be used when being executed on a CI service
  `boolean` | Is that a boolean question (yes/no)? This will add (y/n) at the end
  `multi_line_end_keyword` | Enable multi-line inputs by providing an end text (e.g. 'END') which will stop the user input




<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action prompt
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/prompt.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
