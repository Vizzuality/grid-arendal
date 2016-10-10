# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
GC::Profiler.enable

module GridArendal
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'models', 'media')]

    config.generators do |g|
      g.test_framework  :rspec
      g.view_specs      false
      g.helper_specs    false
      g.factory_girl    false
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
    end
  end
end
