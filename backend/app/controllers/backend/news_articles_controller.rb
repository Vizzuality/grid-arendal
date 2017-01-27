# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class NewsArticlesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_news_article,  except: [:index, :fetch, :paginate]
    before_action :set_news_articles, except: [:destroy, :paginate]
    before_action :set_objects, only: [:new, :edit]

    def index
    end

    def edit
    end

    def update
      if @news_article.update(news_article_params)
        redirect_to edit_news_article_url(@news_article),
          notice: 'News article updated'
      else
        set_objects
        render :edit
      end
    end

    def destroy
      @news_article = NewsArticle.find(params[:id])
      if @news_article.destroy
        redirect_to edit_news_article_url(@news_article),
          notice: 'News article created'
      end
    end

    def fetch
      total_imported = NewsArticle.fetch_from_rss
      redirect_to news_articles_url, notice: "#{total_imported} articles imported"
    end

    def paginate
      @items = NewsArticle.order(:title)
                      .limit(@index_items_limit)
                      .offset(@index_items_limit * (@page - 1))
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        if(@items.empty?)
          head :no_content
        end
        format.js { render 'backend/shared/index_items_paginate' }
      end
    end

    private

      def set_news_article
        @news_article = NewsArticle.find(params[:id])
      end

      def set_news_articles
        @news_articles = NewsArticle.order('publication_date DESC').limit(@index_items_limit * @page)
      end

      def news_article_params
        params.require(:news_article).permit!
      end

      def set_objects
        @tags = Tag.order(:name)
        @activities = Activity.order(:title)
        @publications = Publication.order(:title)
        @media_contents = MediaContent.albums_collections_and_videos.
          order(:title)
      end
  end
end
