# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @users = User.limit(5)
    @articles = NewsArticle.limit(4).order(:publication_date)
    @activities = Activity.featured.published
    @publications = Publication.featured.published
    @event = Event.where(active: true).order(:created_at).limit(1)&.first
  end

  def menu_logo_view
    @menu_logo = true
  end
end
