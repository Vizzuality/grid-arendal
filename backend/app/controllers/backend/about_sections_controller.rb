# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AboutSectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_about_section,  except: [:index, :new, :create, :sort]
    before_action :set_about_sections, except: [:destroy, :create, :update, :sort]

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
        render :edit
      end
    end

    def create
      @about_section = AboutSection.create(about_section_params)
      if @about_section.save
        redirect_to [:edit, @about_section], notice: 'Section created'
      else
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

    private

      def set_about_section
        @about_section = AboutSection.find(params[:id])
      end

      def set_about_sections
        @about_sections = AboutSection.order(:position)
      end

      def about_section_params
        params.require(:about_section).permit!
      end
  end
end
