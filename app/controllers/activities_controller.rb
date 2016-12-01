# frozen_string_literal: true
class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.order(:title).published
    @activities = @activities.where(content_type_id: params['content-types'])
    @activities = @activities.joins(:content_partners).where(content_partners: {partner_id: params[:partners]})
    @content_types = ContentType.where(for_content: [ContentType::ACTIVITY, ContentType::BOTH])
    @partners = Partner.order(:name)
    respond_to do |format|
      format.html
      format.js
    end
  end

    # Activities.joins(:tags).where(tags: {id: [1, 2]}) params[:tags].split)",")klbshg afdy gp1h3rio

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
