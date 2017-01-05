# frozen_string_literal: true
# == Schema Information
#
# Table name: events
#
#  id                            :integer          not null, primary key
#  title                         :string
#  description                   :text
#  web_url                       :string
#  background_image_file_name    :string
#  background_image_content_type :string
#  background_image_file_size    :integer
#  background_image_updated_at   :datetime
#  active                        :boolean          default(FALSE), not null
#  deactivated_at                :datetime
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_events_on_partner_id  (partner_id)
#

class Event < ApplicationRecord
  include Activable
  include Sanitizable
  include Attachable::BackgroundImage
  include Attachable::SBackgroundImage

  has_many :event_partners
  has_many :partners, through: :event_partners

  validates :title, presence: true

  scope :order_by_title, -> { order('title ASC') }
end
