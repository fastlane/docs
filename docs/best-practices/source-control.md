## Source Control

It is recommended that you keep _fastlane_ configuration files in the repository. You may want to add the following lines to the repository's `.gitignore` (Git) or `.hgignore` (Mercurial) file to exclude generated and temporary files:

```no-highlight
# fastlane specific
**/fastlane/report.xml

# deliver temporary files
**/fastlane/Preview.html

# snapshot generated screenshots
**/fastlane/screenshots

# scan temporary files
**/fastlane/test_output
```

It is also recommended that you avoid storing screenshots or other delivery artifacts in the repository. Instead, use _fastlane_ to re-generate whenever needed.
