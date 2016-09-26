# frozen_string_literal: true
require_dependency "backend/application_controller"

module Backend
  class PublicationsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_publication, except: [:index, :new, :create]

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
        render :edit
      end
    end

    def create
      @publication = Publication.create(publication_params)
      if @publication.save
        redirect_to publications_url
      else
        render :new
      end
    end

    private

      def set_publication
        @publication = Publication.find(params[:id])
      end

      def publication_params
        params.require(:publication).permit!
      end
  end
end
