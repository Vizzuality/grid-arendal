# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class ActivitiesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_users_partners_and_news, only: [:new, :edit]

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
      render :edit
    end

    def update
      if @activity.update(activity_params)
        redirect_to activities_url, notice: 'Activity updated'
      else
        set_users_partners_and_news
        @activities = Activity.order(:title)
        render :edit
      end
    end

    def create
      @activity = Activity.create(activity_params)
      if @activity.save
        redirect_to activities_url
      else
        set_users_partners_and_news
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
      @activity.try(:publish)
      redirect_to activities_url
    end

    def unpublish
      @activity.try(:unpublish)
      redirect_to activities_url
    end

    def make_featured
      @activity.try(:make_featured)
      redirect_to activities_url
    end

    def remove_featured
      @activity.try(:remove_featured)
      redirect_to activities_url
    end

    private

      def activity_params
        params.require(:activity).permit!
      end

      def set_users_partners_and_news
        @users = User.order(:first_name, :last_name)
        @partners = Partner.order(:name)
        @news_articles = NewsArticle.order(:title)
        @publications = Publication.order(:title)
      end
  end
end
