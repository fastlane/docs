<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/fastlane/fastlane.
-->

# appledoc


Generate Apple-like source code documentation from the source code




> Runs `appledoc [OPTIONS] <paths to source dirs or files>` for the project


appledoc |
-----|----
Supported platforms | ios, mac
Author | @alexmx



## 1 Example

```ruby
appledoc(
  project_name: "MyProjectName",
  project_company: "Company Name",
  input: [
    "MyProjectSources",
    "MyProjectSourceFile.h"
  ],
  ignore: [
    "ignore/path/1",
    "ingore/path/2"
  ],
  options: "--keep-intermediate-files --search-undocumented-doc",
  warnings: "--warn-missing-output-path --warn-missing-company-id"
)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `input` | Path(s) to source file directories or individual source files. Accepts a single path or an array of paths | 
  `output` | Output path | 
  `templates` | Template files path | 
  `docset_install_path` | DocSet installation path | 
  `include` | Include static doc(s) at path | 
  `ignore` | Ignore given path | 
  `exclude_output` | Exclude given path from output | 
  `index_desc` | File including main index description | 
  `project_name` | Project name | 
  `project_version` | Project version | 
  `project_company` | Project company | 
  `company_id` | Company UTI (i.e. reverse DNS name) | 
  `create_html` | Create HTML | `false`
  `create_docset` | Create documentation set | `false`
  `install_docset` | Install documentation set to Xcode | `false`
  `publish_docset` | Prepare DocSet for publishing | `false`
  `no_create_docset` | Create HTML and skip creating a DocSet | `false`
  `html_anchors` | The html anchor format to use in DocSet HTML | 
  `clean_output` | Remove contents of output path before starting | `false`
  `docset_bundle_id` | DocSet bundle identifier | 
  `docset_bundle_name` | DocSet bundle name | 
  `docset_desc` | DocSet description | 
  `docset_copyright` | DocSet copyright message | 
  `docset_feed_name` | DocSet feed name | 
  `docset_feed_url` | DocSet feed URL | 
  `docset_feed_formats` | DocSet feed formats. Separated by a comma [atom,xml] | 
  `docset_package_url` | DocSet package (.xar) URL | 
  `docset_fallback_url` | DocSet fallback URL | 
  `docset_publisher_id` | DocSet publisher identifier | 
  `docset_publisher_name` | DocSet publisher name | 
  `docset_min_xcode_version` | DocSet min. Xcode version | 
  `docset_platform_family` | DocSet platform family | 
  `docset_cert_issuer` | DocSet certificate issuer | 
  `docset_cert_signer` | DocSet certificate signer | 
  `docset_bundle_filename` | DocSet bundle filename | 
  `docset_atom_filename` | DocSet atom feed filename | 
  `docset_xml_filename` | DocSet xml feed filename | 
  `docset_package_filename` | DocSet package (.xar,.tgz) filename | 
  `options` | Documentation generation options | 
  `crossref_format` | Cross reference template regex | 
  `exit_threshold` | Exit code threshold below which 0 is returned | `2`
  `docs_section_title` | Title of the documentation section (defaults to "Programming Guides" | 
  `warnings` | Documentation generation warnings | 
  `logformat` | Log format [0-3] | 
  `verbose` | Log verbosity level [0-6,xcode] | 

<em id="dynamic">* = default value is dependent on the user's system</em>


<hr />
To show the documentation in your terminal, run
```no-highlight
fastlane action appledoc
```

<a href="https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/appledoc.rb" target="_blank">View source code</a>

<hr />

<a href="/actions"><b>Back to actions</b></a>
