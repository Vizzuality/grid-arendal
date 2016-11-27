# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class TagsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_tag, only: [:edit, :update, :destroy]
    before_action :set_tags

    def index
    end

    def edit
    end

    def new
      @tag = Tag.new
    end

    def update
      if @tag.update(tag_params)
        redirect_to tags_url, notice: 'Tag updated'
      else
        render :edit
      end
    end

    def create
      @tag = Tag.create(tag_params)
      if @tag.save
        redirect_to tags_url
      else
        render :new
      end
    end

    def destroy
      if @tag.destroy
        redirect_to tags_url
      end
    end

    private

      def set_tag
        @tag = Tag.find(params[:id])
      end

      def set_tags
        @tags = Tag.order(:name)
      end

      def tag_params
        params.require(:tag).permit!
      end
  end
end
