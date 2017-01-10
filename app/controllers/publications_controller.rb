# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]
  before_action :set_publications_limit, only: [:index, :paginate]
  before_action :set_page_param, only: [:index, :paginate]

  def index
    @publications = Publication.fetch_all(options_filter).limit(@publications_limit * @page)
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

  def paginate
    @publications = Publication.fetch_all(options_filter)
                    .limit(@publications_limit)
                    .offset(@publications_limit * (@page - 1))
    respond_to do |format|
      if(@publications.empty?)
        head :no_content
      end
      format.js
    end
  end

  private
    def options_filter
      params.permit(:type, :tags, :years)
    end
    def set_page_param
      @page = params[:page].present? ? params[:page].to_i : 1
    end
    def set_publication
      @publication = Publication.find(params[:id])
    end
    def set_publications_limit
      @publications_limit = 15
    end
end
