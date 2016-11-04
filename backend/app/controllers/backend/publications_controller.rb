# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class PublicationsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_users_and_partners, only: [:new, :edit]

    def index
      @publication = Publication.order(:title).first
      redirect_to edit_publication_url(@publication)
    end

    def edit
      @publications = Publication.order(:title)
    end

    def new
      @publications = Publication.order(:title)
      @publication = Publication.new
    end

    def update
      if @publication.update(publication_params)
        redirect_to publications_url, notice: 'Publication updated'
      else
        set_users_and_partners
        render :edit
      end
    end

    def create
      @publication = Publication.create(publication_params)
      if @publication.save
        redirect_to publications_url
      else
        set_users_and_partners
        render :new
      end
    end

    def publish
      @publication.try(:publish)
      redirect_to publications_url
    end

    def unpublish
      @publication.try(:unpublish)
      redirect_to publications_url
    end

    def make_featured
      @publication.try(:make_featured)
      redirect_to publications_url
    end

    def remove_featured
      @publication.try(:remove_featured)
      redirect_to publications_url
    end

    private

      def publication_params
        params.require(:publication).permit!
      end

      def set_users_and_partners
        @users    = User.order_by_fullname
        @partners = Partner.order_by_name
      end
  end
end
