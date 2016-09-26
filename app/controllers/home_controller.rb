# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @users = User.limit(5)
  end
end
