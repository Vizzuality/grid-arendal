# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @users = User.limit(6)
    @news = NewsArticle.limit(4).order(publication_date: :desc)
    @activities = Activity.featured.published.limit(3)
    @publications = Publication.featured.published.order(content_date: :desc).limit(3)
    @event = Event.where(active: true).order(:created_at).limit(1)&.first
    @media_contents = MediaContent.wo_photos_in_album.featured
    @section = SiteSection.where(section: "home").first
  end

  def menu_logo_view
    @menu_logo = true
  end
end
