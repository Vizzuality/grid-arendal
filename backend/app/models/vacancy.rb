# frozen_string_literal: true
class Vacancy < ApplicationRecord
  include Publishable

  validates :title, presence: true
end
