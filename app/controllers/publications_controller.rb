# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.order(:title).published
    @content_types = ContentType.where(for_content: ContentType::PUBLICATION).or(ContentType.where(for_content: ContentType::BOTH))
    @years = (Publication.minimum(:created_at).year...Publication.maximum(:created_at).year)
    @tags = Tag.order(:name)
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
