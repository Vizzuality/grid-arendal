# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AdminHomeController < ::Backend::ApplicationController
    before_action :authenticate_user!

    def index
      if !user_signed_in?
        redirect_to new_user_session_url
      end
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
