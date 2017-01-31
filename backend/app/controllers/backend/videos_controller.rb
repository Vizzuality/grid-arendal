# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class VideosController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_video, except: [:index, :new, :create, :paginate, :search]
    before_action :set_videos, only: [:index, :edit, :new, :paginate, :search]
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

    def destroy
      if @video.destroy
        redirect_to videos_url
      end
    end

    def paginate
      @items = Video.order(publication_date: :desc)
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
      @items = if params[:search] != ''
                 Video
                   .where("UPPER(title) like UPPER(?)", "#{params[:search]}%")
                   .order(publication_date: :desc)
               else
                 Video.order(publication_date: :desc).limit(@index_items_limit * @page)
               end
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        format.js { render 'backend/shared/index_items_searched' }
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
        @videos = if @search.present?
                    Video
                      .where("UPPER(title) like UPPER(?)", "#{@search}%")
                      .order(publication_date: :desc)
                  else
                    Video.order(publication_date: :desc).limit(@index_items_limit * @page)
                  end
      end

      def set_objects
        @tags = Tag.order(:name)
        @video_collections = VideoCollection.order(:title)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
        @news_articles = NewsArticle.order(:title)
      end
  end
end
