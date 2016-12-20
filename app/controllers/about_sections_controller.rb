# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @sections  = AboutSection.order(:title)
    @vacancies = Vacancy.published
    @users = User.limit(6)
    programme_tags = Tag.where(category: Tag::PROGRAMME)
    @programmes = Activity.where(title: programme_tags.map(&:name)).order(:title)
  end
end
