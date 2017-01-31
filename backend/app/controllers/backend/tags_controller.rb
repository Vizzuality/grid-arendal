# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class TagsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_tag, only: [:edit, :update, :destroy]
    before_action :set_tags, only: [:index, :edit, :new]

    def index
    end

    def edit
    end

    def new
      @tag = Tag.new
    end

    def update
      if @tag.update(tag_params)
        redirect_to edit_tag_url(@tag), notice: 'Tag updated'
      else
        render :edit
      end
    end

    def create
      @tag = Tag.create(tag_params)
      if @tag.save
        redirect_to edit_tag_url(@tag), notice: 'Tag created'
      else
        render :new
      end
    end

    def destroy
      if @tag.destroy
        redirect_to tags_url
      end
    end

    def paginate
      @items = Tag.order(:name)
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

    def search
      @items = if params[:search] != ''
                 Tag
                   .where("UPPER(name) like UPPER(?)", "#{params[:search]}%")
                   .order(:name)
               else
                 Tag.order(:name).limit(@index_items_limit * @page)
               end
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        format.js { render 'backend/shared/index_items_searched' }
      end
    end

    private

      def set_tag
        @tag = Tag.find(params[:id])
      end

      def set_tags
        @activities = if @search.present?
                      Tag
                          .where("UPPER(name) like UPPER(?)", "#{@search}%")
                          .order(:name)
                      else
                        Tag.order(:name).limit(@index_items_limit * @page)
                      end
      end

      def tag_params
        params.require(:tag).permit!
      end
  end
end
