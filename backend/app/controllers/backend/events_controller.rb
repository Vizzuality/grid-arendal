# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class EventsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_event,              except: [:index, :new, :create]
    before_action :set_partners_selection, only: [:update, :create, :new, :edit]
    before_action :set_events,             except: :index

    def index
    end

    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end

    def new
      @event = Event.new
      respond_to do |format|
        format.html
        format.js
      end
      render :edit
    end

    def update
      if @event.update(event_params)
        redirect_to events_url, notice: 'Event updated'
      else
        render :edit
      end
    end

    def create
      @event = Event.create(event_params)
      if @event.save
        redirect_to events_url
      else
        render :new
      end
    end

    def destroy
      @event = Event.find(params[:id])
      if @event.destroy
        redirect_to events_url
      end
    end

    def deactivate
      if @event.try(:deactivate)
        redirect_to events_url
      else
        redirect_to events_url
      end
    end

    def activate
      if @event.try(:activate)
        redirect_to events_url
      else
        redirect_to events_url
      end
    end

    private

      def set_event
        @event = Event.find(params[:id])
      end

      def set_events
        @events = Event.order(:title)
      end

      def set_partners_selection
        @partners = Partner.order_by_name.map { |r| [r.name, r.id] }
      end

      def event_params
        params.require(:event).permit!
      end
  end
end
