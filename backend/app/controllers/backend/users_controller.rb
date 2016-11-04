# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class UsersController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_user,            except: [:index, :new, :create]
    before_action :set_roles_selection, only:   [:update, :create, :new, :edit]

    def index
      @users = if current_user&.admin?
                 User.filter_users(user_filters)
               else
                 User.filter_actives
               end
    end

    def edit
      @users = if current_user&.admin?
                 User.filter_users(user_filters)
               else
                 User.filter_actives
               end
    end

    def new
      @users = if current_user&.admin?
                 User.filter_users(user_filters)
               else
                 User.filter_actives
               end
      @user = User.new
    end

    def update
      if @user.update(user_params)
        redirect_to user_path(@user), notice: 'User updated'
      else
        render :edit
      end
    end

    def create
      @user = User.create_with_password(user_params)
      if @user.save
        redirect_to users_url
      else
        render :new
      end
    end

    def deactivate
      if @user.try(:deactivate)
        redirect_to users_url
      else
        redirect_to user_path(@user)
      end
    end

    def activate
      if @user.try(:activate)
        redirect_to users_url
      else
        redirect_to user_path(@user)
      end
    end

    def make_admin
      if @user.try(:make_admin)
        redirect_to users_url
      end
    end

    def make_publisher
      if @user.try(:make_publisher)
        redirect_to users_url
      end
    end

    def make_contributor
      if @user.try(:make_contributor)
        redirect_to users_url
      end
    end

    private

      def user_filters
        params.permit(:active)
      end

      def set_user
        @user = User.find(params[:id])
      end

      def set_roles_selection
        @user_roles = User.roles.map { |r,| [r, r] }
      end

      def user_params
        params.require(:user).permit!
      end
  end
end
