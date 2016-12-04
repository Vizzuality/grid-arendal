# == Schema Information
#
# Table name: documents
#
#  id               :integer          not null, primary key
#  label            :string
#  doc_file_name    :string
#  doc_content_type :string
#  doc_file_size    :integer
#  doc_updated_at   :datetime
#  publication_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Document < ApplicationRecord
  include Attachable::Picture

  PRE_DEFINED_LABELS = ["PDF", "E-Book"]
  belongs_to :publication
end