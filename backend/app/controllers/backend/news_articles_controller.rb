# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class NewsArticlesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_news_article, except: [:index, :new, :create]

    def index
      @news_articles = NewsArticle.order(:title)
    end

    def edit
      @news_articles = NewsArticle.order(:title)
    end

    def new
      @news_articles = NewsArticle.order(:title)
      @news_article = NewsArticle.new
    end

    def update
      if @news_article.update(news_article_params)
        redirect_to news_articles_url, notice: 'NewsArticle updated'
      else
        render :edit
      end
    end

    def create
      @news_article = NewsArticle.create(news_article_params)
      if @news_article.save
        redirect_to news_articles_url
      else
        render :new
      end
    end

    private

      def set_news_article
        @news_article = NewsArticle.find(params[:id])
      end

      def news_article_params
        params.require(:news_article).permit!
      end
  end
end
