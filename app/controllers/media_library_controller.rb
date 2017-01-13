# frozen_string_literal: true
class MediaLibraryController < ApplicationController
  before_action :media_content, only: :show
  before_action :set_media_contents_limit, only: [:index, :paginate]
  before_action :set_page_param, only: [:index, :paginate]

  def index
    @media_contents = MediaContent.fetch_all(options_filter).
                        limit(@media_contents_limit * @page)
    @tags = Tag.for_media_content
    @types = MediaContent.select(:type).distinct.wo_photos_in_album.order(:type)
    @section = SiteSection.where(section: "media_library").first
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @media_contents.to_json }
    end
  end

  def show
  end

  def paginate
    @media_contents = MediaContent.fetch_all(options_filter).
                        limit(@media_contents_limit).
                        offset(@media_contents_limit * (@page - 1))
    respond_to do |format|
      if(@media_contents.empty?)
        head :no_content
      end
      format.js
    end
  end

  private
    def options_filter
      params.permit(:media, :tags)
    end

    def media_content
      @media_content = MediaContent.find(params[:id])
    end
    def set_page_param
      @page = params[:page].present? ? params[:page].to_i : 1
    end
    def set_media_contents_limit
      @media_contents_limit = 16
    end
end
