# frozen_string_literal: true
require_dependency "backend/application_controller"

module Backend
  class VacanciesController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_vacancies, only: [:index, :edit, :new]

    def index
    end

    def edit
    end

    def new
      @vacancy = Vacancy.new
    end

    def update
      if @vacancy.update(vacancy_params)
        redirect_to edit_vacancy_url(@vacancy), notice: 'Vacancy updated'
      else
        set_vacancies
        render :edit
      end
    end

    def create
      @vacancy = Vacancy.create(vacancy_params)
      if @vacancy.save
        redirect_to edit_vacancy_url(@vacancy), notice: 'Vacancy created'
      else
        set_vacancies
        render :new
      end
    end

    def publish
      @item = @vacancy
      @item.try(:publish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def unpublish
      @item = @vacancy
      @item.try(:unpublish)
      respond_to do |format|
        format.js { render 'backend/shared/index_options' }
      end
    end

    def paginate
      @items = Vacancy.order(:title)
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
                 Vacancy
                   .where("UPPER(title) like UPPER(?)", "#{params[:search]}%")
                   .order(:title)
               else
                 Vacancy.order(:title).limit(@index_items_limit * @page)
               end
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        format.js { render 'backend/shared/index_items_searched' }
      end
    end

    private

      def vacancy_params
        params.require(:vacancy).permit!
      end

      def set_vacancies
        @vacancies = if @search.present?
                      Vacancy
                        .where("UPPER(title) like UPPER(?)", "#{@search}%")
                        .order(:title)
                      else
                        Vacancy.order(:title).limit(@index_items_limit * @page)
                      end
      end
  end
end
