{!docs/includes/setup-fastlane-header.md!}

# Advanced fastlane

This file is not used any more and its content was moved to subpages. Please follow the links to the content's new location.

<script type="text/javascript">
// Closure-wrapped for security.
(function () {
    var anchorMap = {
        // templates
        "A": "/advanced/actions/",
        "B": "/advanced/Appfile/",
        "C": "/advanced/Fastfile/",
        "D": "/advanced/lanes/",
        "E": "/advanced/other/",
        "F": "/advanced/fastlane/",
        // actual anchors
        "passing-parameters": "/advanced/lanes/",
        "switching-lanes": "/advanced/lanes/",
        "output-environment-variables": "/advanced/fastlane/",
        "interacting-with-the-user": "/advanced/actions/",
        "run-actions-directly": "/advanced/actions/",
        "shell-values": "/advanced/actions/",
        "priorities-of-parameters-and-options": "/advanced/fastlane/",
        "importing-another-fastfile": "/advanced/Fastfile/",
        "using-fastlane_require": "/advanced/Fastfile/",
        "environment-variables": "/advanced/other/",
        "lane-properties": "/advanced/lanes/",
        "lane-context": "/advanced/lanes/",
        "load-own-actions-from-external-folder": "/advanced/Fastfile/",
        "skip-update-check-when-launching-fastlane": "/advanced/fastlane/",
        "hide-changelog-information-at-the-end-of-running-fastlane": "/advanced/fastlane/",
        "adding-credentials": "/advanced/other/",
        "control-configuration-by-lane-and-by-platform": "/advanced/lanes/",
        "manually-manage-the-fastlane-match-repo": "/advanced/other/",
        "directory-behavior": "/advanced/fastlane/",
        "appfile": "/advanced/Appfile/",
        "building-actions": "/advanced/actions/",
    }
    /*
    * Best practice for extracting hashes:
    * https://stackoverflow.com/a/10076097/151365
    */
    var hash = window.location.hash.substring(1);
    if (hash) {
        /*
        * Best practice for javascript redirects: 
        * https://stackoverflow.com/a/506004/151365
        */
        if (anchorMap[hash]) {
            link = anchorMap[hash] + '#' + hash;
            console.log('hash=' + hash + ' => link=' + link);
            window.location.replace(link);
        }
    }
})();
</script>

# Passing Parameters

# Switching lanes
## Returning values
## Stop executing a lane early
## `before_each` and `after_each` blocks

# Output environment variables

# Interacting with the user

# Run actions directly

# Shell values

# Priorities of parameters and options

# Importing another Fastfile
## `import`
## `import_from_git`
## Note

# Using fastlane_require
## Example

# Environment Variables

# Lane Properties

# Lane Context

# Load own actions from external folder

# Skip update check when launching _fastlane_

# Hide changelog information at the end of running _fastlane_

# Adding Credentials

# Control configuration by lane and by platform

# Manually Manage the fastlane match Repo

# Directory behavior

# Appfile
## Accessing from fastlane

# Building Actions
## Using FastlaneCore::Configuration
### Boolean parameters
### Array parameters
### Polymorphic parameters
### Callback parameters
### Note on Procs
### Verify blocks
### Conflicting options
### Optional parameters
### Configuration files
### Resolution order
## User input and output
## Invoking shell commands
### Using Kernel#system
### Using backticks
### Using the sh method
### Escaping in shell commands
## Calling other actions
