# frozen_string_literal: true
module Backend
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'backend/layouts/backend'

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end

    protected

      def authenticate_user!
        if user_signed_in?
          super
        else
          redirect_to backend.new_user_session_path
        end
      end
  end
end
