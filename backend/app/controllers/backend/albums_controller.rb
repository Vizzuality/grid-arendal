# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AlbumsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_album, except: [:index, :new, :create]
    before_action :set_albums, only: [:index, :new, :edit]
    before_action :set_objects, only: [:new, :edit]

    def index
    end

    def edit
    end

    def new
      @album = Album.new
    end

    def update

    end

    def create

    end

    def destroy

    end

    def unpublish
      @album.try(:unpublish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def publish
      @album.try(:publish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    private

    def set_album
      @album = Album.find(params[:id])
    end

    def set_albums
      @albums = Album.order(:id)
    end

    def set_objects
      @photos = Photo.order(:id)
      @tags = Tag.order(:name)
    end

  end
end
