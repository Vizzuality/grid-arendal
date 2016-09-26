# frozen_string_literal: true
require_dependency "backend/application_controller"

module Backend
  class PublicationsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_publication, except: [:index, :new, :create]
    before_action :set_users_and_partners, only: [:new, :edit]

    def index
      @publications = Publication.order(:title)
    end

    def edit
    end

    def new
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

    def unpublish
      if @publication.try(:unpublish)
        redirect_to publications_path
      else
        redirect_to publication_path(@publication)
      end
    end

    def publish
      if @publication.try(:publish)
        redirect_to publications_path
      else
        redirect_to publication_path(@publication)
      end
    end


    private

      def set_publication
        @publication = Publication.find(params[:id])
      end

      def publication_params
        params.require(:publication).permit!
      end

      def set_users_and_partners
        @users = User.order(:first_name, :last_name)
        @partners = Partner.order(:name)
      end
  end
end
