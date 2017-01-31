# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class SiteSectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_site_section,  except: [:index, :paginate, :search]
    before_action :set_site_sections
    before_action :set_photos, only: [:edit]

    def index
    end

    def edit
    end

    def update
      if @site_section.update(site_section_params)
        redirect_to [:edit, @site_section], notice: 'Section updated'
      else
        set_photos
        render :edit
      end
    end

    def destroy
      @site_section = SiteSection.find(params[:id])
      if @site_section.destroy
        redirect_to site_sections_url
      end
    end

    def paginate
      @items = SiteSection.order(:section)
                 .limit(@index_items_limit)
                 .offset(@index_items_limit * (@page - 1))
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        if(@items.empty?)
          head :no_content
        end
        format.js { render 'backend/shared/index_items_paginate' }
      end
    end

    private

      def set_site_section
        @site_section = SiteSection.find(params[:id])
      end

      def set_site_sections
        @site_sections = SiteSection.site_sections(@search, @index_items_limit * @page)
      end

      def site_section_params
        params.require(:site_section).permit!
      end

      def set_photos
        @photos = Photo
          .order_by_date_behind_value(@site_section.photo_id.present? ? @site_section.photo_id : 0)
          .includes(:photo_sizes)
          .limit(20)
      end
  end
end
