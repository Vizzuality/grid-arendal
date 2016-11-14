# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AdminHomeController < ::Backend::ApplicationController
    def index
      redirect_to new_activity_path()
    end
  end
end
