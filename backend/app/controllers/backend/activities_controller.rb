# frozen_string_literal: true
require_dependency "backend/application_controller"

module Backend
  class ActivitiesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_activity, except: [:index, :new, :create]

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
        render :edit
      end
    end

    def create
      @activity = Activity.create(activity_params)
      if @activity.save
        redirect_to activities_url
      else
        render :new
      end
    end

    private

      def set_activity
        @activity = Activity.find(params[:id])
      end

      def activity_params
        params.require(:activity).permit!
      end
  end
end
