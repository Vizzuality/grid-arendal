# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class PhotosController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_photo, except: [:index, :search]
    before_action :set_photos, only: [:index, :edit]
    before_action :set_objects, only: [:edit]

    def search
      @photos = Photo.where("UPPER(title) like UPPER(?)", "#{params[:query]}%").
        limit(20)
      @selected_id = params[:selected_id]
      respond_to do |format|
        format.js
      end
    end

    def index
    end

    def edit
      @thumbnail = @photo.photo_sizes.where(label: PhotoSize::MEDIUM).first.try(:url)
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

    def make_featured
      @item = @photo
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @photo
      @item.try(:remove_featured)
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
        @photos = Photo.order("publication_date DESC").limit(200)
      end

      def set_objects
        @albums = Album.order(:id)
        @tags = Tag.order(:name)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
        @news_articles = NewsArticle.order(:title)
      end
  end
end
