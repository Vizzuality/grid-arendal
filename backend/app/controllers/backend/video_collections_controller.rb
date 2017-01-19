# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class VideoCollectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_video_collection, except: [:index, :new, :create]
    before_action :set_video_collections, only: [:index, :edit, :new]
    before_action :set_objects, only: [:edit, :new]

    def index
    end

    def edit
    end

    def update
      if @video_collection.update(video_collection_params)
        redirect_to edit_video_collection_url(@video_collection),
          notice: 'Video collection updated'
      else
        set_video_collections
        set_objects
        render :edit
      end
    end

    def new
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

    private

      def video_collection_params
        params.require(:video_collection).permit!
      end

      def set_video_collection
        @video_collection = VideoCollection.find(params[:id])
      end

      def set_video_collections
        @video_collections = VideoCollection.order(publication_date: :desc)
      end

      def set_objects
        @tags = Tag.order(:name)
      end
  end
end
