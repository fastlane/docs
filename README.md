# fastlane docs

This repository contains all documentation for fastlane. You can access the `.md` files inside the [docs](docs) folder.

To preview the updated documentation locally, just clone the repo, modify the file, and run the command. Note that some of the files are in [generated](docs/generated) folder and are later copied with `mkdocs` pre-build hook.

```
mkdocs serve
```

The live version is available on [docs.fastlane.tools](https://docs.fastlane.tools).

## Why new docs?

You can find more information [here](https://github.com/fastlane/docs/issues/5)

## Deploy changes

Once a pull request (PR) is merged into master, the latest version will automatically be deployed to [docs.fastlane.tools](https://docs.fastlane.tools) by one of the hard-working fastlane bots. There is no need to perform any manual actions. The resulting HTML files are stored in the [`gh-pages`](https://github.com/fastlane/docs/tree/gh-pages) branch.

## Installation of [mkdocs](http://www.mkdocs.org/)

```sh
brew install python3 # if you don't have pip already
brew install pipenv
pipenv --three
# install dependencies from Pipfile.lock and run shell
pipenv install
pipenv shell
```

## Adding a Python dependency

Likely, to add a [Markdown extension](https://pythonhosted.org/Markdown/extensions/), install it with `pipenv install <some extension>` after making sure the virtualenv is loaded (`pipenv shell`).

## Troubleshooting local docs server

Running a local server with `mkdocs serve`, it may take several minutes to start. This delay is because `mkdocs` needs some time to read the `available-plugins.md` file. It can be confirmed by running `mkdocs serve --verbose` as `mkdocs` is stuck at reading this file.

For testing changes on pages other than the list of available plugins, it is convenient to edit `docs/generated/available-plugins.md`, removing all of its content and saving the file before running `mkdocs serve`.
