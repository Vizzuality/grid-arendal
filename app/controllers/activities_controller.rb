# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.order(:title).published
  end

  def show
  end

  private

    def set_activity
      @activity = Activity.find(params[:id])
    end
end
