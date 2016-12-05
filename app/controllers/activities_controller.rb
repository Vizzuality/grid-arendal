# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.order(:title).published
    if params['content-types']
      @activities = @activities.where(content_type_id: params['content-types'])
    end
    if params[:partner]
      @activities = @activities.joins(:content_partners).where(content_partners: {partner_id: params[:partners]})
    end
    @content_types = ContentType.where(for_content: [ContentType::ACTIVITY, ContentType::BOTH])
    @partners = Partner.order(:name)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @activities.to_json }
    end
  end

  def show
    @activities = Activity.order(:title).published
    @publications = Publication.order(:title).published
    @users = @activity.users
  end

  private

    def set_activity
      @activity = Activity.find(params[:id])
    end
end
