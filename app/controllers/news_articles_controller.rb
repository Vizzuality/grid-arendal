# frozen_string_literal: true
class NewsArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = NewsArticle.order(publication_date: :desc)
  end

  def show
  end

  private

    def set_article
      @article = NewsArticle.find(params[:id])
    end
end
