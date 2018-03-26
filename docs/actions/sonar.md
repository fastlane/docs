<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sonar.rb
-->

# sonar


Invokes sonar-scanner to programmatically run SonarQube analysis




> See http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner for details.
It can process unit test results if formatted as junit report as shown in [xctest](#xctest) action. It can also integrate coverage reports in Cobertura format, which can be transformed into by [slather](#slather) action.


sonar |
-----|----
Supported platforms | ios, android, mac
Author | @c_gretzki
Returns | The exit code of the sonar-scanner binary



## 1 Example

```ruby
sonar(
  project_key: "name.gretzki.awesomeApp",
  project_version: "1.0",
  project_name: "iOS - AwesomeApp",
  sources_path: File.expand_path("../AwesomeApp")
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `project_configuration_path` | The path to your sonar project configuration file; defaults to `sonar-project.properties` | 
  `project_key` | The key sonar uses to identify the project, e.g. `name.gretzki.awesomeApp`. Must either be specified here or inside the sonar project configuration file | 
  `project_name` | The name of the project that gets displayed on the sonar report page. Must either be specified here or inside the sonar project configuration file | 
  `project_version` | The project's version that gets displayed on the sonar report page. Must either be specified here or inside the sonar project configuration file | 
  `sources_path` | Comma-separated paths to directories containing source files. Must either be specified here or inside the sonar project configuration file | 
  `project_language` | Language key, e.g. objc | 
  `source_encoding` | Used encoding of source files, e.g., UTF-8 | 
  `sonar_runner_args` | Pass additional arguments to sonar-scanner. Be sure to provide the arguments with a leading `-D` e.g. FL_SONAR_RUNNER_ARGS="-Dsonar.verbose=true" | 
  `sonar_login` | Pass the Sonar Login token (e.g: xxxxxxprivate_token_XXXXbXX7e) | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action sonar
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/sonar.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
