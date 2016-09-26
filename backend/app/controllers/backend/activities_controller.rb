# frozen_string_literal: true
require_dependency "backend/application_controller"

module Backend
  class ActivitiesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_activity, except: [:index, :new, :create]
    before_action :set_users_and_partners, only: [:new, :edit]

    def index
      @activities = Activity.order(:title)
    end

    def edit
    end

    def new
      @activity = Activity.new
    end

    def update
      if @activity.update(activity_params)
        redirect_to activities_url, notice: 'Activity updated'
      else
        set_users_and_partners
        render :edit
      end
    end

    def create
      @activity = Activity.create(activity_params)
      if @activity.save
        redirect_to activities_url
      else
        set_users_and_partners
        render :new
      end
    end

    def unpublish
      if @activity.try(:unpublish)
        redirect_to activities_path
      else
        redirect_to activity_path(@activity)
      end
    end

    def publish
      if @activity.try(:publish)
        redirect_to activities_path
      else
        redirect_to activity_path(@activity)
      end
    end

    private

      def set_activity
        @activity = Activity.find(params[:id])
      end

      def activity_params
        params.require(:activity).permit!
      end

      def set_users_and_partners
        @users = User.order(:first_name, :last_name)
        @partners = Partner.order(:name)
      end
  end
end
