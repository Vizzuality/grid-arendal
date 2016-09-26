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
#  partner_id                    :integer
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

  belongs_to :partner, optional: true

  has_attached_file :background_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true

  scope :order_by_title, -> { order('title ASC') }
end
