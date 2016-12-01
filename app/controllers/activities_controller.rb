# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.order(:title).published
    @content_types = ContentType.where(for_content: ContentType::ACTIVITY).or(ContentType.where(for_content: ContentType::BOTH))
    @partners = Partner.order(:name)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @activities = Activity.order(:title).published
    @publications = Publication.order(:title).published
    @users = @activity.users
  end

  def filters
  end

  private

    def set_activity
      @activity = Activity.find(params[:id])
    end
end
