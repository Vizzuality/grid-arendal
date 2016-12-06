# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.fetch_all(options_filter)
    @content_types = ContentType.by_publication
    @years = if Publication.any?
               (Publication.minimum(:content_date).year...Publication.maximum(:content_date).year)
             else
               [Date.today.year]
             end
    @tags = Tag.order(:name)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @activities.to_json }
    end
  end

  def show
    @publications = Publication.order(:title).published
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
