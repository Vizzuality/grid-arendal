# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class CollectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_collection, except: [:index, :new, :create, :paginate, :search]
    before_action :set_collections, only: [:index, :edit, :new]
    before_action :set_objects, only: [:edit]

    def index
    end

    def new
      @collection = Collection.new
    end

    def create
      @collection = Collection.create_or_update_set_for(collection_params[:external_id])
      redirect_to edit_collection_url(@collection), notice: "Collection imported"
    end

    def edit
    end

    def update
      if @collection.update(collection_params)
        redirect_to edit_collection_url(@collection),
          notice: 'Collection updated'
      else
        set_collections
        set_objects
        render :edit
      end
    end

    def make_featured
      @item = @collection
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @collection
      @item.try(:remove_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def flickr_update
      msg = @collection.update_from_flickr
      redirect_to [:edit, @collection], notice: msg
    end

    def destroy
      if @collection.destroy
        redirect_to collections_url
      end
    end

    def paginate
      @items = Collection.order("publication_date DESC")
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

    def search
      @items = Collection.collections(params[:search], @index_items_limit * @page)
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        format.js { render 'backend/shared/index_items_searched' }
      end
    end

    private

      def collection_params
        params.require(:collection).permit!
      end

      def set_collection
        @collection = Collection.find(params[:id])
        @collection_graphics = @collection.graphics
      end

      def set_collections
        @collections = Collection.collections(@search, @index_items_limit * @page)
      end

      def set_objects
        @tags = Tag.order(:name)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
        @news_articles = NewsArticle.order(:title)
      end
  end
end
