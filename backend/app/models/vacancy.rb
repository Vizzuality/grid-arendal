# frozen_string_literal: true
class Vacancy < ApplicationRecord
  include Publishable

  validates :title, presence: true

  class << self
    def vacancies(search, limit)
      if search.present? and search != ''
        Vacancy
          .where("UPPER(title) like UPPER(?)", "%#{search}%")
          .order(:title)
      else
        Vacancy.order(:title).limit(limit)
      end
    end
  end
end
