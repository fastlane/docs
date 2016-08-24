# Partly taken from https://medium.com/@nielsenramon/automated-deployment-of-jekyll-projects-to-github-pages-using-kickster-and-circle-ci-6ccc0b6cb872#.qxsy1xf1m


# Exit if any subcommand fails.
set -e

echo "Started deploying to https://docs.fastlane.tools"

git config --global user.email "fastlanebothelper@krausefx.com"
git config --global user.name "fastlane bot"

mkdocs gh-deploy --clean --remote-branch "gh-pages" --remote-name "upstream" --verbose

echo "Deployed successfully, check out https://docs.fastlane.tools"

exit 0
