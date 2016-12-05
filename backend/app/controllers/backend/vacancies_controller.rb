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
        redirect_to vacancies_url, notice: 'Vacancy updated'
      else
        render :edit
      end
    end

    def create
      @vacancy = Vacancy.create(vacancy_params)
      if @vacancy.save
        redirect_to vacancies_url
      else
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

    private

      def vacancy_params
        params.require(:vacancy).permit!
      end

      def set_vacancies
        @vacancies = Vacancy.order(:title)
      end
  end
end
