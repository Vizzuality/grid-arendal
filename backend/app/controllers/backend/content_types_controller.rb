# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class ContentTypesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_content_type, only: [:edit, :update, :destroy]
    before_action :set_content_types

    def index
    end

    def edit
    end

    def new
      @content_type = ContentType.new
    end

    def update
      if @content_type.update(content_type_params)
        redirect_to content_types_url, notice: 'ContentType updated'
      else
        render :edit
      end
    end

    def create
      @content_type = ContentType.create(content_type_params)
      if @content_type.save
        redirect_to content_types_url
      else
        render :new
      end
    end

    def destroy
      if @content_type.destroy
        redirect_to content_types_url
      end
    end

    private

      def set_content_type
        @content_type = ContentType.find(params[:id])
      end

      def set_content_types
        @content_types = ContentType.order(:title)
      end

      def content_type_params
        params.require(:content_type).permit!
      end
  end
end
