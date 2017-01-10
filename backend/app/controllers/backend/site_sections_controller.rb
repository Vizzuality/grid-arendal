# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class SiteSectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_site_section,  except: [:index]
    before_action :set_site_sections

    def index
    end

    def edit
    end

    def update
      if @site_section.update(site_section_params)
        redirect_to [:edit, @site_section], notice: 'Section updated'
      else
        render :edit
      end
    end

    def destroy
      @site_section = SiteSection.find(params[:id])
      if @site_section.destroy
        redirect_to site_sections_url
      end
    end

    private

      def set_site_section
        @site_section = SiteSection.find(params[:id])
      end

      def set_site_sections
        @site_sections = SiteSection.order(:section)
      end

      def site_section_params
        params.require(:site_section).permit!
      end
  end
end
