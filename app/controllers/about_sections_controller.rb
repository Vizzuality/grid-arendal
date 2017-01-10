# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @sections  = AboutSection.order(:title)
    @vacancies = Vacancy.published
    @users = User.where(is_board_member: false).limit(6)
    @board_members = User.where(is_board_member: true).order(:last_name)
    programme_tags = Tag.where(category: Tag::PROGRAMME)
    @programmes = Activity.where(title: programme_tags.map(&:name)).order(:title)
  end
end
