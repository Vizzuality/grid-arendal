# frozen_string_literal: true
class MediaLibraryController < ApplicationController

  def index
    @publications = Publication.order(:title).published
  end

  def show
  end

end
