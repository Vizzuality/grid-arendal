# frozen_string_literal: true
class SearchController < ApplicationController
  before_action :set_limit, only: [:index]

  def index
    @query = params[:query] && params[:query].strip
    if @query.present?
      @news = NewsArticle.
        search_for(@query).
        limit(@search_limit)
      @activities = Activity.
        published.
        search_for(@query).
        limit(@search_limit)
      @publications = Publication.
        published.
        search_for(@query).
        limit(@search_limit)
      @media_contents = MediaContent.
        search_for(@query).
        limit(@search_limit)
      @staff = User.
        search_for(@query).
        limit(@search_limit)
    end
  end

  def set_limit
    @search_limit = 20
  end
end
