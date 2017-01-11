# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @sections  = AboutSection.order(:position)
    @vacancies = Vacancy.published
    @users = User.where(is_board_member: false).order(:first_name)
    @board_members = User.where(is_board_member: true).order(:last_name)
    @programmes = Activity.joins(:content_type).
      where(content_types: {title: 'Programme'}).order(:title)
    @annual_reports = Publication.published.joins(:content_type).
      where(content_types: {title: 'Annual Report'}).
      order(content_date: :desc, title: :asc)
  end
end
