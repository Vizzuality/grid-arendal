# frozen_string_literal: true
class SearchController < ApplicationController
  def index
    @news = NewsArticle.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").order(publication_date: :desc).limit(20)
    @activities = Activity.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").limit(20)
    @publications = Publication.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").limit(20)
    @media_contents = MediaContent.wo_photos_in_album.where("LOWER(title) like LOWER(?)", "%#{params[:query]}%").limit(20)
  end

end
