# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.order(:title).published
    #@years = (Publication.minimum(:created_at).year...Publication.maximum(:created_at).year)
    @years = (2012..2016)
  end

  def show
    @publications = Publication.order(:title).published
    @users = @publication.users
  end

  private
    def set_publication
      @publication = Publication.find(params[:id])
    end
end
