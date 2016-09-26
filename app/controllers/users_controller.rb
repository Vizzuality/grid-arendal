# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.order(:first_name, :last_name)
  end

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
