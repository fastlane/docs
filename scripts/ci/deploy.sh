#!/bin/sh
# Partly taken from https://medium.com/@nielsenramon/automated-deployment-of-jekyll-projects-to-github-pages-using-kickster-and-circle-ci-6ccc0b6cb872#.qxsy1xf1m


# Exit if any subcommand fails.
set -e

echo "Starting deploy to https://docs.fastlane.tools"

# Replace all the ```ruby-skip-tests
# with ```ruby
# This is only used to skip running the tests for this one
# The markdown parsing only works with the exact string ```ruby
# This only works on Linux
find ./docs/actions/ -type f | xargs sed -i 's/\`\`\`ruby\-skip\-tests/\`\`\`ruby/g'

# Build the docs page locally
mkdocs build

# Bots need names too
git config --global user.email "fastlanebothelper@krausefx.com"
git config --global user.name "fastlane bot"

# Delete old directories (if any)
rm -rf "/tmp/fl-docs"
# Copy the generated website to the temporary directory
cp -R "site/" "/tmp/fl-docs"
# Copy the needed Ruby scripts to a temporary location (used for redirects)
cp "scripts/ci/available_redirects.rb" "/tmp/"
cp "scripts/ci/generate_redirects.rb" "/tmp/"
# Clean all temporary files (e.g. .bundle/config and .ruby-version)
git clean -f -d
# Check out gh-pages and clear all files
git reset --hard HEAD # we don't want the `git checkout` to cause issues (e.g. https://circleci.com/gh/fastlane/docs/730)
git checkout gh-pages
rm -rf *
# Copy the finished HTML page to the current directory
cp -R /tmp/fl-docs/* .

# We need a CNAME file for GitHub
echo "docs.fastlane.tools" > "CNAME"

echo "Generating redirects..."
ruby /tmp/generate_redirects.rb

# Commit all the changes and push it to the remote
git add -A
git commit -m "Deployed with $(mkdocs --version)"
git push origin gh-pages

# Post a Slack message
git checkout master
bundle install
bundle exec fastlane post_slack_deploy_message

echo "Deployed successfully, check out https://docs.fastlane.tools"
echo "If you're running this on your local machine, please make sure to reset your git user credentials (username and email) to not be the fastlane-bot-helper"

exit 0
