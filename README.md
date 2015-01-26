ios-test
========

ios native app acceptance tests

Depedencies
===========

When running `rake calabash:environment_install` most components will install themselves.
However, Xcode will need to be installed on the system with [command line tools](http://stackoverflow.com/questions/9329243/xcode-4-4-and-later-install-command-line-tools)

usage
====

1. Git clone and pull git@git.mobcastdev.com:iOS/BBBIosApp.git
2. xcodebuild -target BBBApp -scheme BBBQA -configuration Release -sdk iphonesimulator7.1 clean build

Typical usage
```
bundle install
rake ios:setup
rake calabash:run
```

Command line use
```
rake calabash:console
```

running a test
=============

```
BBB_ENV=PROD RESET_BETWEEN_SCENARIOS=1 APP_BUNDLE_PATH=build/blinkbox.app cucumber -r features features/library/library_navigation.feature 
```
- BBB_ENV=PROD - sets the blinkbox.app to point to 'PROD' (valid options are DEVINT, QA, PROD).
- RESET_BETWEEN_SCENARIOS=1 - ensures that the simulator is reset between each scenario.
- APP_BUNDLE_PATH=build/blinkbox.app - location of thr .app file under test.


project structure
=================

```
config/
      project_settings.yml
features/
        support/

Rakefile
README.md
```

rake -T
```
rake calabash:environment_install  # Installs necessary tools for the development environment
rake calabash:run                  # Runs all tests
rake ios:compile_app               # Compile App
rake ios:generate_calabash_target  # Sets up calabash target
rake ios:get_ios_project           # Get the BBB-ios mobile project
rake ios:install_app               # Installs the app onto the simulator
rake ios:reset                     # Reset all simulators [ Requires privacy accessibility enabled for terminal ]
rake ios:setup                     # Performs download,build and installation of app onto simulator

```
