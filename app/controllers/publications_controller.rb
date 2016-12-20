# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.fetch_all(options_filter).limit(20)
    @content_types = ContentType.by_publication
    max = (Publication.maximum(:content_date) || Date.today).year
    @years = ((max-5)..max).to_a.reverse
    @years << -1
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
