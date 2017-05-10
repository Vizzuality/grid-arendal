# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @section = SiteSection.where(section: "about").first
    @sections  = AboutSection.order(:position)
    @users = User.regular_staff.with_category.order(:first_name)
    @categories = @users.map(&:position_category).uniq

    @vacancies = Vacancy.published.order(:title)
    @board_members = User.board_members.order(:last_name)
    @affiliates = User.affiliates.order(:last_name)
    @programmes = Activity.programmes
    @annual_reports = Publication.published.joins(:content_type).
      where(content_types: {title: ContentType::ANNUAL_REPORT}).
      order(content_date: :desc, title: :asc)

    not_in = []
    not_in << "vacancies" unless @vacancies.any?
    not_in << "board" unless @board_members.any?
    not_in << "honorary-affiliate" unless @affiliates.any?
    not_in << "annual-reports" unless @annual_reports.any?
    @sections = @sections.
      where.not(category: not_in) unless not_in.empty?
  end

  def disclaimer
  end
end
