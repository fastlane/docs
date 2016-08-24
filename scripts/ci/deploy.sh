# Partly taken from https://medium.com/@nielsenramon/automated-deployment-of-jekyll-projects-to-github-pages-using-kickster-and-circle-ci-6ccc0b6cb872#.qxsy1xf1m


# Exit if any subcommand fails.
set -e

echo "Starting deploy to https://docs.fastlane.tools"

# Build the docs page locally
mkdocs build --clean

# Bots need names too
git config --global user.email "fastlanebothelper@krausefx.com"
git config --global user.name "fastlane bot"

# Delete old directories (if any)
rm -rf "/tmp/fl-docs"
# Copy the generated website to the temporary directory
cp -R "site/" "/tmp/fl-docs"
# Check out gh-pages and clear all files
git checkout gh-pages
rm -rf *
# Copy the finished HTML page to the current directory
cp -R /tmp/fl-docs/* .

# We need a CNAME file for GitHub
echo "docs.fastlane.tools" > "CNAME"

# We also need a circle.yml file on the gh-pages branch, otherwise the build fails
echo "test:\n  override:\n    - echo 'Running on 'gh-pages' branch" > "circle.yml"

# Commit all the changes and push it to the remote
git add -A
git commit -m "Deployed with $(mkdocs --version)"
git push origin gh-pages

echo "Deployed successfully, check out https://docs.fastlane.tools"

exit 0
