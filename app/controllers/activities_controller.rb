# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.fetch_all(options_filter)
    @content_types = ContentType.by_activity
    @partners = Partner.order(:name)
    @tags = Tag.order(:name)
    @section = SiteSection.where(section: "activities").first
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @activities.to_json }
    end
  end

  def show
  end

  private
    def options_filter
      params.permit(:type, :partners, :years, :tags)
    end
    def set_activity
      @activity = Activity.find(params[:id])
    end
end
