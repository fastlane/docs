# Partly taken from https://medium.com/@nielsenramon/automated-deployment-of-jekyll-projects-to-github-pages-using-kickster-and-circle-ci-6ccc0b6cb872#.qxsy1xf1m


# Exit if any subcommand fails.
set -e

echo "Starting deploy to https://docs.fastlane.tools"

mkdocs build --clean
site_dir="$PWD"


git config --global user.email "fastlanebothelper@krausefx.com"
git config --global user.name "fastlane bot"


rm -rf "/tmp/fl-docs"
git clone "https://github.com/fastlane/docs" "/tmp/fl-docs"
cd "/tmp/fl-docs"
git checkout gh-pages
rm -rf *
cp -R "$site_dir/site/" "/tmp/fl-docs"
echo "docs.fastlane.tools" > "CNAME"

git add -A
git commit -m "Deployed with $(mkdocs --version)"
git push origin gh-pages

echo "Deployed successfully, check out https://docs.fastlane.tools"

exit 0
