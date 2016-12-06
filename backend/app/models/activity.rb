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

class Activity < Content
  has_many :related_contents
  has_many :publications, through: :related_contents

  acts_as_taggable

  scope :by_partners, ->(partners) { joins(:content_partners).where(content_partners: {id: partners})}

  class << self
    def fetch_all(options)
      type = options['type']                          if options['type'].present?
      partners = options['partners']                  if options['partners'].present?

      activities = Activity.by_published.order_by_title
      activities = activities.by_type(type)   if type.present?
      activities = activities.by_partners(partners)   if partners.present?
      activities
    end
  end
end
