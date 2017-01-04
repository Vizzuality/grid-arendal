# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class VideosController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_video, except: [:index, :new, :create]
    before_action :set_videos, only: [:index, :edit, :new]
    before_action :set_objects, only: [:edit, :new]

    def index
    end

    def edit
    end

    def update
      if @video.update(video_params)
        redirect_to edit_video_url(@video),
          notice: 'Video updated'
      else
        set_videos
        set_objects
        render :edit
      end
    end

    def new
    end

    def create
      @video = Video.create(video_params)
      if @video.save
        redirect_to edit_video_url(@video),
          notice: 'Video created'
      else
        set_objects
        set_videos
        render :new
      end
    end

    def make_featured
      @item = @video
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @video
      @item.try(:remove_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    private

      def video_params
        params.require(:video).permit!
      end

      def set_video
        @video = Video.find(params[:id])
      end

      def set_videos
        @videos = Video.order(publication_date: :desc)
      end

      def set_objects
        @tags = Tag.order(:name)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
        @news_articles = NewsArticle.order(:title)
      end
  end
end
