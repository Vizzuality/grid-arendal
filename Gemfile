# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0', '< 5.1'
gem 'pg', '~> 0.18'

gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
gem 'jbuilder', '~> 2.0'

# User management
gem 'devise'
gem 'cancancan'

# Backend
gemspec path: 'backend'

# Templating
gem 'slim-rails'
gem 'simple_form'
gem 'kaminari'

group :development, :test do
  gem 'hirb'
  gem 'awesome_print'
  gem 'faker'
  gem 'byebug', platform: :mri
  gem 'rubocop', require: false
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
  gem 'annotate'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'webmock'
  gem 'spring-commands-rspec'
  gem 'email_spec'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'cucumber-rails', require: false
  gem 'factory_girl_rails'
  gem 'bullet'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'codeclimate-test-reporter', require: nil
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
