# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class AboutSectionsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_about_section,  except: [:index, :new, :create]
    before_action :set_about_sections, except: :index

    def index
    end

    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end

    def new
      @about_section = AboutSection.new
      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      if @about_section.update(about_section_params)
        redirect_to about_sections_url, notice: 'AboutSection updated'
      else
        render :edit
      end
    end

    def create
      @about_section = AboutSection.create(about_section_params)
      if @about_section.save
        redirect_to about_sections_url
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

    private

      def set_about_section
        @about_section = AboutSection.find(params[:id])
      end

      def set_about_sections
        @about_sections = AboutSection.order(:title)
      end

      def about_section_params
        params.require(:about_section).permit!
      end
  end
end
