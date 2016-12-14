# frozen_string_literal: true
class MediaLibraryController < ApplicationController
  before_action :media_content, only: :show

  def index
    @media_contents = MediaContent.order(:publication_date)
  end

  def show
  end

  private

    def media_content
      @media_content = MediaContent.find(params[:id])
    end
end
