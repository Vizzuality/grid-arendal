# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.fetch_all(options_filter).limit(20)
    @content_types = ContentType.by_publication
    @years = if Publication.any?
               (Publication.minimum(:content_date).year...Publication.maximum(:content_date).year)
             else
               [Date.today.year]
             end
    @tags = Tag.order(:name)
    @section = SiteSection.where(section: "activities").first
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @publications.to_json }
    end
  end

  def show
    @users = @publication.users
  end

  private
    def options_filter
      params.permit(:type, :tags, :years)
    end

    def set_publication
      @publication = Publication.find(params[:id])
    end
end
