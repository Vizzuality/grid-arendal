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

  def is_programme?
    content_type && content_type.title == "Programme"
  end

  class << self
    def fetch_all(options)
      tags = options['tags'].split(',')               if options['tags'].present?
      type = options['type']                          if options['type'].present?
      partners = options['partners']                  if options['partners'].present?
      programme = options['programme'] if options['programme'].present?
      status = options['status'] if options['status'].present?

      activities = Activity.by_published.order_by_title
      activities = activities.by_tags(tags)   if tags.present?
      activities = activities.by_type(type)   if type.present?
      activities = activities.by_partners(partners)   if partners.present?
      activities = activities.by_tags(programme) if programme.present?
      activities = activities.by_status(status)   if status.present?
      activities
    end
  end
end
