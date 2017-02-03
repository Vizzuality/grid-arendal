# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AboutSectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_about_section,  except: [:index, :new, :create, :sort, :paginate]
    before_action :set_about_sections, except: [:destroy, :create, :update, :sort, :paginate]

    def index
    end

    def edit
    end

    def new
      @about_section = AboutSection.new
    end

    def update
      if @about_section.update(about_section_params)
        redirect_to [:edit, @about_section], notice: 'Section updated'
      else
        set_about_sections
        render :edit
      end
    end

    def create
      @about_section = AboutSection.create(about_section_params)
      if @about_section.save
        redirect_to [:edit, @about_section], notice: 'Section created'
      else
        set_about_sections
        render :new
      end
    end

    def destroy
      @about_section = AboutSection.find(params[:id])
      if @about_section.destroy
        redirect_to about_sections_url
      end
    end

    def sort
      params[:item].each_with_index do |id, index|
        AboutSection.where(id: id).update_all(position: index+1)
      end
      render nothing: true
    end

    def paginate
      @items = AboutSection.order(:position)
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

      def set_about_section
        @about_section = AboutSection.find(params[:id])
      end

      def set_about_sections
        @about_sections = AboutSection.about_sections(AboutSection.filter_params(params), @index_items_limit * @page)
      end

      def about_section_params
        params.require(:about_section).permit!
      end
  end
end
