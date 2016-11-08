# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class NewsArticlesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_news_article,  except: [:index, :new, :create]
    before_action :set_news_articles, except: :index

    def index
      @news_article = NewsArticle.order(:title).first
      if @news_article
        redirect_to edit_news_article_url(@news_article) and return
      end
    end

    def edit
    end

    def new
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

      def set_news_articles
        @news_articles = NewsArticle.order(:title)
      end

      def news_article_params
        params.require(:news_article).permit!
      end
  end
end
