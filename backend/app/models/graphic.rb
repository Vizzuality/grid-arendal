# frozen_string_literal: true
# == Schema Information
#
# Table name: media_contents
#
#  id               :integer          not null, primary key
#  external_id      :integer
#  external_url     :string
#  type             :string
#  author           :string
#  licence          :string
#  publication_date :date
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Graphic < MediaContent
  acts_as_taggable
  belongs_to :photo
  belongs_to :eps, class_name: "MediaAttachment", foreign_key: :eps_id
  accepts_nested_attributes_for :eps
  belongs_to :pdf, class_name: "MediaAttachment", foreign_key: :pdf_id
  accepts_nested_attributes_for :pdf
end
