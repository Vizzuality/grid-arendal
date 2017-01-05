# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]
  before_action :set_activities_limit, only: [:index, :paginate]
  before_action :set_page_param, only: [:index, :paginate]

  def index
    @activities = Activity.fetch_all(options_filter).limit(@activities_limit * @page)
    @content_types = ContentType.by_activity
    @programmes = Tag.where(category: Tag::PROGRAMME).order(:name)
    @partners = Partner.order(:name)
    @tags = Tag.where.not(category: Tag::PROGRAMME).order(:name)
    @section = SiteSection.where(section: "activities").first
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @activities.to_json }
    end
  end

  def show
  end

  def paginate
    @activities = Activity.fetch_all(options_filter)
                    .limit(@activities_limit)
                    .offset(@activities_limit * (@page - 1))
    respond_to do |format|
      if(@activities.empty?)
        head :no_content
      end
      format.js
    end
  end

  private
    def options_filter
      params.permit(:type, :partners, :years, :tags, :programme)
    end
    def set_page_param
      @page = params[:page].present? ? params[:page].to_i : 1
    end
    def set_activity
      @activity = Activity.find(params[:id])
    end
    def set_activities_limit
      @activities_limit = 15
    end
end
