# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class NewsArticlesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_objects, only: [:new, :edit]
    before_action :set_news_limit, only: [:index, :edit, :paginate]
    before_action :set_page_param, only: [:index, :edit, :paginate]
    before_action :set_news_articles, only: [:index, :edit]
    before_action :set_news_article, only: [:edit, :destroy]

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
                      .limit(@news_limit)
                      .offset(@news_limit * (@page - 1))
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        if(@items.empty?)
          head :no_content
        end
        format.js { render 'backend/shared/index_items_paginate' }
      end
    end

    private

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

      def set_news_article
        @news_article = NewsArticle.find(params[:id])
      end

      def set_news_articles
        @news_articles = NewsArticle.order('publication_date DESC').limit(@news_limit)
      end

      def set_page_param
        @page = params[:page].present? ? params[:page].to_i : 1
      end

      def set_news_limit
        @news_limit = 30
      end
  end
end
