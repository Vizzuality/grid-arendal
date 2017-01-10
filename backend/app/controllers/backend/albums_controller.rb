# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AlbumsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_album, except: [:index, :new, :create]
    before_action :set_albums, only: [:index, :edit, :new]
    before_action :set_objects, only: [:edit]

    def index
    end

    def new
      @album = Album.new
    end

    def create
      @album = Album.create_or_update_album_for(album_params[:external_id])
      redirect_to edit_album_url(@album), notice: "Album imported"
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

    def flickr_update
      msg = @album.update_from_flickr
      redirect_to [:edit, @album], notice: msg
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
        @news_articles = NewsArticle.order(:title)
      end
  end
end
