# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @sections  = AboutSection.order(:position)
    @vacancies = Vacancy.published
    @users = User.where(is_board_member: false).limit(6)
    @board_members = User.where(is_board_member: true).order(:last_name)
    @programmes = Activity.joins(:content_type).
      where(content_types: {title: 'Programme'}).order(:title)
  end
end
