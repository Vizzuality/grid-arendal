# frozen_string_literal: true
# == Schema Information
#
# Table name: about_sections
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AboutSection < ApplicationRecord
  validates :title, presence: true

  CATEGORIES = ["annual-reports", "board", "programmes", "staff", "vacancies"]

  class << self
    def about_sections(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        AboutSection
          .where(query_where, "%#{params[:search]}%")
          .order(:position)
      else
        AboutSection.order(:position).limit(limit)
      end
    end
  end
end
