# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class NewsArticlesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_news_article,  except: [:index, :new, :create]
    before_action :set_news_articles, except: :destroy
    before_action :set_objects, only: [:new, :edit]

    def index
    end

    def edit
    end

    def new
      @news_article = NewsArticle.new
    end

    def update
      if @news_article.update(news_article_params)
        redirect_to news_articles_url, notice: 'News Article updated'
      else
        set_objects
        render :edit
      end
    end

    def create
      @news_article = NewsArticle.create(news_article_params)
      if @news_article.save
        redirect_to news_articles_url
      else
        set_objects
        render :new
      end
    end

    def destroy
      @news_article = NewsArticle.find(params[:id])
      if @news_article.destroy
        redirect_to news_articles_url
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

      def set_objects
        @tags = Tag.order(:name)
        @activities = Activity.order(:title)
      end
  end
end
