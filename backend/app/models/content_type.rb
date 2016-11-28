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

  BOTH = "Activity and Publication"
  ACTIVITY = "Activity"
  PUBLICATION = "Publication"
  FOR_CONTENT = [BOTH, ACTIVITY, PUBLICATION]

  validates :title, presence: true
  validates :for_content, presence: true
  validates :for_content,
    inclusion: { in: FOR_CONTENT, message: "%{value} is not a valid value" }
end
