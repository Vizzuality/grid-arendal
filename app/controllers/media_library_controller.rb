# frozen_string_literal: true
class MediaLibraryController < ApplicationController

  def index
    @publications = Publication.order(:title).published
  end

  def show
  end

  private
    def set_publication
      @publication = Publication.find(params[:id])
    end
end
