# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.order(:title).published
  end

  def show
    @activities = Activity.order(:title).published
    @publications = Publication.order(:title).published
    @users = @activity.users
  end

  private

    def set_activity
      @activity = Activity.find(params[:id])
      @media_content = MediaContent.find(@activity.media_content_id)
    end
end
