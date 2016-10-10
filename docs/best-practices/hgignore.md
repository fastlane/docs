## HG Ignore

If you use Mercurial, it is recommended to keep the _fastlane_ configuration files in your repository. You may want to add the following lines to its `.hgignore` file to exclude some generated and temporary files:

```no-highlight
# fastlane specific
fastlane/report.xml

# deliver temporary files
fastlane/Preview.html

# snapshot generated screenshots
fastlane/screenshots

# scan temporary files
fastlane/test_output
```

It is recommended that you avoid storing screenshots in the Mercurial repo. Instead, use fastlane to re-generate screenshots whenever they are needed.
