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
      if @album.update(album_params)
        redirect_to edit_album_url(@album),
          notice: 'Album updated'
      else
        set_albums
        set_objects
        render :edit
      end
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

      def album_params
        params.require(:album).permit!
      end

      def set_album
        @album = Album.find(params[:id])
        @album_photos = @album.photos
      end

      def set_albums
        @albums = Album.order(:id)
      end

      def set_objects
        @tags = Tag.order(:name)
      end

  end
end
