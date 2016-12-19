# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class ActivitiesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_objects, only: [:new, :edit]

    def index
      @activities = Activity.order(:title)
    end

    def edit
      @activities = Activity.order(:title)
      @activity = Activity.find(params[:id])
    end

    def new
      @activities = Activity.order(:title)
      @activity = Activity.new
    end

    def update
      if @activity.update(activity_params)
        redirect_to edit_activity_url(@activity),
          notice: 'Activity updated'
      else
        set_objects
        @activities = Activity.order(:title)
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
        @activities = Activity.order(:title)
        render :new
      end
    end

    def destroy
      @activity = Activity.find(params[:id])
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

    private

      def activity_params
        params.require(:activity).permit!
      end

      def set_objects
        @users = User.order(:first_name, :last_name)
        @partners = Partner.order(:name)
        @news_articles = NewsArticle.order(:title)
        @publications = Publication.order(:title)
        @content_types = ContentType.
          where(for_content: ContentType::ACTIVITY).
          order(:title)
        @tags = Tag.order(:name)
        @photos = Photo.order("publication_date DESC").includes(:photo_sizes).
          limit(20)
      end
  end
end
