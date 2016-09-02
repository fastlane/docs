# fastlane docs

This repo contains all documentation for fastlane. You can find the `.md` files inside the [docs](docs) folder.

To preview the updated documentation locally, just clone the repo, modify the file, and run

```
mkdocs serve
```

The live version is available on [docs.fastlane.tools](https://docs.fastlane.tools).

## Why new docs?

You can find more information [here](https://github.com/fastlane/docs/issues/5)

## Deploy changes

Once a PR is merged into master, the latest version will automatically be deployed to [docs.fastlane.tools](https://docs.fastlane.tools) by one of the hard working fastlane bots. No need to do anything manually. The resulting HTML files are stored in the [`gh-pages`](https://github.com/fastlane/docs/tree/gh-pages) branch.

## Installation of [mkdocs](http://www.mkdocs.org/)

```sh
brew install python # if you don't have pip already
[sudo] pip install -r requirements.txt
```

## Adding a Python dependency

Likely, to add a [Markdown extension](https://pythonhosted.org/Markdown/extensions/).

1. Install with `pip install <some extension>`
2. Add <some extension> to [requirements-to-freeze.txt](requirements-to-freeze.txt).
3. Run `pip freeze > requirements.txt` to update the exact requirements.

### Why requirements-to-freeze.txt?

Based on [A Better Pip Workflow](http://www.kennethreitz.org/essays/a-better-pip-workflow),
`requirements-to-freeze.txt` and `requirements.txt` provide a similar experience
to Gemfile and Gemfile.lock, respectively.

`requirements-to-freeze.txt` lets you pick out the top level packages the
project depends on, while `requirements.txt` exactly specifies all of the
dependencies and subdependencies for repeatable builds.
