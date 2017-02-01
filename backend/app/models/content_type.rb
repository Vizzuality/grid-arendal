# == Schema Information
#
# Table name: content_types
#
#  id          :integer          not null, primary key
#  for_content :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ContentType < ApplicationRecord
  has_many :contents

  ACTIVITY = "Activity"
  PUBLICATION = "Publication"
  FOR_CONTENT = [ACTIVITY, PUBLICATION]

  scope :by_publication, -> { where(for_content: ContentType::PUBLICATION)}
  scope :by_activity, -> { where(for_content: ContentType::ACTIVITY)}

  validates :title, presence: true
  validates :for_content, presence: true
  validates :for_content,
    inclusion: { in: FOR_CONTENT, message: "%{value} is not a valid value" }

  class << self
    def content_types(search, limit)
      if search.present? and search != ''
        ContentType
          .where("UPPER(title) like UPPER(?)", "%#{search}%")
          .order(:title)
      else
        ContentType.order(:title).limit(limit)
      end
    end
  end
end
