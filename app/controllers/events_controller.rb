# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
