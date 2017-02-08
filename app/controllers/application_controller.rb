# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_url
  after_action  :store_location

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do
    render 'errors/not_found', status: 404
  end

  def store_location
    return unless request.get?
    if request.path != '/manage/account/login' &&
        request.path != '/manage/account/register' &&
        request.path != '/manage/account/secret/new' &&
        request.path != '/manage/account/secret/edit' &&
        request.path != '/manage/account/logout' &&
        request.path != '/manage/account/edit' &&
        request.path != '/manage/account/password' &&
        request.path != '/manage/account/cancel' &&
        !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  private
    def after_sign_in_path_for(*)
      session[:previous_url] || root_path
    end
    def set_current_url
      @current_route = request.url
    end
end
