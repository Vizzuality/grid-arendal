# frozen_string_literal: true
class MediaLibraryController < ApplicationController
  before_action :media_content, only: :show

  def index
    @media_contents = MediaContent.wo_photos_in_album
                        .includes(:photo_sizes, :photos)
                        .order("publication_date DESC")
    @tags = Tag.order(:name)
    @section = SiteSection.where(section: "media_library").first
  end

  def show
  end

  private

    def media_content
      @media_content = MediaContent.wo_photos_in_album
                         .includes(:photo_sizes, :photos)
                         .find(params[:id])
    end
end
