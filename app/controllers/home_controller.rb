# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @users = User.limit(5)
    @articles = NewsArticle.limit(5).order(:publication_date)
    @activities = Activity.limit(5)
    @publications = Publication.limit(5)
    @event = Event.where(active: true).order(:created_at).limit(1)&.first
  end
end
