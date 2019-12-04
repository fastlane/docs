# Semaphore CI Integration

[Semaphore](https://semaphoreci.com) provides simple, fast continuous integration and delivery for your iOS apps. All [macOS machine images](https://docs.semaphoreci.com/article/162-macos-mojave-xcode-11-image) have _fastlane_ pre-installed and getting up and running is quick and simple.

## Add the Semaphore fastlane plugin

The [Semaphore fastlane plugin](https://github.com/semaphoreci/fastlane-plugin-semaphore) creates a temporary keychain, sets `match` to read-only mode and (optionally) redirects log output from `scan` and `gym`.

Install the plugin from your app's project directory:

``` bash
fastlane add_plugin semaphore
```

Then, from your `Fastfile`:

``` ruby
before_all do
  setup_semaphore
end
```

## Configure a pipeline on Semaphore

Configure continuous integration pipelines on Semaphore with a `.semaphore/semaphore.yml` file in your app's source repository. Then, add the repository to your [Semaphore dashboard](https://me.semaphoreci.com) and your continuous integration will start.

For full details of how pipelines work on Semaphore see the [documentation](https://docs.semaphoreci.com/article/124-ios-continuous-integration-xcode), or the [example project](https://github.com/semaphoreci-demos/semaphore-demo-ios-swift-xcode).

## Example Pipeline

``` yaml
# Use the latest stable version of Semaphore 2.0 YML syntax:
version: v1.0

# Name your pipeline. If you choose to connect multiple pipelines with
# promotions, the pipeline name will help you differentiate between
# them. For example, you might have a build phase and a delivery phase.
# For more information on promotions, see:
# https://docs.semaphoreci.com/article/67-deploying-with-promotions
name: Tallest Towers

# The agent defines the environment in which your CI runs. It is a combination
# of a machine type and an operating system image. For a project built with
# Xcode you must use one of the Apple machine types, coupled with a macOS image
# running either Xcode 10 or Xcode 11.
# See https://docs.semaphoreci.com/article/20-machine-types
# https://docs.semaphoreci.com/article/161-macos-mojave-xcode-10-image and
# https://docs.semaphoreci.com/article/162-macos-mojave-xcode-11-image
agent:
  machine:
    type: a1-standard-4
    os_image: macos-mojave-xcode11

# Blocks are the heart of a pipeline and are executed sequentially. Each block
# has a task that defines one or more parallel jobs. Jobs define commands that
# should be executed by the pipeline.
# See https://docs.semaphoreci.com/article/62-concepts
blocks:
  - name: Run tests
    task:
      # Set environment variables that your project requires.
      # See https://docs.semaphoreci.com/article/66-environment-variables-and-secrets
      env_vars:
        - name: LANG
          value: en_US.UTF-8
      prologue:
        commands:
          # Download source code from GitHub.
          - checkout

          # Restore dependencies from cache. This command will not fail in
          # case of a cache miss. In case of a cache hit, bundle  install will
          # complete in about a second.
          # See https://docs.semaphoreci.com/article/68-caching-dependencies
          - cache restore
          - bundle install --path vendor/bundle
          - cache store
      jobs:
        - name: Test
          commands:
            # Select an Xcode version.
            # See https://docs.semaphoreci.com/article/161-macos-mojave-xcode-10-image and
            # https://docs.semaphoreci.com/article/162-macos-mojave-xcode-11-image
            - bundle exec xcversion select 11.2.1

            # Run tests of iOS and Mac app on a simulator or connected device.
            # See https://docs.fastlane.tools/actions/scan/
            - bundle exec fastlane test

  - name: Build app
    task:
      env_vars:
        - name: LANG
          value: en_US.UTF-8
      prologue:
        commands:
          - checkout
          - cache restore
          - bundle install --path vendor/bundle
          - cache store
      jobs:
        - name: Build
          commands:
            - bundle exec xcversion select 11.2.1
            - bundle exec fastlane build
  - name: Take screenshots
    task:
      env_vars:
        - name: LANG
          value: en_US.UTF-8
      prologue:
        commands:
          - checkout
          - cache restore
          - bundle install --path vendor/bundle
          - cache store
      jobs:
        - name: Screenshots
          commands:
            - bundle exec xcversion select 11.2.1
            - bundle exec fastlane screenshots
            - artifact push project screenshots
```
