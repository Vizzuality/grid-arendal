# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AdminHomeController < ::Backend::ApplicationController
    def index
      if !user_signed_in?
        redirect_to new_user_session_url
      end
    end
  end
end
