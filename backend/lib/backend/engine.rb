# frozen_string_literal: true
require 'rails'
require 'devise'

require 'backend/version'

module Backend
  class Engine < Rails::Engine
    isolate_namespace ::Backend
  end
end
