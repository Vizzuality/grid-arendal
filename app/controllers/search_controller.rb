# frozen_string_literal: true
class SearchController < ApplicationController
  before_action :set_limit, only: [:index]

  def index
    if params[:query].present?
      @news = NewsArticle.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").order(publication_date: :desc).limit(@search_limit)
      @activities = Activity.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").limit(@search_limit)
      @publications = Publication.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").limit(@search_limit)
      @media_contents = MediaContent.wo_photos_in_album.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").limit(@search_limit)
      @staff = User.where("LOWER(first_name) like LOWER(?) OR LOWER(last_name) like LOWER(?) OR LOWER(middle_name) like LOWER(?)",
                          "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%").limit(@search_limit)
    end
    @query = params[:query]
  end

  def set_limit
    @search_limit = 20
  end
end
