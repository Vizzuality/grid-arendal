# frozen_string_literal: true
# == Schema Information
#
# Table name: contents
#
#  id                   :integer          not null, primary key
#  type                 :string
#  title                :string
#  description          :text
#  is_published         :boolean
#  position             :integer
#  story_map_url        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Publication < Content
  acts_as_taggable

  has_many :related_contents
  has_many :activities, through: :related_contents
  has_many :documents
  accepts_nested_attributes_for :documents, reject_if: :all_blank,
    allow_destroy: true

  scope :order_by_title, -> { order('title ASC') }
end
