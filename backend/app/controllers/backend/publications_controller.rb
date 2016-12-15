# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class PublicationsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_objects, only: [:new, :edit]
    before_action :publications,


    def index
    end

    def edit
      @publication = Publication.find(params[:id])
    end

    def new
      @publication = Publication.new
    end

    def update
      if @publication.update(publication_params)
        redirect_to edit_publication_url(@publication),
          notice: 'Publication updated'
      else
        set_objects
        render :edit
      end
    end

    def create
      @publication = Publication.create(publication_params)
      if @publication.save
        redirect_to edit_publication_url(@publication),
          notice: 'Publication created'
      else
        set_objects
        render :new
      end
    end

    def destroy
      @publication = Publication.find(params[:id])
      if @publication.destroy
        redirect_to publications_url
      end
    end

    def publish
      @item = @publication
      @item.try(:publish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def unpublish
      @item = @publication
      @item.try(:unpublish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def make_featured
      @item = @publication
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @publication
      @item.try(:remove_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    private

      def publication_params
        params.require(:publication).permit!
      end

      def publications
        @publications = Publication.order("content_date DESC")
      end

      def set_objects
        @users    = User.order_by_fullname
        @partners = Partner.order_by_name
        @content_types = ContentType.
          where(for_content: [ContentType::BOTH, ContentType::PUBLICATION]).
          order(:title)
        @tags = Tag.order(:name)
        @photos = Photo.order("publication_date DESC").includes(:photo_sizes).
          limit(20)
        @news_articles = NewsArticle.order(:title)
        @activities = Activity.order(:title)
      end
  end
end
