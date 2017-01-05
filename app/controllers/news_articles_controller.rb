# frozen_string_literal: true
class NewsArticlesController < ApplicationController
  before_action :set_news_limit, only: [:index, :paginate]
  before_action :set_page_param, only: [:index, :paginate]

  def index
    @articles = NewsArticle
                  .order(publication_date: :desc)
                  .limit(@news_limit * @page)
    @section = SiteSection.where(section: "news").first
  end

  def paginate
    @articles = NewsArticle
                  .order(publication_date: :desc)
                  .limit(@news_limit)
                  .offset(@news_limit * (@page - 1))
    respond_to do |format|
      if(@articles.empty?)
        head :no_content
      end
      format.js
    end
  end

  private
    def set_page_param
      @page = params[:page].present? ? params[:page].to_i : 1
    end
    def set_news_limit
      @news_limit = 16
    end
end
