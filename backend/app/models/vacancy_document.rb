# frozen_string_literal: true
class VacancyDocument < ApplicationRecord
  include Attachable::Document

  belongs_to :vacancy
end
