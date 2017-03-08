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

  PROGRAMME = "Programme"
  ANNUAL_REPORT = "Annual Report"

  scope :by_publication, -> { where(for_content: ContentType::PUBLICATION)}
  scope :by_activity, -> { where(for_content: ContentType::ACTIVITY)}

  validates :title, presence: true
  validates :for_content, presence: true
  validates :for_content,
    inclusion: { in: FOR_CONTENT, message: "%{value} is not a valid value" }

  class << self
    def content_types(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        ContentType
          .where(query_where, "%#{params[:search]}%")
          .order(:title)
      else
        ContentType.order(:title).limit(limit)
      end
    end
  end
end
