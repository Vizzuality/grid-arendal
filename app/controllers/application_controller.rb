# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  after_action  :store_location

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def store_location
    return unless request.get?
    if request.path != '/account/login' &&
        request.path != '/account/register' &&
        request.path != '/account/secret/new' &&
        request.path != '/account/secret/edit' &&
        request.path != '/account/logout' &&
        request.path != '/account/edit' &&
        request.path != '/account/password' &&
        request.path != '/account/cancel' &&
        !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  private

      def after_sign_in_path_for(*)
        session[:previous_url] || root_path
      end
end
