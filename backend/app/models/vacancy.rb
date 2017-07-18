# frozen_string_literal: true
# == Schema Information
#
# Table name: vacancies
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  is_published  :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  starting_date :date
#  ending_date   :date
#  vacancy_type  :string
#  user_id       :integer
#  duration      :string
#
# Foreign Keys
#
#  fk_rails_e98e4c98dd  (user_id => users.id)
#

class Vacancy < ApplicationRecord
  include Publishable

  belongs_to :user
  has_many :vacancy_activities, dependent: :destroy
  has_many :activities, through: :vacancy_activities, source: :activity
  has_many :documents, class_name: "VacancyDocument", dependent: :destroy
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true

  class << self
    def vacancies(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Vacancy
          .where(query_where, "%#{params[:search]}%")
          .order(:title)
      else
        Vacancy.order(:title).limit(limit)
      end
    end
  end
end
