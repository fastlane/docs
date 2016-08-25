# fastlane docs

This repo contains all documentation for fastlane. You can find the `.md` files inside the [docs](docs) folder. 

To preview the updated documentation locally, just clone the repo, modify the file, and run

```
mkdocs serve
```

## Deploy changes

Once a PR is merged into master, the latest version will automatically be deployed to [docs.fastlane.tools](https://docs.fastlane.tools) by one of the hard working fastlane bots. No need to do anything manually. The resulting HTML files are stored in the [`gh-pages`](https://github.com/fastlane/docs/tree/gh-pages) branch.

## Installation of [mkdocs](http://www.mkdocs.org/)

```sh
brew install python # if you don't have pip already
pip install mkdocs
```
