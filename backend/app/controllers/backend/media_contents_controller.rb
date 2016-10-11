# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class MediaContentsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_media_content, except: [:index, :new, :create]
    before_action :set_flickr,        only:   [:index, :create, :destroy]

    def index
      @media_contents = MediaContent.includes_mediable.order_by_title
    end

    def edit
    end

    def new
      @media_content = MediaContent.new
    end

    def update
      if @media_content.update(media_content_params)
        redirect_to media_contents_url, notice: 'MediaContent updated'
      else
        render :edit
      end
    end

    def create
      @media_content = if media_content_params[:photo_file].present? || media_content_params[:main_photo_file].present?
                         MediaContent.new(media_content_params.except(:photo_file, :main_photo_file))
                       else
                         MediaContent.new(media_content_params)
                       end

      respond_to do |format|
        if @media_content.save
          FlickrService.set_asset(@media_content, media_content_params)
          format.html { redirect_to media_contents_url, notice: 'MediaContent was successfully created.' }
          format.json { render action: 'show', status: :created, location: @media_content }
        else
          format.html { render action: 'new' }
          format.json { render json: @media_content.errors, status: :unprocessable_entity }
        end
      end
    end

    def unpublish
      if @media_content.try(:unpublish)
        redirect_to media_contents_path
      else
        redirect_to media_content_path(@media_content)
      end
    end

    def publish
      if @media_content.try(:publish)
        redirect_to media_contents_path
      else
        redirect_to media_content_path(@media_content)
      end
    end

    def destroy
      FlickrService.delete_asset(@media_content)
      @media_content.destroy
      respond_to do |format|
        format.html { redirect_to media_contents_url }
        format.json { head :no_content }
      end
    end

    private

      def set_media_content
        @media_content = MediaContent.find(params[:id])
      end

      def set_flickr
        FlickRaw.api_key       = ENV['API_KEY']
        FlickRaw.shared_secret = ENV['SHARED_SECRET']
        flickr.access_token    = ENV['ACCESS_TOKEN']
        flickr.access_secret   = ENV['ACCESS_SECRET']
      end

      def media_content_params
        params.require(:media_content).permit!
      end
  end
end
