# frozen_string_literal: true
class MediaLibraryController < ApplicationController
  before_action :media_content, only: :show

  def index
    @media_contents = MediaContent.includes_mediable.order(:title).published
  end

  def show
  end

  private

    def media_content
      @media_content = MediaContent.find(params[:id])
    end
end
