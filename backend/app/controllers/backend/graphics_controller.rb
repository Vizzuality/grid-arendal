# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class GraphicsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_graphic, except: [:index, :new, :create]
    before_action :set_graphics, only: [:index, :edit, :new]
    before_action :set_objects, only: [:edit, :new]

    def index
    end

    def edit
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

    def new
      @graphic.build_eps
      @graphic.build_pdf
    end

    def create
      debugger
      @graphic = Graphic.create(graphic_params)
      if @graphic.save
        redirect_to edit_graphic_url(@graphic),
          notice: 'Graphic created'
      else
        set_objects
        set_graphics
        render :new
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

    private

      def graphic_params
        params.require(:graphic).permit!
      end

      def set_graphic
        @graphic = Graphic.find(params[:id])
      end

      def set_graphics
        @graphics = Graphic.order(publication_date: :desc)
      end

      def set_objects
        @tags = Tag.order(:name)
        @publications = Publication.order(:title)
        @activities = Activity.order(:title)
        @news_articles = NewsArticle.order(:title)
        @photos = Photo.order("publication_date DESC").includes(:photo_sizes).
          limit(20)
      end
  end
end