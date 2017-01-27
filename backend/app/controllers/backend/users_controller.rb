# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class UsersController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_user, except: [:index, :new, :create, :paginate]
    before_action :set_users, only: [:index, :edit, :new]
    before_action :set_roles_selection, only: [:update, :create, :new, :edit]

    def index
    end

    def edit
    end

    def new
      @user = User.new
    end

    def update
      if @user.update(user_params)
        redirect_to edit_user_url(@user), notice: 'User updated'
      else
        @users = current_user&.admin? ? User.filter_users(user_filters) : User.filter_actives
        render :edit
      end
    end

    def create
      @user = User.create_with_password(user_params)
      if @user.save
        redirect_to edit_user_url(@user), notice: 'User created'
      else
        @users = current_user&.admin? ? User.filter_users(user_filters) : User.filter_actives
        render :new
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        redirect_to users_url
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

    def paginate
      @users = current_user&.admin? ? User.filter_users(user_filters) : User.filter_actives
      @items = @users.order(:first_name, :last_name)
                 .limit(@index_items_limit)
                 .offset(@index_items_limit * (@page - 1))
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        if(@items.empty?)
          head :no_content
        end
        format.js { render 'backend/shared/index_items_paginate' }
      end
    end

    private

      def user_filters
        params.permit(:active)
      end

      def set_user
        @user = User.find(params[:id])
      end

      def set_users
        @users = current_user&.admin? ? User.filter_users(user_filters) : User.filter_actives
        @users = @users.order(:first_name, :last_name).limit(@index_items_limit * @page)
      end

      def set_roles_selection
        @user_roles = User.roles.map { |r,| [r, r] }
      end

      def user_params
        params.require(:user).permit!
      end
  end
end
