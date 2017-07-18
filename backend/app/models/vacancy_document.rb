# frozen_string_literal: true
# == Schema Information
#
# Table name: vacancy_documents
#
#  id                    :integer          not null, primary key
#  label                 :string
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#  vacancy_id            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Foreign Keys
#
#  fk_rails_018b6b06f0  (vacancy_id => vacancies.id)
#

class VacancyDocument < ApplicationRecord
  include Attachable::Document

  belongs_to :vacancy
end
