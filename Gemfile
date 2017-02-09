# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0', '< 5.1'
gem 'pg', '~> 0.18'
gem 'pg_search'

gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

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

# File upload
gem "paperclip", github: "thoughtbot/paperclip", ref: "c38bb31"
gem 'aws-sdk', '~> 2.3'
gem 'flickraw'
gem 'cocoon'

# Content
gem 'acts-as-taggable-on', '~> 4.0'

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
end

gem 'sendgrid-ruby'
gem 'newrelic_rpm'
gem 'codeclimate-test-reporter', group: :test, require: nil
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Assets pipeline
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'select2-rails', '~> 4.0'
gem 'sass-rails', '~> 5.0'
gem 'autoprefixer-rails', '~> 6.5.1'
gem 'handlebars_assets'

source 'https://rails-assets.org' do
  gem 'rails-assets-underscore'
  gem 'rails-assets-backbone'
  gem 'rails-assets-URIjs'
  gem 'rails-assets-medium-editor'
end
