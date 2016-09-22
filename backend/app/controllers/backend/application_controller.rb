# frozen_string_literal: true
module Backend
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'backend/layouts/backend'
  end
end
