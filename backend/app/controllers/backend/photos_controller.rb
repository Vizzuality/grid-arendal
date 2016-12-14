# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class PhotosController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_photo, except: [:index, :new, :create, :search]
    before_action :set_photos, only: [:index, :new, :edit]
    before_action :set_objects, only: [:new, :edit]

    def search
      @photos = Photo.where("UPPER(title) like UPPER(?)", "#{params[:query]}%").limit(20)
      @selected_id = params[:selected_id]
      respond_to do |format|
        format.js
      end
    end

    def index
    end

    def edit
      @thumbnail = @photo.photo_sizes.where(size: PhotoSize::MEDIUM)[0].url
    end

    def new
      @photo = Photo.new
    end

    def update
      if @photo.update(photo_params)
        redirect_to edit_photo_url(@photo),
          notice: 'Picture updated'
      else
        set_photos
        set_objects
        render :edit
      end
    end

    def unpublish
      @photo.try(:unpublish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def publish
      @photo.try(:publish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    private

      def photo_params
        params.require(:photo).permit!
      end

      def set_photo
        @photo = Photo.find(params[:id])
      end

      def set_photos
        @photos = Photo.order(:id)
      end

      def set_objects
        @albums = Album.order(:id)
        @tags = Tag.order(:name)
      end

  end
end
