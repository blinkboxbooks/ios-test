ios-test
========

ios native app acceptance tests

usage
====

Typical usage
```
bundle install
rake ios:setup
rake calabash:run
```

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
rake ios:compile_app               # Compile App
rake ios:generate_calabash_target  # Sets up calabash target
rake ios:get_ios_project           # Get the BBB-ios mobile project
rake ios:install_app               # Installs the app onto the simulator
rake ios:setup                     # Performs download,build and installation of app onto simulator
```
