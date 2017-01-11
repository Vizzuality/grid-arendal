# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @sections  = AboutSection.order(:position)
    @vacancies = Vacancy.published
    @users = User.regular_staff.with_category.order(:first_name)
    @categories = @users.map(&:position_category).uniq
    @board_members = User.board_members.order(:last_name)
    @programmes = Activity.joins(:content_type).
      where(content_types: {title: 'Programme'}).order(:title)
    @annual_reports = Publication.published.joins(:content_type).
      where(content_types: {title: 'Annual Report'}).
      order(content_date: :desc, title: :asc)
  end
end
