# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]
  before_action :authorize!, only: [:show]

  before_action :set_activities_limit, only: [:index, :paginate]
  before_action :set_page_param, only: [:index, :paginate]

  def index
    @activities = Activity.fetch_all(options_filter)
                          .limit(@activities_limit * @page)
    @content_types = ContentType.by_activity.order('LOWER(title) ASC')
    @programmes = Tag.where(category: Tag::PROGRAMME).order(:name)
    @partners = Partner.order(:name)
    @tags = Tag.for_content('Activity')
    @section = SiteSection.where(section: "activities").first
    @status = Content::STATUS
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @activities.to_json }
    end
  end

  def show
    if @activity.is_programme?
      @related_activities = Activity.joins(:tags).
        where(tags: {name: @activity.title}).
        where.not(id: @activity.id).
        order_by_title.limit(6)
    end
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
      params.permit(:type, :partners, :years, :tags, :programme, :status)
    end
    def set_page_param
      @page = params[:page].present? ? params[:page].to_i : 1
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def authorize!
      if @activity.unpublished? && !current_user
        redirect_to activities_url
      end
    end

    def set_activities_limit
      @activities_limit = 15
    end
end
