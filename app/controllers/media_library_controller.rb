# frozen_string_literal: true
class MediaLibraryController < ApplicationController
  before_action :set_publication, only: :show

  def index
    @media_contents = MediaContent.includes_mediable.order(:title).published
  end

  def show
  end

  private

    def set_publication
    end
end
