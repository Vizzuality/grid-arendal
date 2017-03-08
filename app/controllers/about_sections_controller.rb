# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @section = SiteSection.where(section: "about").first
    @sections  = AboutSection.order(:position)
    @vacancies = Vacancy.published
    @users = User.regular_staff.with_category.order(:first_name)
    @categories = @users.map(&:position_category).uniq
    @board_members = User.board_members.order(:last_name)
    @affiliates = User.affiliates.order(:last_name)
    @sections = @sections.
      where.not(category: "honorary-affiliate") unless @affiliates.any?
    @programmes = Activity.joins(:content_type).
      where(content_types: {title: ContentType::PROGRAMME}).order(:title)
    @annual_reports = Publication.published.joins(:content_type).
      where(content_types: {title: ContentType::ANNUAL_REPORT}).
      order(content_date: :desc, title: :asc)
  end
end
