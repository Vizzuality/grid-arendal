# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class NewsArticlesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_news_article,  except: [:index, :fetch]
    before_action :set_news_articles, except: :destroy
    before_action :set_objects, only: [:new, :edit]

    def index
    end

    def edit
    end

    def update
      if @news_article.update(news_article_params)
        redirect_to news_articles_url, notice: 'News Article updated'
      else
        set_objects
        render :edit
      end
    end

    def destroy
      @news_article = NewsArticle.find(params[:id])
      if @news_article.destroy
        redirect_to news_articles_url
      end
    end

    def fetch
      total_imported = NewsArticle.fetch_from_rss
      redirect_to news_articles_url, notice: "#{total_imported} articles imported"
    end

    private

      def set_news_article
        @news_article = NewsArticle.find(params[:id])
      end

      def set_news_articles
        @news_articles = NewsArticle.order('publication_date DESC')
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
