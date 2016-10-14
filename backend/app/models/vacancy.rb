class Vacancy < ApplicationRecord
  include Publishable

  validates :title, presence: true
end
