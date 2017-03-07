class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:show]

  def show
  end

  private
  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end
end
