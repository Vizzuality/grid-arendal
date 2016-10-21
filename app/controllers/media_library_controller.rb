# frozen_string_literal: true
class MediaLibraryController < ApplicationController
  before_action :set_media, only: [:show]

  def index
    @publications = Publication.order(:title).published
  end

  def show
  end

  private
    def set_media
      @publication = Publication.find(params[:id])
    end
end
