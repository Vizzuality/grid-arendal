# frozen_string_literal: true
require_dependency "backend/application_controller"

module Backend
  class VacanciesController < ::Backend::ApplicationController
    load_and_authorize_resource

    def index
      @vacancies = Vacancy.order(:title)
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
      @vacancy.try(:publish)
      redirect_to vacancies_path
    end

    def unpublish
      @vacancy.try(:unpublish)
      redirect_to vacancies_path
    end

    private

      def vacancy_params
        params.require(:vacancy).permit!
      end
  end
end
