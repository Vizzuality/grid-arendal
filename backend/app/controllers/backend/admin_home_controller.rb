# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AdminHomeController < ::Backend::ApplicationController
    before_action :authenticate_user!

    def index
    end
  end
end
