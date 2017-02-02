# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class ActivitiesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_objects, only: [:new, :edit]
    before_action :set_activities, only: [:index, :edit, :new]
    before_action :set_activity, except: [:index, :new, :create, :paginate]

    def index
    end

    def edit
    end

    def new
      @activity = Activity.new
    end

    def update
      if @activity.update(activity_params)
        redirect_to edit_activity_url(@activity),
          notice: 'Activity updated'
      else
        set_objects
        set_activities
        render :edit
      end
    end

    def create
      @activity = Activity.create(activity_params)
      if @activity.save
        redirect_to edit_activity_url(@activity),
          notice: 'Activity created'
      else
        set_objects
        set_activities
        render :new
      end
    end

    def destroy
      if @activity.destroy
        redirect_to activities_url
      end
    end

    def publish
      @item = @activity
      @item.try(:publish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def unpublish
      @item = @activity
      @item.try(:unpublish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def make_featured
      @item = @activity
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @activity
      @item.try(:remove_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def paginate
      @items = Activity.order(:title)
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

      def activity_params
        params.require(:activity).permit!
      end

      def set_objects
        @users = User.order(:first_name, :last_name)
        @partners = Partner.order(:name)
        @news_articles = NewsArticle.order(:title)
        @media_contents = MediaContent.albums_collections_and_videos.
          order(:title)
        @publications = Publication.order(:title)
        @content_types = ContentType.
          where(for_content: ContentType::ACTIVITY).
          order(:title)
        @tags = Tag.order(:name)
        @photos = Photo
                    .order_by_date_behind_value(@activity.media_content_id.present? ? @activity.media_content_id : 0)
                    .includes(:photo_sizes)
                    .limit(20)
      end

      def set_activity
        @activity = Activity.find(params[:id])
      end

      def set_activities
        @activities = Activity.activities(params, @index_items_limit * @page)
      end
  end
end
