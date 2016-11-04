# frozen_string_literal: true
class MediaLibraryController < ApplicationController
  before_action :set_publication, only: :show

  def index
    @publications = Activity.order(:title).published
  end

  def show
  end

  private

    def set_publication
    end
end
