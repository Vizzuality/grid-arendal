# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.order(:title)
  end

  def show
  end

  private

    def set_publication
      @publication = Publication.find(params[:id])
    end
end
