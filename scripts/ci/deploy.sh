# Partly taken from https://medium.com/@nielsenramon/automated-deployment-of-jekyll-projects-to-github-pages-using-kickster-and-circle-ci-6ccc0b6cb872#.qxsy1xf1m


# Exit if any subcommand fails.
set -e

echo "Started deploying to https://docs.fastlane.tools"

mkdocs gh-deploy

echo "Deployed successfully, check out https://docs.fastlane.tools"

exit 0
