# frozen_string_literal: true
module Backend
  class Users::AccountsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]

    def edit
      super
    end

    def update
      super
    end

    protected

      def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
      end
  end
end
