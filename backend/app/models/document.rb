# frozen_string_literal: true
# == Schema Information
#
# Table name: documents
#
#  id                    :integer          not null, primary key
#  label                 :string
#  content_id            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#
# Foreign Keys
#
#  fk_rails_6177949e9e  (content_id => contents.id)
#

class Document < ApplicationRecord
  include Attachable::Document

  belongs_to :publication
end
