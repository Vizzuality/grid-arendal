# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.order(:title).published
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
