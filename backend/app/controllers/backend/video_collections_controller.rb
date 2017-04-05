# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class VideoCollectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_video_collection, except: [:index, :new, :create, :paginate]
    before_action :set_video_collections, only: [:index, :edit, :new, :paginate]
    before_action :set_objects, only: [:edit, :new]

    def index
    end

    def edit
      @videos = Video.where("album_id = ? OR album_id IS NULL", @video_collection.id).
        order(:title)
    end

    def update
      if @video_collection.update(video_collection_params)
        redirect_to edit_video_collection_url(id: @video_collection.id, page: params[:page]),
          notice: 'Video collection updated'
      else
        set_video_collections
        set_objects
        render :edit
      end
    end

    def new
      @videos = Video.not_in_album.order(:title)
    end

    def create
      @video_collection = VideoCollection.create(video_collection_params)
      if @video_collection.save
        redirect_to edit_video_collection_url(@video_collection),
          notice: 'Video collection created'
      else
        set_objects
        set_video_collections
        render :new
      end
    end

    def destroy
      if @video_collection.destroy
        redirect_to video_collections_url
      end
    end

    def make_featured
      @item = @video_collection
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @video_collection
      @item.try(:remove_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def paginate
      @items = VideoCollection.order(publication_date: :desc)
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

      def video_collection_params
        params.require(:video_collection).permit!
      end

      def set_video_collection
        @video_collection = VideoCollection.find(params[:id])
      end

      def set_video_collections
        @video_collections = VideoCollection.videos(filter_params, @index_items_limit * @page)
      end

      def set_objects
        @tags = Tag.order(:name)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
        @news_articles = NewsArticle.order(:title)
      end
  end
end
