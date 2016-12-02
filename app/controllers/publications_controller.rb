# frozen_string_literal: true
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def index
    @publications = Publication.order(:title).published
    if params['content-types']
      @publications = @publications.where(content_type_id: params['content-types'])
    end
    if params[:tags]
      @publications = @publications.joins(:tags).where(tags: {id: params[:tags].split(/,/)})
    end
    @content_types = ContentType.where(for_content: ContentType::PUBLICATION).or(ContentType.where(for_content: ContentType::BOTH))
    @years = if Publication.any?
               (Publication.minimum(:created_at).year...Publication.maximum(:created_at).year)
             else
               [Date.today.year]
             end
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
