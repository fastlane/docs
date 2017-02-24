# ortalane docs

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

## Installation of [ortdocs](http://www.mkdocs.org/)

```sh
brew install python # if you don't have pip already
[sudo] pip install -r requirements.txt
```

_Note: If you use `sudo` to run `pip`, you might need to use the `-H` flag of `sudo`._

### Troubleshooting

Due to a bug in `pip` trying to uninstall El Capitan's version of `six` (protected by SIP) when needing a new one, you may encounter the following error during `pip install -r requirements.txt`:

```sh
OSError: [Errno 1] Operation not permitted: '/tmp/pip-[…]-uninstall/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/six-1.4.1-py2.7.egg-info'
```

In this case, just [install `six` using the `--ignore-installed` flag first before retrying](https://github.com/pypa/pip/issues/3165#issuecomment-146666737):

```sh
[sudo] pip install --ignore-installed six
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
