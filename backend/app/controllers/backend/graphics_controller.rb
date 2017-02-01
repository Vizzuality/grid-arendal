# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class GraphicsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_graphic, except: [:index, :new, :create, :paginate]
    before_action :set_graphics, only: [:index, :edit, :new]
    before_action :set_objects, only: [:edit, :new]

    def index
    end

    def edit
      @thumbnail = @graphic.photo_sizes.
        where(label: PhotoSize::MEDIUM).first.try(:url)
      @graphic.build_eps unless @graphic.eps
      @graphic.build_pdf unless @graphic.pdf
    end

    def update
      if @graphic.update(graphic_params)
        redirect_to edit_graphic_url(@graphic),
          notice: 'Graphic updated'
      else
        set_graphics
        set_objects
        render :edit
      end
    end

    def make_featured
      @item = @graphic
      @item.try(:make_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def remove_featured
      @item = @graphic
      @item.try(:remove_featured)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def destroy
      if @graphic.destroy
        redirect_to graphics_url
      end
    end

    def paginate
      @items = Graphic.order(publication_date: :desc)
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

      def graphic_params
        params.require(:graphic).permit!
      end

      def set_graphic
        @graphic = Graphic.find(params[:id])
      end

      def set_graphics
        @graphics = Graphic.graphics(@search, @index_items_limit * @page)
      end

      def set_objects
        @tags = Tag.order(:name)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
        @news_articles = NewsArticle.order(:title)
      end
  end
end
