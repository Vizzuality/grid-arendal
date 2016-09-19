# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  if Bullet.enable?
    config.before(:each, type: :controller) do
      Bullet.start_request
    end

    config.after(:each, type: :controller) do
      Bullet.perform_out_of_channel_notifications if Bullet.notification?
      Bullet.end_request
    end
  end

  config.include FactoryGirl::Syntax::Methods

  Capybara.server do |app, port|
    require 'rack/handler/puma'
    Rack::Handler::Puma.run(app, Port: port)
  end
  Capybara.javascript_driver = :webkit
end
