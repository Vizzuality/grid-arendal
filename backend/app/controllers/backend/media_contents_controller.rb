# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class MediaContentsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_media_content, except: [:index, :new, :create]
    before_action :set_flickr

    def index
      @media_contents = MediaContent.includes_mediable.order_by_title
    end

    def edit
    end

    def new
      @media_content = MediaContent.new
    end

    def update
      update_params = media_content_params.except(:photo_file, :main_photo_file, :album_photos_attributes)
      if @media_content.update(update_params)
        madiable_params = media_content_params.merge(photo_id: @media_content.photo_id,
                                                     photoset_id: @media_content.photoset_id,
                                                     title: @media_content.title,
                                                     description: @media_content.description)
        FlickrService.update_asset(@media_content, madiable_params)
        redirect_to media_contents_url, notice: 'MediaContent updated.'
      else
        flash[:alert] = @media_content.errors.full_messages.join(', ')
        redirect_to action: 'edit', mediable: media_content_params[:mediable]
      end
    end

    def create
      @media_content = MediaContent.new(media_content_params.except(:photo_file, :album_photos_attributes))

      if @media_content.save
        FlickrService.set_asset(@media_content, media_content_params)
        redirect_to media_contents_url, notice: 'MediaContent was successfully created.'
      else
        flash[:alert] = @media_content.errors.full_messages.join(', ')
        redirect_to action: 'new', mediable: media_content_params[:mediable]
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
      redirect_to media_contents_url
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
