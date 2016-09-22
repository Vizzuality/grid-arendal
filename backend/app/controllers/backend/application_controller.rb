# frozen_string_literal: true
module Backend
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'backend/layouts/backend'

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end
  end
end
