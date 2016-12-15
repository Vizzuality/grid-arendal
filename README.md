# Grid Arendal

[![Build Status](https://travis-ci.org/Vizzuality/grid-arendal.svg?branch=master)](https://travis-ci.org/Vizzuality/grid-arendal) [![Code Climate](https://codeclimate.com/github/Vizzuality/grid-arendal/badges/gpa.svg)](https://codeclimate.com/github/Vizzuality/grid-arendal)

TODO: Write a project description

## Installation

Requirements:

* Ruby 2.3.1 [How to install](https://gorails.com/setup/osx/10.10-yosemite)
* PostgreSQL 9.4+ [How to install](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/)
* If installing from a clean OS Sierra see below set up

Setup and install application

    bin/setup

Or:

Install global dependencies:

    gem install bundler

Install project dependencies:

    bundle install

First time execute:

    cp config/database.yml.sample config/database.yml

    bundle exec rake db:create
    bundle exec rake db:migrate

    rails import:activities
    rails import:rss
    rails initialize:site_sections

## OS Sierra

If you are working on a clean installation of Sierra, you will have trouble installing both qt and capybara. This is due to Qt being removed from qt5.6, and qt5.5 and below failing to install on OS Sierra due to changes in Xcode8. Before running the set up above, following the instructions here to install qt55 and manually install the capaybara gem. Once complete run bundle install and then bin/setup: https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#macos-sierra-1012

## Usage

To run application:

    bundle exec rails server

## TEST

  Run rspec:

```ruby
  bin/rspec
```
  Run cucumber:

```ruby
  rake cucumber
```
  Run all (cucumber, spec):

```ruby
  rake
```

capybara-webkit depends on a WebKit implementation from Qt (version >= 4.8), a cross-platform development toolkit. You'll need to download the Qt libraries to build and install the gem. [more](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)

OS X Mavericks:

    brew update
    brew install qt

In cucumber, tag scenarios with '@javascript' to run them using a headless WebKit browser.

In RSpec, use the 'js: true' flag. See the [capybara documentation](http://rubydoc.info/gems/capybara#Using_Capybara_with_RSpec) for more information about using capybara with RSpec.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request :D

### BEFORE CREATING A PULL REQUEST

  Please check all of [these points](https://github.com/Vizzuality/grid-arendal/blob/master/CONTRIBUTING.md).
