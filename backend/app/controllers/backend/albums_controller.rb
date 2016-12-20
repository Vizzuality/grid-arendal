# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AlbumsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_album, except: [:index, :fetch]
    before_action :set_albums, only: [:index, :edit]
    before_action :set_objects, only: [:edit]

    def index
    end

    def edit
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

    def make_featured
      @item = @album
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @album
      @item.try(:remove_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def fetch
      total_imported = Album.fetch_from_flickr
      redirect_to albums_url, notice: "#{total_imported} album imported"
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
        @albums = Album.order("publication_date DESC")
      end

      def set_objects
        @tags = Tag.order(:name)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
      end
  end
end
